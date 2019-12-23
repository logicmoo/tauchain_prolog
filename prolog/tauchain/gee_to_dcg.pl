
:- use_module(library(must_sanity)).
:- set_prolog_flag(double_quotes,codes).

% Mini DCG interpretor
%
% example 
%

optionally(G) --> G ; !.

zero_or_more(P)--> P, !, zero_or_more(P).
zero_or_more(_)--> !.

one_or_more(P)--> P, zero_or_more(P).

some(P) --> P, optionally(some(P)).

any([H|T],[H|TT],O):- !, any(T,TT,O).
any([],[],[]). % closes off infinites
any(S,S,[]).


end_of_file --> ([-1] ; [end_of_file] ; \+ [_]),!.
end_of_file(S,E):- S==[],!, E=[].


dcg_peek(Until,S,S) :- phrase(Until,S,_).

is_until(Until) --> dcg_peek(Until) ; end_of_file.

conj_until(Out, P, Until) --> call(P, A), 
 ( is_until(Until) -> {A = Out} ; conj_until(B, P, Until), {Out = (A,B)}).

seq_until([], _, Until) --> is_until(Until),!.
seq_until([H|T], P, Until) --> call(P, H), !, seq_until(T, P, Until).


until(Until,Stuff) --> until_0(Until,Stuff),Until.
until_0(Until,[C|Before]) --> "\\",[C],!,until_0(Until,Before).
until_0(DCG,[],[Found|Rest],[Found|Rest]):- phrase(DCG,[Found],[])-> true ; phrase(DCG,[Found|Rest],_).
until_0(DCG,[Skipped|Before],[Skipped|More],[Found|Rest]):- until_0(DCG,Before,More,[Found|Rest]).


% // =========                             
% //  Dot Gee
% // =========
gee_comment(Cmt) --> 
 ("//" ; "#") -> (until(eol,Cmt) ; any(Cmt)) ;
  "/*", any(Cmt), "*/".


white --> one_or_more(white_1).
white_1 --> eol ; ([W], {char_type(W,white)}) ; gee_comment(_).

eot --> sentence_op ; white.

eol --> `\r\n` ; `\r` ; `\n` .

sentence_op --> dcg_peek(`.`) ;  dcg_peek(`|`) ; dcg_peek(`=>`).

gee_token(Txt) -->  \+ sentence_op, 
  ({quotes(Q,EQ)}, (Q -> until(EQ, Txt) ; until_0(eot,Txt))).


padded(DCG) --> optionally(some(white)), DCG, optionally(some(white)).

gee_unit(DCG) --> ` `, !, gee_unit(DCG).
gee_unit(DCG) --> gee_unit_1(DCG), (eot;!). % trim off end

gee_unit_1(DCG,S,E) :-
  var(DCG) -> gee_token(Txt,S,E), name(DCG,Txt) ; % forward  
  atomic(DCG) -> name(DCG,Txt), gee_token(Txt,S,E) ; % reverse  
  phrase(DCG,S,E). % mixed


gee_dcg( end_of_file ) --> end_of_file, !.
gee_dcg( Out ) --> gee_dcg1( A ), (end_of_file -> {Out=A} ;  gee_dcg( B ) , {Out = (A,B)}).


gee_dcg1(DCG) --> (eol ; white), !, gee_dcg1(DCG).
gee_dcg1( comment(Comment) ) --> gee_comment(Codes), {name(Comment,Codes)}.
gee_dcg1( Out) --> gee_unit(L), (  "=>" -> gee_body(R), { Out = (L --> R)} ; gee_body(R), {Out = (:- do_gee(L,R))}), ".". 
gee_dcg1( done) --> [], !.

gee_body([]) --> `null`. 
gee_body(A;B) --> gee_body1(A), "|",  gee_body(B).
gee_body(Body) --> gee_body1(Body).

gee_body1(Body) --> conj_until( Body, gee_unit,  sentence_op).


qq_string(Data,_Args,_VarsIn, Result):- phrase_from_quasi_quotation(any(Result),Data).
:- quasi_quotation_syntax(qq_string).


quotes(`<`,`>`).
quotes(S,S):- quotes1(S).
quotes1(`"`). quotes1("'").    


