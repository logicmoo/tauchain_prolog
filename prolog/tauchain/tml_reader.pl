% :- module(tml_reader,[parse_tml/2,test_tml_r/1,show_tml_read/1]).

:- use_module(library(logicmoo_common)).


always(G):- G*->true;throw(not_always(G)).
always(G,H,T):- always(phrase(G,H,T)),!.
quietly(G,H,T):- quietly(notrace(phrase(G,H,T))),!.
text_to_string_always(T,S):- always(text_to_string(T,S)).

null --> ``.
optional(X) --> X ; null.
some(P) --> (P, optional(some(P))),!.
peek(X,H,H):-phrase(X,H,_).
npeek(X,H,H):- \+ phrase(X,H,_).
           
into_codes_list(String, Chars):- current_prolog_flag(back_quotes, chars),!,
   into_codes_list_s(String, Codes), atom_codes(Atom,Codes),atom_chars(Atom,Chars).
into_codes_list(String, Codes):- into_codes_list_s(String, Codes).

into_codes_list_s(String, Codes) :- \+ is_list(String),!, atom_codes(String,Codes).
into_codes_list_s([S|String], Codes) :- \+ integer(S),!,atom_chars(Atom,[S|String]),atom_codes(Atom,Codes).
into_codes_list_s(Codes, Codes).

parse_tml(String, ExprsVs) :- 
  parse_tml(file_lineS, String, ExprsVs).

parse_tml(Pred, String, ExprsVs) :- 
 notrace((into_codes_list(String, CodesL), 
 append(CodesL,[10],Codes),
 PPred =.. [Pred,Exprs])),
 phrase(PPred, Codes),
 intro_vars(Exprs,ExprsVs,_).


intro_vars(Exprs,ExprsVs,_):- Exprs=ExprsVs.

parsing_error(String, error(Exprs)) :- into_codes_list(String, Codes), phrase(arg_list(wst,Exprs), Codes).
 

file_lineS(XX) --> wsp, !, file_lineS(XX).
file_lineS([E|Es]) --> item(file_line(E)),!, file_lineS(Es).
file_lineS([]) --> ws.

file_line(Head) --> item(file_1line(Head)),optional(`.`).

comment(T) --> `#`, !, read_string_until_no_esc(T,eoln).
comment(T) --> `/*`,!, read_string_until_no_esc(T,`*/`).

file_1line('@comment'(S))   --> comment(T), {text_to_string_always(T,S)}.
file_1line('@finline'(S))   --> `{`,!,file_lineS(S),`}`.
file_1line('@ask'(A))       --> item(`!`),(npeek(code_type(punct));peek(`~`)),!,pred_expr(A).
file_1line('@treequery'(A)) --> item(`!!`),!,pred_expr(A).
file_1line('@trace'(A))       --> item(`@trace`),!,ws,symbol(A).
file_1line(HeadBody) --> pred_expr(Head), item(`:-`), expr_list(Body), {list_to_conjuncts(Body,Conj),HeadBody =.. [(':-'),Head,Conj]}.
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



eoln --> code_type(end_of_line),!.
eoln --> [_],!,{fail}.
eoln --> ``.

ws --> some(wsp);null.
wsp --> code_type(space).
wsp --> comment(_).
wst --> some(` `;`\t`),!, ws.
wstc --> ws,(`,`; wst).

single_arg(N) --> wsp,! , single_arg(N).
single_arg(N) --> single_arg_np(N).
single_arg(X) --> pred_expr(X).

single_arg_np(N)       --> tnumber(N).
single_arg_np(Text)    --> `"`, !, always(s_string_cont(`"`,Text)),!.
single_arg_np((List))  --> `(`, !, arg_list(wstc,List), `)`.
single_arg_np(A)       --> symbol(A),npeek(`(`),!.


item(Pred) --> ws,Pred,ws.

pred_expr(Pred) --> wsp, !, pred_expr(Pred).
pred_expr(Pred)    --> single_arg_np(X),item(infix(Cs)),!,single_arg_np(Y), {univ_holds(Pred,[Cs,X,Y])}.
pred_expr(Pred)    --> symbol(Cs),`(`, quietly(arg_list(wst,List)), {List\==[]}, item(`)`), {univ_holds(Pred,[Cs|List])}.
pred_expr(Pred)    --> symbol(Cs),`(`, !, quietly(arg_list(wstc,List)), {List\==[]}, item(`)`), {univ_holds(Pred,[Cs|List])}.
pred_expr(Pred)    --> symbol(Cs), wst, arg_list(wst,List), {List\==[]}, {univ_holds(Pred,[Cs|List])}.
pred_expr(not(A))  --> item(`~`),!,pred_expr(A).
pred_expr(A)       --> symbol(A).

infix(Cs) --> {infix_op(Cs),atom_codes(Cs,Codes)},Codes,!.

infix_op('!=').
infix_op('=>').
infix_op('=<').
infix_op('<=').
infix_op('>=').
infix_op('=').
infix_op('<').
infix_op('>').

univ_holds(Pred,[Cs,Holds]):-compound(Holds),Holds=..[holds|List],!,univ_holds(Pred,[Cs|List]).
univ_holds(Pred,[Cs|List]):- atom(Cs),!,Pred =.. [Cs|List].
univ_holds(Pred,[Cs|List]):- Pred =.. [holds,Cs|List].

symbol(_) --> `:`, !, {fail}.
symbol(Atom) --> `'`, always(s_string_cont(`'`,Text)),!, {atom_string(Atom,Text)}.
symbol(N) --> tnumber(N).
symbol('$VAR'(UAtom)) --> `?`,symbolr(Codes),!,{atom_codes(Atom,Codes),upcase_atom(Atom,UAtom)}.
symbol(Atom) --> quietly((symbolc(Codes),!,{atom_codes(Atom,Codes)})).
symbolc([A|As]) -->
    [A],
    { memberchk(A, `@_`) ; code_type(A, alpha) },
    symbolr(As).

symbolr([A|As]) -->
    [A],
    { memberchk(A, `_`) ; code_type(A, alnum) },
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

