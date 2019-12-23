% :- module(tml_reader,[parse_tml/2,test_tml/1,show_tml_read/1]).

:- use_module(library(logicmoo_common)).


:- [tml_reader].

run_tml(String):-
 into_codes_list(String, Chars),
 parse_tml(Chars, ExprsVs),
 show_tml_read(ExprsVs),!,
 dmsg("===SUCESSS===================="),!.
run_tml(_):- 
 dmsg(failed("===FAILED====================")),!.



:- [tml_testing].
check_tml_sample(Name:Data):-
  text_to_string(Data,SData),
  assert(tml_sample_name_data(Name,SData)),  
  dmsg("=============================="),
  dmsg("=============================="),
  dmsg("=============================="),
  dmsg("===NAME TEST====================="),
  dmsg(Name),
   dmsg("===INPUT===================="),
   dmsg(SData),
   dmsg("===PROCESS===================="),
   run_tml(SData).


:- tml_examples(List), 
   maplist(check_tml_sample,List).


end_of_file.

/*
%  NomicMUD: A MUD server written in Prolog
%  Maintainer: Douglas Miles
%  Dec 13, 2035
%
%  Bits and pieces:
%
%    LogicMOO, Inform7, FROLOG, Guncho, PrologMUD and Marty's Prolog Adventure Prototype
% 
%  Copyright (C) 2004 Marty White under the GNU GPL 
%  Sept 20,1999 - Douglas Miles
%  July 10,1996 - John Eikenberry 
%
%  Logicmoo Project changes:
%
% Main file.
%
*/
% Marty's Tokenizer/Scanner/Lexer, written in Prolog.
:- module(tml_interp,[readtokens/3,readline/2,
   clear_overwritten_chars/1,
   readtokens/1,
   redraw_prompt/1,
   player_format/2,
   player_format/3,
   bugout/2,
   bugout/3,

   pprint/2,
   init_logging/0,
   bug/1,
   agent_to_input/2,
   get_overwritten_chars/2,
   restore_overwritten_chars/1]).


:- use_module(library(editline)).
:- use_module(library(logicmoo_common)).
:- initialization('$toplevel':setup_readline,now).

:- dynamic(console_player/1).
:- dynamic(current_player/1).

:- dynamic(adv:console_info/7).
:- dynamic(adv:input_log/1).

dmust(X):- must(X).
dbug(BA):- dmsg(BA).

init_logging :-
  get_time(StartTime),
  convert_time(StartTime, StartTimeString),
  open('input.log', append, FH),
  format(FH, '\n==== TML INPUT, ~w\n', [StartTimeString]),
  asserta(adv:input_log(FH)).

:- dynamic(bugs/1). % Types of logging output.
%bugs([general, printer, planner, autonomous]).
bugs([general, planner, autonomous, telnet]).
%bugs([general, autonomous]).
bug(B) :-
  bugs(L),
  member(B, L).

bugout(A, B) :-
  bug(B),
  !,
  dbug(B:A).
bugout(_, _).

bugout(A, L, B) :-
  bug(B),
  !,
  ansi_format([fg(cyan)], '~N% ', []),
  ansi_format([fg(cyan)], A, L),
  dmust(console_player(Player)),
  dmust(redraw_prompt(Player)).
  
bugout(_, _, _).


pprint(Term, B) :-
  bug(B),
  !,
  player_format('~N~@~N',[prolog_pretty_print:print_term(Term, [output(current_output)])]),!.
pprint(_, _).

redraw_prompt(_Agent):- 
  console_player(Player),
   player_format(Player,'~w@spatial> ',[Player]),!.

redraw_prompt(Agent):- ( Agent \== floyd; Agent \== 'floyd~1'),!, 
  player_format(Agent,'~w@spatial> ',[Agent]),!.

redraw_prompt(_Agent).

player_format(Fmt,List):-
  current_player(Agent) ->
  player_format(Agent, Fmt,List).

player_format(Agent,Fmt,List):-
  agent_output(Agent,OutStream),
  dmust(format(OutStream,Fmt,List)),!.
