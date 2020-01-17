:- module(tml_reader,[parse_tml/2,test_tml_r/1,tml_unnumbervars/2,tml_to_clp/2,tml_to_pfc/2,pfc_to_tml/2,into_codes_list_s/2,codes_list/1,chars_list/1,into_char_list_s/2,show_tml_read/1]).

:- use_module(library(logicmoo_common)).



:- op(500,fx,'~').
:- op(1050,xfx,('==>')).
:- op(1050,xfx,'<==>').
:- op(1050,xfx,('<-')).
:- op(1100,fx,('==>')).
:- op(1150,xfx,('::::')).




:- dynamic user:portray/1.
:- multifile user:portray/1.
:- module_transparent user:portray/1.
user:portray(Logic) :- 
 \+ tracing, 
 fail,  
 compound(Logic), 
 tml_current_portray_level(Level),
 tml_portray_at_level(Level, Logic),!.

tml_portray_at_level(Level,Logic):- 
 Level<2,
 tml_pretty_printer(Logic).

:- format_predicate('M', format_tml(_Arg,_TML)).



:- use_module(library(logicmoo/portray_vars)).

:- flag(tml_pretty_printer,_,0).
tml_current_portray_level(Level) :- flag(tml_pretty_printer,Was,Was),Was=Level.
:- export(tml_current_portray_level/1).
%tml_pretty_printer(Term):- !, fmt90(Term).
tml_pretty_printer(Term):- compound(Term),
 \+ \+ setup_call_cleanup( flag(tml_pretty_printer,Was,Was+1),
                     \+ \+ tml_prolog_pretty_print(Term),
                     flag(tml_pretty_printer,_,Was)),!.
tml_pretty_printer(Var):- var(Var),!,format(current_output,'?~p',Var).
tml_pretty_printer(Term):- format('~p',[Term]).
%tml_pretty_printer(Term):- fmt90(Term).

format_tml(_Format, Var):- var(Var),!,format(current_output,'?~w',Var).
format_tml(_Arg, TML):- string(TML),!,format(current_output,'"~s"',TML).
format_tml(_Arg, TML):- codes_list(TML),!,format(current_output,'~s',TML).
format_tml(_Arg, TML):- chars_list(TML),!,format(current_output,'~s',TML).
format_tml(Arg, List):- is_list(List),!,maplist([E]>>(format_tml(Arg,E),format('~N',[])), List).
format_tml(_Arg, TML):- pfc_to_tml(TML,RTML),!,tml_portray_at_level(0,RTML),format('.~N',[]).

tml_prolog_pretty_print(Term):- 
  pretty_numbervars(Term,Term2),
  prolog_pretty_print:print_term(Term2, [ output(current_output)]).

print_tml(X):- format_tml('~M', X).


tml_to_pfc(ExprsVs,Exprs):-
  unnumbervars(ExprsVs,ExprsU),
  copy_term(ExprsU,ExprsNA,_),!,
  rewrite_necks(tml(h),pfc(h),ExprsNA,Exprs),!.

tml_to_clp(ExprsVs,Exprs):-
  unnumbervars(ExprsVs,ExprsU),
  copy_term(ExprsU,ExprsNA,_),!,
  rewrite_necks(tml(h),clp(h),ExprsNA,Exprs),!.

pfc_to_tml(ExprsVs,Exprs):-
  unnumbervars(ExprsVs,ExprsU),
  copy_term(ExprsU,ExprsNA,_),!,
  rewrite_necks(pfc(h),tml(h),ExprsNA,Exprs),!.


rewrite_necks(_FromL,_Lang,P,PO):- \+ compound(P),!,P=PO.
rewrite_necks(FromL,Lang,==>P,PO):- !, rewrite_necks(FromL,Lang,P,PO).
rewrite_necks(FromL,Lang,P,PO):- is_list(P),!,maplist(rewrite_necks(FromL,Lang),P,PO).
rewrite_necks(FromL,Lang,P,PO):- compound_name_arguments(P,N,A),
  must_or_rtrace(rewrite_compound(FromL,Lang,N,A,PO)).

bh_neck('->').
bh_neck('=>').
bh_neck('==>').
rewrite_functor(_FromL,pfc(_),(not),( \+ )).
rewrite_functor(_FromL,tml(_),(\+),(~)).
rewrite_functor(_FromL,clp(_),(=),('#=')).
rewrite_functor(_FromL,clp(_),(<),('#<')).
rewrite_functor(_FromL,clp(_),(>),('#>')).
rewrite_functor(_FromL,clp(_),(>=),('#>=')).
rewrite_functor(_FromL,clp(_),(=<),('#=<')).
rewrite_functor(_FromL,clp(_),(:-),(':-')).
rewrite_functor(tml(_),NTML, (:-), ('==>')):- NTML \= tml(_), !.
rewrite_functor(FromL,To,From,To):- clause(rewrite_functor(To,FromL,To,From),Body), Body \= (clause(_,_),_), Body,!.
rewrite_functor(_FromL,_Lang,F,F).

