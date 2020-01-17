
% Written 2005, 2015 Markus Triska triska@metalevel.at
% Public domain code.

:- use_module(library(simplex)).
:- use_module(library(clpfd)).

%:- include(v150).
%:- include(v25).
:- include(v15).
%:- include(v3).
%:- include(v21).

max_weight(100).
max_value(200).

set_nth0(N, Element, Es0, Es) :-
        length(Prefix, N),
        append(Prefix, [_|Rest], Es0),
        append(Prefix, [Element|Rest], Es).

initial_patterns([], _, _, _) --> [].
initial_patterns([W|Ws], [V|Vs], Item, ZeroPattern) -->
        [Pattern],
        { max_weight(MaxWeight),
          max_value(MaxValue),
          Max #= min(MaxWeight // W, MaxValue // V),
          set_nth0(Item, Max, ZeroPattern, Pattern),
          portray_clause(Pattern),
          Item1 #= Item + 1 },
        initial_patterns(Ws, Vs, Item1, ZeroPattern).

init_constraints(D, P, N0-S0, N-S) :-
        nth0(N0, P, P_j_j),
        Max is ceil(D / P_j_j),
        constraint([use(N0)] =< Max, S0, S),
        N #= N0 + 1.

integer_use(N, use(N)).

init_demands(D, P, N0-S0, N-S) :-
        phrase(make_sum(P, 0), Sum),
        constraint(demand(N0), Sum >= D, S0, S),
        N #= N0 + 1.

make_sum([], _) --> [].
make_sum([Coeff|Cs], N0) -->
        (   { Coeff =:= 0 } -> []
        ;   [Coeff*use(N0)]
        ),
        { N1 #= N0 + 1 },
        make_sum(Cs, N1).

camels :-
        weights(Weights),
        values(Values),
        demands(Demands),
        length(Demands, NumItems),
        length(ZeroPattern, NumItems),
        maplist(=(0), ZeroPattern),
        format("% initial patterns:\n"),
        phrase(initial_patterns(Weights, Values, 0, ZeroPattern), Patterns0),
        gen_state(S0),
        foldl(init_constraints, Demands, Patterns0, 0-S0, _-S1),
        MaxUse #= NumItems - 1,
        numlist(0, MaxUse, UseNs),
        maplist(integer_use, UseNs, Obj0),
        foldl(init_demands, Demands, Patterns0, 0-S1, _-S2),
        append(Obj0, NewPatterns, UseVars),
        format("% generated packing patterns:\n"),
        phrase(camels(Demands, S2, Obj0, NumItems, S3, Obj1), NewPatterns),
        format("% solution vector (coefficient of each pattern):\n"),
        foldl(make_integral, UseVars, S3, S4),
        minimize(Obj1, S4, Solved),
        maplist(variable_value(Solved), UseVars, Vals),
        portray_clause(Vals).

make_integral(UseVar, S0, S) :- constraint(integral(UseVar), S0, S).

camels(Demands, State0, Obj0, NPatt0, State, Obj) -->
        { knapsack(State0, Obj0, ZBest, NewPattern) },
        (   { ZBest =:= 1 } ->
            % { format("no profitable column found\n") },
            { State = State0,
              Obj = Obj0 }
        ;   [UseVar],
            { portray_clause(NewPattern),
              UseVar = use(NPatt0),
              adjust_constraints(Demands, UseVar, NewPattern, 0, 0, Upper, State0, State1),
              constraint([UseVar] =< Upper, State1, State2),
              NPatt1 #= NPatt0 + 1 },
              camels(Demands, State2, [UseVar|Obj0], NPatt1, State, Obj)
        ).

adjust_constraints([], _, [], _, Upper, Upper, State, State).
adjust_constraints([Demand|Ds], UV, [P|Ps], Curr, Upper0, Upper, State0, State) :-
        Curr1 #= Curr + 1,
        (   P =:= 0 ->
            adjust_constraints(Ds, UV, Ps, Curr1, Upper0, Upper, State0, State)
        ;   constraint_add(demand(Curr), [P*UV], State0, State1),
            Upper1 is max(Upper0, ceil(Demand/P)),
            adjust_constraints(Ds, UV, Ps, Curr1, Upper1, Upper, State1, State)
        ).



knapctrl(W, W*x(N0), N0, N) :- N #= N0 + 1.

knap_objective(Solved, _, Coeff*x(N0), N0, N) :-
        shadow_price(Solved, demand(N0), Coeff),
        N #= N0 + 1.

knap_integer(_, N0-S0, N-S) :-
        constraint(integral(x(N0)), S0, S),
        N #= N0 + 1.


knapsack(Relaxed, RelaxedObj, ObjValue, Pattern) :-
        minimize(RelaxedObj, Relaxed, Solved),
        gen_state(KnapS0),
        weights(Ws),
        foldl(knapctrl, Ws, KnapSum1, 0, _),
        max_weight(MaxWeight),
        constraint(KnapSum1 =< MaxWeight, KnapS0, KnapS1),
        values(Vs),
        foldl(knapctrl, Vs, KnapSum2, 0, _),
        max_value(MaxValue),
        constraint(KnapSum2 =< MaxValue, KnapS1, KnapS2),
        foldl(knap_integer, Ws, 0-KnapS2, _-KnapS3),
        foldl(knap_objective(Solved), Ws, KnapObj, 0, _),
        maximize(KnapObj, KnapS3, KnapSolved),
        objective(KnapSolved, ObjValue),
        foldl(knap_value(KnapSolved), Ws, Pattern, 0, _).

knap_value(Solved, _, V, N0, N) :-
        variable_value(Solved, x(N0), V),
        N #= N0 + 1.
