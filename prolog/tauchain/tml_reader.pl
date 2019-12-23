% :- module(tml_reader,[parse_tml/2,test_tml_r/1,show_tml_read/1]).

:- use_module(library(logicmoo_common)).


always(G):- G*->true;throw(not_always(G)).
always(G,H,T):- always(phrase(G,H,T)),!.
quietly(G,H,T):- quietly(notrace(phrase(G,H,T))),!.
text_to_string_always(T,S):- always(text_to_string(T,S)).

null --> ``.
optional(X) --> X ; null.
some(P) --> (P, optional(some(P))),!.

into_comment(T,'@comment'(S)) --> ws, {text_to_string_always(T,S)}.

:- set_prolog_flag(back_quotes, codes).

into_codes_list(String, Chars):- current_prolog_flag(back_quotes, chars),!,
   into_codes_list_s(String, Codes), atom_codes(Atom,Codes),atom_codes(Atom,Chars).
into_codes_list(String, Codes):- into_codes_list_s(String, Codes).

into_codes_list_s(String, Codes) :- \+ is_list(String),!, atom_codes(String,Codes).
into_codes_list_s([S|String], Codes) :- \+ integer(S),!,atom_chars(Atom,[S|String]),atom_codes(Atom,Codes).
into_codes_list_s(Codes, Codes).

parse_tml(String, ExprsVs) :- 
  parse_tml(file_lineS, String, ExprsVs).

parse_tml(Pred, String, ExprsVs) :- 
 into_codes_list(String, CodesL), 
 append(CodesL,[10],Codes),
 PPred =.. [Pred,Exprs],
 phrase(PPred, Codes),
 intro_vars(Exprs,ExprsVs,_).


intro_vars(Exprs,ExprsVs,_):- Exprs=ExprsVs.

parsing_error(String, error(Exprs)) :- into_codes_list(String, Codes), phrase(arg_list(wst,Exprs), Codes).
 

file_lineS(XX) --> wsp, !, file_lineS(XX).
file_lineS([E|Es]) --> item(file_line(E)),!, file_lineS(Es).
file_lineS([]) --> ws.

file_line(Head) --> item(file_1line(Head)),optional(`.`).

file_1line(S) --> `#`,!,read_string_until_no_esc(T,eoln),into_comment(T,S).
file_1line(S) --> `/*`,!,read_string_until_no_esc(T,`*/`),into_comment(T,S).
file_1line('@finline'(S)) --> `{`,!,file_lineS(S),`}`.
file_1line('@treequery'(A))       --> item(`!!`),!,pred_expr(A).
file_1line('@ask'(A))       --> item(`!`),!,pred_expr(A).
file_1line('@trace'(A))       --> item(`@trace`),!,ws,symbol(A).
file_1line(HeadBody) --> pred_expr(Head), `:-`, expr_list(Body), {list_to_conjuncts(Body,Conj),HeadBody =.. [(':-'),Head,Conj]}.
file_1line(Head) --> pred_expr(Head).


code_type(Type) --> [C],!, {code_type(C,Type)}.

arg_list(Sep,XX) --> wsp, !, arg_list(Sep,XX).
arg_list(Sep,[E|Es]) -->
    single_arg(E), optional(Sep),!,
    % single solution: longest input match
    arg_list(Sep,Es).
arg_list(_,[E]) --> single_arg(E).
arg_list(_,[]) --> [].


expr_list([E|Es]) -->
    item(pred_expr(E)), (`,` ; eoln ; ws ),
    !, % single solution: longest input match
    expr_list(Es).
expr_list([]) --> (`.`; ws).



eoln --> code_type(end_of_line).
ws --> some(wsp);null.
wsp --> code_type(space).
wst --> some(` `;`\t`),!, ws.
wstc --> ws,(`,`; wst).

% A number N is represented as n(N), a symbol S as s(S).
single_arg(N) --> wsp,! , single_arg(N).
single_arg(N)       --> tnumber(N).
single_arg(Text)    --> `"`, !, always(s_string_cont(`"`,Text)),!.
single_arg((List))  --> `(`, !, arg_list(wstc,List), `)`.
single_arg(X) --> pred_expr(X).
single_arg(A)       --> symbol(A).

item(Pred) --> ws,Pred,ws.

pred_expr(Pred) --> wsp, !, pred_expr(Pred).
pred_expr(Pred)    --> symbol(Cs),`(`, quietly(arg_list(wst,List)), {List\==[]}, item(`)`), {univ_holds(Pred,[Cs|List])}.
pred_expr(Pred)    --> symbol(Cs),`(`, !, quietly(arg_list(wstc,List)), {List\==[]}, item(`)`), {univ_holds(Pred,[Cs|List])}.
pred_expr(Pred)    --> symbol(Cs), wst, arg_list(wst,List), {List\==[]}, {univ_holds(Pred,[Cs|List])}.
pred_expr(not(A))  --> item(`~`),!,pred_expr(A).
pred_expr(A)       --> symbol(A).

univ_holds(Pred,[Cs|List]):- atom(Cs),!,Pred =.. [Cs|List].
univ_holds(Pred,[Cs|List]):- Pred =.. [holds,Cs|List].

symbol(_) --> `:`, !, {fail}.
symbol(Atom) --> `'`, always(s_string_cont(`'`,Text)),!, {atom_string(Atom,Text)}.
symbol('$VAR'(UAtom)) --> `?`,symbolr(Codes),!,{atom_codes(Atom,Codes),upcase_atom(Atom,UAtom)}.
symbol(Atom) --> quietly((symbolc(Codes),!,{atom_codes(Atom,Codes)})).
symbolc([A|As]) -->
    [A],
    { memberchk(A, `+/-*><=`) ; code_type(A, alpha) },
    symbolr(As).

