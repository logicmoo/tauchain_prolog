
:- module(detect_autotabled, 
  [detect_autotable/4,
   detect_autotable/2,
   do_detect_autotable/5,
   autotable_module/2,
   install_autotable/1]).

:- module_transparent(do_detect_autotable/5).
do_detect_autotable(M,(H:-B0),Pos,GO,PosO):-
 \+ predicate_property(M:H,tabled),
 functor(H,F,A),
 strip_module(foo,M0,_),
 in_body(M,F,A,B0), 
 table(M:F/A),!,
 reorder_tbody(M,F,A,B0,B),
 \+ (B0==B),
 expand_goal(B,Pos,BB,PosM),
 expand_term((M0:( (M:H) :-BB)),PosM,GO,PosO),
 !.

:- module_transparent(meta_args/2).
meta_args(Body,METAS):-
  predicate_property(Body,meta_predicate(Which)),
  compound(Which), arg(_,Which,Meta),
  meta_arg(Meta),!,
  compound_name_arguments(Which,_,METAS).

non_meta('+'). non_meta('?'). non_meta('-').
meta_arg(Meta):- \+ non_meta(Meta).

:- module_transparent(reorder_meta_body/6).
reorder_meta_body(_,_,_,ARG,Meta,ARG):- non_meta(Meta),!.
reorder_meta_body(M,F,A,ARG0,_Meta,ARG):-reorder_tbody(M,F,A,ARG0,ARG).

:- module_transparent(reorder_tbody/5).
reorder_tbody(_,_,_,B0,B1):- \+ compound(B0),!,B1=B0. 
reorder_tbody(_,_,_,B0,B1):- is_list(B0),!,B1=B0. 
reorder_tbody(M,F,A,(B0;C0),(B1;C1)):-
 reorder_tbody(M,F,A,B0,B1),
 reorder_tbody(M,F,A,C0,C1).
reorder_tbody(M,F,A,(B0->C0),(B1->C1)):-
 reorder_tbody(M,F,A,B0,B1),
 reorder_tbody(M,F,A,C0,C1).
reorder_tbody(M,F,A,(B0,C0),Body):-
 conj_to_list((B0,C0),List),
 select(H0,List,NewList),strip_module(H0,M0,H),
 functor(H,F,A),M0==M,!,
 list_to_conj([H0|NewList],Body).
reorder_tbody(M,F,A,B0,B1):- 
 meta_args(B0,METAS),
 compound_name_arguments(B0,OP,ARGS0),
 maplist(reorder_meta_body(M,F,A),ARGS0,METAS,ARGS),
 compound_name_arguments(B1,OP,ARGS),!.
reorder_tbody(_,_,_,B,B):-!.


:- module_transparent(in_body/4).
in_body(_,_,_,Body):- \+ callable(Body),!,fail.
in_body(M,F,A,Body):- strip_module(Body,M0,Body0),functor(Body0,F,A),!,M0==M.
in_body(M,F,A,Body):- compound(Body),predicate_property(Body,meta_predicate(Which)),
  arg(N,Which,Meta),meta_arg(Meta),arg(N,Body,Arg),in_body(M,F,A,Arg).



conj_to_list(Var, [Var]) :- \+ callable(Var), !.
conj_to_list(TRUE, []) :- is_true(TRUE), !.
conj_to_list((A, B), ABL) :- !,
    conj_to_list(A, AL),
    conj_to_list(B, BL),
    append(AL, BL, ABL).
conj_to_list(Lit, [Lit]).


list_to_conj(I, O) :- list_to_conj(',', I, O).

list_to_conj(_, NIL, TRUE):- NIL == [], !, TRUE = true.
list_to_conj(_, V, V) :- \+ compound(V), !.
list_to_conj(OP, [H], HH) :- list_to_conj(OP, H, HH).
list_to_conj(OP, [H|T], Body) :- !,
    list_to_conj(OP, H, HH),
    list_to_conj(OP, T, TT),
    conj_op(OP, HH, TT, Body).
list_to_conj(_, H, H).

is_true(TRUE):- TRUE == true.

conj_op(_, TRUE, X, X) :- is_true(TRUE),!.
conj_op(_, X, TRUE, X) :- is_true(TRUE),!.
conj_op(_, X, Y, Z) :- X==Y, Z=X, !.
conj_op(OP, C1, C2, C) :- C=..[OP, C1, C2].

:- dynamic(autotable_module/2).

:- module_transparent(detect_autotable/4).
detect_autotable(Rule,Pos,GO,PosO):-
 nonvar(Pos), 
 strip_module(Rule,M0,(H0:-B0)),
 M0:strip_module(H0,M,H),
 autotable_module(M, true),
 M0:do_detect_autotable(M,(H:-B0),Pos,GO,PosO).


:- module_transparent(detect_autotable/2).
detect_autotable(Rule,GO):-
 strip_module(Rule,M0,(H0:-B0)),
 M0:strip_module(H0,M,H),
 do_detect_autotable(M,(H:-B0),_Pos,GO,_PosO).


:- meta_predicate(install_autotable(:)).
install_autotable(M:TF):-
 ( \+ retract(autotable_module(M,_)) 
    -> M:assert((term_expansion(I,PosI,O,PosO):- detect_autotable(I,PosI,O,PosO))) ; true),
   asserta(autotable_module(M,TF)).