gee(Data,_Args,_VarsIn,Result):- !,
  phrase_from_quasi_quotation((
   seq_until(Result, gee_dcg, end_of_file)),Data).
:- quasi_quotation_syntax(gee).
 

test_g:- phrase_from_file(({trace},conj_until(DCG, gee_dcg, end_of_file)), 'tml.g'),
  maplist(write_clauses, DCG).

write_clauses((A,B)):- !, write_clauses(A),write_clauses(B).
write_clauses(X):- writeq(X), nl.


:- write_clauses({|gee|| a => b. |}).

:- write_clauses({|gee|| a :- b. |}).

:- write_clauses({|gee|| a :- b((a b)). |}).


end_of_file.

 
 
% Prints out the DCG from

%:- phrase(seq_until(X,gee_unit,`.`), `@string a.` , O), O == `.`, X ==  ['@string', a].
 
%:-               (phrase(seq_until(O,gee_unit,`.`), `@string str <tml.g> .` , O)).

:- write_clauses({|gee||
 
   directive => ws "@string" space ws strdir ws '.' ws |
        ws "@stdout" space ws term ws '.' ws |
        ws "@trace" space ws relname ws '.' ws |
        ws "@bwd" ws '.' ws.
  strdir => relname ws fname | relname ws string | relname ws cmdline | relname ws term.
 
  |}).


% loads the DCG forms
{|gee||
 
#{
@string str <tml.g>.
 
identifier => sym | var.
args => identifier ws args | null.
var => '?' chars.
sym => chars.
relname => sym.
chars => alpha chars1 | '_' chars1.
chars1=> alnum chars1 | '_' chars1 | null.
ws =>   space ws | ws '#' printable_chars eol ws | null.
terminal => quoted_char | string.
quoted_char =>  '\'' printable '\'' | "'\\r'" | "'\\n'"
        | "'\\t'" | "'\\''" | "''".
eol => '\r' | '\n' | ''.
nonterminal => relname.
fname => '<' printable_chars '>' ws.
string => '"' printable_chars '"' ws.
printable_chars => printable printable_chars | null.
cmdline => '$' digits ws.
query => '!' ws term | "!!" ws term.
 
term => relname args.
pred => term | '~' ws term ws.
args => ws '(' ws args1 ws ')' ws | null.
args1 => identifier ws args1 ws | args | null.
 
directive =>    ws "@string" space ws strdir ws '.' ws |
        ws "@stdout" space ws term ws '.' ws |
        ws "@trace" space ws relname ws '.' ws |
        ws "@bwd" ws '.' ws.
strdir => relname ws fname | relname ws string | relname ws cmdline | relname ws term.
 
production => relname ws "=>" ws alt ws alts ws '.' ws.
alt =>  terminal ws alt ws | nonterminal ws alt ws | null.
alts => null | '|' ws alt ws alts ws.
 
fact => pred '.' ws.
preds => ws pred preds_rest.
preds_rest => ws ',' ws pred ws preds_rest | null.
rule => ws preds ws ":-" ws preds ws '.' ws.
 
fof => term ws ':' '=' ws form ws '.' ws.
form => term |
    ws prefix ws var ws '(' ws form ws ')' ws |
    ws '(' ws form ws ')' ws "and" ws '(' ws form ws ')' ws |
    ws '(' ws form ws ')' ws "or" ws '(' ws form ws ')' ws |
    ws "not" '(' ws form ws ')' ws |
    ws term ws "and" ws '(' ws form ws ')' ws |
    ws term ws "or" ws '(' ws form ws ')' ws |
    ws "not" '(' ws form ws ')' ws |
    ws term ws "and" ws term ws |
    ws term ws "or" ws term ws |
    ws "not" term ws |
    ws '(' ws form ws ')' ws "and" ws term ws |
    ws '(' ws form ws ')' ws "or" ws term ws.
prefix => "forall" | "exists" | "unique".
 
prog => directive S | rule S | production S | fof S | query S | null.
S => ws '{' ws prog ws '}' ws S ws | ws prog ws | null.
#}
#{
#   ~S(?x?x):-S(?x?x).
#   ~prog(?x?x):-prog(?x?x).
#   ~alt(?x?x):-alt(?x?x).
#   ~alts(?x?x):-alts(?x?x).
#}
|}).
 
 
                                                                                  