player_format(_, Fmt,List):- format(Fmt,List).


agent_output(Agent,OutStream):- 
  adv:console_info(_Id,_Alias,_InStream,OutStream,_Host,_Peer, Agent).







% -- Split a list of chars into a leading identifier and the rest.
% Fails if list does not start with a valid identifier.
identifier([-1|_String], _, _) :- !, fail. % char_type pukes on -1 (EOF)
identifier([Char|String], [Char|Tail], Rest) :-
  char_type(Char, csym),
  identifier1(String, Tail, Rest).
identifier([Char|String], [Char|Tail], Rest) :-
  memberchk(Char, `-'`),
  identifier1(String, Tail, Rest).

identifier1(String, Id, Rest) :-
  identifier(String, Id, Rest), !.
identifier1(String, [], String).

% -- Split a list of chars into a leading token and the rest.
% Fails if list does not start with a valid token.
token(String, Token, Rest) :-
  identifier(String, Token, Rest), !.  % Is it an identifier?
%token(String,id(Atom),Rest) :-
%  identifier(String, Text, Rest), !, atom_codes(Atom,Text).
token([Punct|Rest], [Punct], Rest) :-
  %char_type(Punct, punct), !.  % Is it a single char token?
  memberchk(Punct, `,.?;:!&\"`), !.

% -- Completely tokenize a string.
% Ignores unrecognized characters.
tokenize([],[]) :- !.
tokenize([-1],[`quit`]) :- !.
tokenize(String, [Token|Rest]) :-
  token(String, Token, Tail),
  !,
  tokenize(Tail, Rest).
tokenize([_BadChar|Tail], Rest) :-
  !,
  tokenize(Tail, Rest).

log_codes([-1]).
log_codes(LineCodes) :-
  atom_codes(Line, LineCodes),
  adv:input_log(FH),
  format(FH, '>~w\n', [Line]).

% -- Input from stdin, convert to a list of atom-tokens.

readtokens(Tokens) :- current_player(Agent),readtokens(Agent,[],Tokens).

readtokens(In,Prev,Tokens):- 
  is_stream(In),!,
  New = '',
  setup_call_cleanup(prompt(Old,New),
     read_line_to_tokens(In,Prev,Tokens),
     prompt(_,Old)),
  !.
readtokens(Agent,Prev,Tokens) :- 
  agent_to_input(Agent,In),
  dmust(is_stream(In)),
  readtokens(In,Prev,Tokens),!.

read_line_to_tokens(In,Prev,Tokens):- 
  read_line_to_codes(In,LineCodesR), 
  append(Prev,LineCodesR,LineCodes),
  NegOne is -1,     
  dmust(line_to_tokens(LineCodes,NegOne,Tokens0)),!,
  dmust(Tokens0=Tokens).

line_to_tokens([],_,[]):-!.
line_to_tokens(NegOne,NegOne,[quit]):-!.
line_to_tokens([NegOne],NegOne,[quit]):-!.
line_to_tokens(LineCodes,_NegOne,Tokens) :- 
    append(_NewLineCodes,[L],LineCodes),
    member(L,[46]),read_term_from_codes(LineCodes,Term,
     [syntax_errors(fail),var_prefix(false),
        % variables(Vars),
        variable_names(_VNs),cycles(true),dotlists(true),singletons(_)]),
    Term=..Tokens,!.
line_to_tokens(LineCodes,NegOne,Tokens) :- 
  append(NewLineCodes,[L],LineCodes),
  member(L,[10,13,32,46]),!,
  line_to_tokens(NewLineCodes,NegOne,Tokens).
line_to_tokens(LineCodes,_,Tokens):- 
  ignore(log_codes(LineCodes)),!,
  tokenize(LineCodes, TokenCodes),!,
  % Convert list of list of codes to list of atoms:
  findall(Atom, (member(Codes, TokenCodes), atom_codes(Atom, Codes)), Tokens),  
  save_to_history(LineCodes),
  !.

save_to_history(LineCodes):- 
  ignore(notrace((atom_codes(AtomLineCodes, LineCodes), 
  catch(prolog:history(current_input, add(AtomLineCodes)), _, fail)))).




