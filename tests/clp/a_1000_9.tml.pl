:- use_module(library(clpfd)).

show_results(P):- time(forall(P,format('~N~q.~N',[P]))).

:- ensure_loaded(detect_autotabled).
:- install_autotable(true).

fact(0,1).
fact(X,Y) :-
   fact(A,B),
   X #< 9,
   A + 1 #= X,
   B * 2 #= Y.

:- listing(fact/2).
:- show_results(fact(_,_)).

/*   

RESULTING OUTPUT

LISTING:

:- table fact/2 as variant.

fact(0, 1).
fact(X, Y) :-
    fact(A, B),
    (   integer(X)
    ->  9>=X+1
    ;   C=9,
        clpfd:clpfd_geq(C, X+1)
    ),
    (   integer(A)
    ->  (   var(X)
        ->  X is A+1
        ;   integer(X)
        ->  A+1=:=X
        ;   D is A+1,
            clpfd:clpfd_equal(D, X)
        )
    ;   integer(X)
    ->  D=X,
        clpfd:clpfd_equal(A+1, D)
    ;   clpfd:clpfd_equal(A+1, X)
    ),
    (   integer(B)
    ->  (   var(Y)
        ->  Y is B*2
        ;   integer(Y)
        ->  B*2=:=Y
        ;   E is B*2,
            clpfd:clpfd_equal(E, Y)
        )
    ;   integer(Y)
    ->  E=Y,
        clpfd:clpfd_equal(B*2, E)
    ;   clpfd:clpfd_equal(B*2, Y)
    ).

RESULT:

fact(3,8).
fact(2,4).
fact(1,2).
fact(0,1).
fact(7,128).
fact(6,64).
fact(5,32).
fact(4,16).
fact(8,256).
% 1,346 inferences, 0.000 CPU in 0.000 seconds (100% CPU, 4269478 Lips)
*/


factr(0,1).
factr(X,Y) :- 
   X #< 9,
   A + 1 #= X,
   B * 2 #= Y,
   factr(A,B).

:- listing(factr/2).
:- show_results(factr(_,_)).

/*   

LISTING:

:- table factr/2 as variant.

factr(0, 1).
factr(A, D) :-
    factr(B, C),
    A#<9,
    B+1#=A,
    C*2#=D.

WELL :///

factr(0, 1).
factr(B, F) :-
    factr(C, E),
    A=9,
    clpfd:clpfd_geq(A, B+1),
    (   integer(C)
    ->  (   var(B)
        ->  B is C+1
        ;   integer(B)
        ->  C+1=:=B
        ;   D is C+1,
            clpfd:clpfd_equal(D, B)
        )
    ;   integer(B)
    ->  D=B,
        clpfd:clpfd_equal(C+1, D)
    ;   clpfd:clpfd_equal(C+1, B)
    ),
    (   integer(E)
    ->  F is E*2
    ;   clpfd:clpfd_equal(E*2, F)
    ).

RESULT:

factr(3,8).
factr(2,4).
factr(1,2).
factr(0,1).
factr(7,128).
factr(6,64).
factr(5,32).
factr(4,16).
factr(8,256).
% 3,434 inferences, 0.001 CPU in 0.001 seconds (100% CPU, 4944842 Lips)

*/