rewrite_compound(FromL,tml(_),(==>),[B,H],(HH:-BB)):-
    rewrite_necks(FromL,tml(_),H,HH),
    rewrite_necks(FromL,tml(_),B,BB),!.

rewrite_compound(FromL,Lang,N,[H,B],PO):-
  (rewrite_functor(FromL,Lang,N,NO)-> N\=@=NO),
  ((bh_neck(N) -> \+ bh_neck(NO) ; bh_neck(NO)) -> 
     ARGS = [B,H] ; ARGS = [H,B]),
   maplist(rewrite_necks(FromL,Lang),ARGS,AO),
   compound_name_arguments(PO,NO,AO),!.

rewrite_compound(FromL,Lang,N,A,PO):-
  rewrite_functor(FromL,Lang,N,NO),
   maplist(rewrite_necks(FromL,Lang),A,AO),
   compound_name_arguments(PO,NO,AO),!.


tml_unnumbervars(ExprsVs,ExprsNA):-
  unnumbervars(ExprsVs,Exprs),
  copy_term(Exprs,ExprsNA,_),!.






always(G):- G*->true;throw(not_always(G)).
always(G,H,T):- always(phrase(G,H,T)),!.
quietly(G,H,T):- quietly(notrace(phrase(G,H,T))),!.
text_to_string_always(T,S):- always(text_to_string(T,S)).

null --> ``.
optional(X) --> X ; null.
some(P) --> (P, optional(some(P))),!.
peek(X,H,H):-phrase(X,H,_).
npeek(X,H,H):- \+ phrase(X,H,_).

% "c8d12a1cca95"
           
into_codes_list(String, Chars):- current_prolog_flag(back_quotes, chars),!,into_char_list_s(String,Chars).
into_codes_list(String, Codes):- into_codes_list_s(String, Codes).

into_char_list_s(String,Chars):- into_codes_list_s(String, Codes), atom_codes(Atom,Codes),atom_chars(Atom,Chars).


codes_list([S|String]):- is_char_code(S),maplist(is_char_code,String),!.
chars_list([S|String]):- is_char(S),maplist(is_char,String).
is_char(S):- atom(S),atom_length(S,1).
is_char_code(S):- integer(S),S>0,code_type(S,_),!.


into_codes_list_s(X, Codes) :- var(X), !,throw(var_into_codes_list_s(X, Codes)).
into_codes_list_s(X, Codes) :- X ==[], !,atom_codes('\n', Codes).
into_codes_list_s(String, Codes) :- atomic(String),!, atom_codes(String,Codes).
into_codes_list_s(String, Codes) :- \+ is_list(String),!, sformat(Codes,'~M',[String]),!.
into_codes_list_s(String, Codes) :- codes_list(String),!,Codes=String.
into_codes_list_s(String, Codes) :- chars_list(String),!,atom_chars(Atom,String),atom_codes(Atom,Codes).
into_codes_list_s(String, Codes) :- sformat(Codes,'~M',[String]),!.

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
pred_expr(Jiggled)    --> single_arg_np(X),item(infix(Cs)),more_expr(Y), {univ_holds(Pred,[Cs,X,Y]), jiggle_infix(Pred,Jiggled)}.
pred_expr(Pred)    --> symbol(Cs),`(`, quietly(arg_list(wst,List)), {List\==[]}, item(`)`), {univ_holds(Pred,[Cs|List])}.
pred_expr(Pred)    --> symbol(Cs),`(`, !, quietly(arg_list(wstc,List)), {List\==[]}, item(`)`), {univ_holds(Pred,[Cs|List])}.
pred_expr(Pred)    --> symbol(Cs), wst, arg_list(wst,List), {List\==[]}, {univ_holds(Pred,[Cs|List])}.
pred_expr('~'(A))  --> item(`~`),!,pred_expr(A).
pred_expr(A)       --> symbol(A).


more_expr(Jiggled) --> single_arg_np(X),item(infix(Cs)),!,more_expr(Y), {univ_holds(Pred,[Cs,X,Y]), jiggle_infix(Pred,Jiggled)}.
more_expr(X) --> single_arg_np(X).

jiggle_infix(X+(Y=Z),X+Y=Z):-!.
jiggle_infix(X*(Y=Z),X*Y=Z):-!.
jiggle_infix(Pred,Pred).

infix(Cs) --> {infix_op(Cs),atom_codes(Cs,Codes)},Codes,!.

infix_op('!=').
infix_op('=>').
infix_op('=<').
infix_op('<=').
infix_op('>=').
infix_op('=').
infix_op('<').
infix_op('>').
infix_op('**').
infix_op('*').
infix_op('/').
infix_op('+').
infix_op('-').

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
show_tml_read(X):- format('~NTML: ',X),format_tml(_Arg, X).

%:- [qvar_rewriter].
           