readlist(Agent,L) :-  % return a line of input, split into a list of words.
  readline(Agent,CL),
  wordlist(L, CL, []),
  !.

:- dynamic(overwritten_chars/2).

add_pending_input(Agent,C):- agent_to_input(Agent,In),add_pending_input0(In,C).
add_pending_input0(In,C):- retract(overwritten_chars(In,SoFar)),append(SoFar,[C],New),!,assert(overwritten_chars(In,New)).
add_pending_input0(In,C):- assert(overwritten_chars(In,[C])).

clear_overwritten_chars(Agent):- agent_to_input(Agent,In),retractall(overwritten_chars(In,_SoFar)).
restore_overwritten_chars(Agent):- agent_to_input(Agent,In),overwritten_chars(In,SoFar),format('~s',[SoFar]).

% agent_to_input(Agent,In):- overwritten_chars(Agent,_SoFar),In=Agent,
agent_to_input(Agent,In):- adv:console_info(_Id,_Alias,In,_OutStream,_Host, _Peer, Agent),!.
% agent_to_input(Agent,In):- stream_or_alias(In,Alias), stream_property(Agent,file_no(F)),stream_property(In,file_no(F)),stream_property(In,read),!.
agent_to_input(_Agent,In):- current_input(In).

user:bi:- agent_to_input('telnet~1',In),
   forall(stream_property(In,P),dmsg(ins(P))),
   %line_position(In,LIn),
   %dmsg(ins(line_position(In,LIn))),
   forall(stream_property('telnet~1',P),dmsg(outs(P))),listing(overwritten_chars),
   line_position('telnet~1',LInOut),!,
   dmsg(outs(line_position('telnet~1',LInOut))),!.

get_overwritten_chars(Agent,Chars):- agent_to_input(Agent,In),overwritten_chars(In,Chars).
get_overwritten_chars(_Agent,[]).

% readline(Agent,[]):- agent_to_input(Agent,In),at_end_of_stream(In),clear_overwritten_chars(Agent).
readline(Agent,L) :-  % return a line of input as a list of ASCII codes.
  % current_input(X),(overwritten_chars(In,Chars)->true;Chars=[]),
  clear_overwritten_chars(Agent),
  agent_to_input(Agent,In),
  stream_property(In,buffer(Was)),
  set_stream(In,buffer(false)),
  call_cleanup(((
  get0(In,C), add_pending_input(Agent,C),
    readlinetail(Agent,C, L))),
    set_stream(In,buffer(Was))),!.  

readlinetail(Agent,13, []):- clear_overwritten_chars(Agent).
readlinetail(Agent,10, []):- clear_overwritten_chars(Agent).
readlinetail(Agent,-1, [-1]) :- nl,clear_overwritten_chars(Agent).
% readlinetail(Agent,C, [C]):- at_end_of_stream,!, clear_overwritten_chars(Agent).
readlinetail(Agent,C, [C|X]) :-
  agent_to_input(Agent,In),
  get0(In,C2),
  add_pending_input(Agent,C2),
  readlinetail(Agent,C2, X).

wordlist(List) --> optional_ws, wordlist1(List), optional_ws.
optional_ws --> whitespace.
optional_ws --> {true}.
wordlist1(List) --> wordlist2(List).
wordlist1([]) --> {true}.
wordlist2([X|Y]) --> word(X), whitespace, wordlist2(Y).
wordlist2([X]) --> word(X).
%wordlist([X|Y]) --> word(X), whitespace, wordlist(Y).
%wordlist([X]) --> whitespace, wordlist(X).
%wordlist([X]) --> word(X).
%wordlist([X]) --> word(X), whitespace.

%word(W) --> charlist(X), {name(W,X)}.
word(W) --> charlist(X), {atom_codes(W,X)}.

charlist([X|Y]) --> chr(X), charlist(Y).
charlist([X]) --> chr(X).

chr(X) --> [X], {X>=48}.

whitespace --> whsp, !, whitespace.
whitespace --> ``.

whsp --> [X], {X<48}.