symbolr([A|As]) -->
    [A],
    { memberchk(A, `+/-*><=`) ; code_type(A, alnum) },
    symbolr(As).
symbolr([]) --> [].


:- use_module(library(dcg/basics)).
tnumber(N) --> integer(N).
tnumber(N) --> float(N).
tnumber(N) --> number(N).
tnumber(N) --> numberc(Cs),!, { number_chars(N, Cs) }.
numberc([D|Ds]) --> digit(D), numberc(Ds).
numberc([D])    --> digit(D).
digitc(D) --> [D], { code_type(D, digit) }.

s_string_cont(Until, ``)             --> Until,!, ws.
s_string_cont(Until, Txt)                 --> read_string_until(S,Until), ws,{text_to_string_always(S,Txt)}.

sexpr_string(X)--> read_string_until(X,`"`).
%sexpr_string([C|S],End) --> `\\`,!, always(escaped_char(C)),!, sexpr_string(S,End).
%sexpr_string([],End) --> End, !.
% sexpr_string([32|S]) --> [C],{eoln(C)}, sexpr_string(S).
% sexpr_string([35, 36|S]) --> `&%`, !, sexpr_string(S).
%sexpr_string([C|S],End) --> [C],!,sexpr_string(S,End).

read_string_until_no_esc(String,End)--> read_string_until(noesc,String,End).

read_string_until(String,End)--> read_string_until(esc,String,End).

read_string_until(esc,[C|S],End) --> `\\`,!, always(escaped_char(C)),!, read_string_until(esc,S,End),!.
read_string_until(_,[],HB) --> HB, !.
read_string_until(Esc,[C|S],HB) --> [C],!,read_string_until(Esc,S,HB),!.


escaped_char(C) --> eoln,!,[C].
escaped_char(Code)  --> [C], {escape_to_char([C],Code)},!.
escape_to_char(Txt,Code):- notrace_catch_fail((sformat(S,'_=`\\~s`',[Txt]),read_from_chars(S,_=[Code]))),!.

%notrace_catch_fail(G):- !, call(G).
notrace_catch_fail(G):- quietly(catch(G,_,fail)),!.

%notrace_catch_fail(G,_E,_C):- !, call(G).
notrace_catch_fail(G,E,C):- quietly(catch(G,E,C)),!.

test_tml_r(X):- parse_tml(X,Codes),show_tml_read(Codes),!.
test_tml_r(X):- parsing_error(X,Codes),show_tml_read(Codes),!.

test_tml_r(Pred, X):- parse_tml(Pred, X,Codes),show_tml_read(Codes),!.

show_tml_read(X):- is_list(X),!, maplist(show_tml_read,X).
show_tml_read(X):- format('~NTML: ~q.~n',X).

%:- [qvar_rewriter].

:- test_tml_r("  
e(1 2).
e(2 1).
e(?x ?y) :- e(?x ?z), e(?z ?y).
").

:- test_tml_r("  
	~S(?x ?x):-S(?x ?x).
	~prog(?x ?x):-prog(?x ?x).
	~alt(?x ?x):-alt(?x ?x).
	~alts(?x ?x):-alts(?x ?x).
").



:- test_tml_r("  
a(b c).
a(b(c)).
").

:- test_tml_r("  
a(1 2 3).
rel('t' 1 2).
").

:- test_tml_r("  
b(?x).
@trace foo
").

:- test_tml_r("  
@trace bar.
r.
?hi.
!!rel('t' 1 2)
!rel('t' 1 2).
").

:- test_tml_r("  
a(b c).
a(b(c)).
{a(1 2 3).
rel('t' ?1 2).
b(?x).
r.}
!!rel('t' 1 2)
!rel('t' 1 2).
").

:- test_tml_r(" !! e ?x v1. ").
:- test_tml_r(" ! e ?x v1. ").

end_of_file.


:- test_tml_r(" 
#{
        e v1 v2.
#}
").

:- test_tml_r(" e ?x ?y :- e ?x ?z, e ?z ?y. ").


:- test_tml_r("
        e v2 v3.
        e v3 v4.
        e v4 v5.
        e v5 v1.
        e ?x ?y :- e ?x ?z, e ?z ?y.
       !! e ?x v1.
").

:- test_tml_r("
       !! e ?x v1.
{
       a b c d.
       ~e ?x ?x :- e ?x ?x.
}
").



end_of_file.


#{
@string str <tml.g>.

identifier => sym | var.
args => identifier ws args | null.
var => '?' chars.
sym => chars.
relname => sym.
chars => alpha chars1 | '_' chars1.
chars1=> alnum chars1 | '_' chars1 | null.
ws =>	space ws | ws '#' printable_chars eol ws | null.
terminal => quoted_char | string.
quoted_char => 	'\'' printable '\'' | "'\\r'" | "'\\n'"
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

directive =>	ws "@string" space ws strdir ws '.' ws |
		ws "@stdout" space ws term ws '.' ws |
		ws "@trace" space ws relname ws '.' ws |
		ws "@bwd" ws '.' ws.
strdir => relname ws fname | relname ws string | relname ws cmdline | relname ws term.

production => relname ws "=>" ws alt ws alts ws '.' ws.
alt =>	terminal ws alt ws | nonterminal ws alt ws | null.
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
#	~S(?x?x):-S(?x?x).
#	~prog(?x?x):-prog(?x?x).
#	~alt(?x?x):-alt(?x?x).
#	~alts(?x?x):-alts(?x?x).
#}


