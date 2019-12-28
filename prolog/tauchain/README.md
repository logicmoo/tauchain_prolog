# READER TESTS
````
TML: e(1,2).
TML: e(2,1).
TML: e(E_Param,E_Ret) :- e(E_Param,E_Param1) ',' e(E_Param1,E_Ret).
TML: '@naf'('S'(A,A)) :- 'S'(A,A).
TML: '@naf'(prog(Prog_Param,Prog_Param)) :- prog(Prog_Param,Prog_Param).
TML: '@naf'(alt(Alt_Param,Alt_Param)) :- alt(Alt_Param,Alt_Param).
TML: '@naf'(alts(Alts_Param,Alts_Param)) :- alts(Alts_Param,Alts_Param).
TML: a(b,c).
TML: a(b(c)).
TML: a(1,2,3).
TML: rel(t,1,2).
TML: b(B_Ret).
TML: '@trace'(foo).
TML: '@trace'(bar).
TML: r.
TML: ?_6682.
TML: '@treequery'(rel(t,1,2)).
TML: '@ask'(rel(t,1,2)).
TML: a(b,c).
TML: a(b(c)).
TML: '@finline'([a(1,2,3),rel(t,_,2),b(B_Ret),r]).
TML: '@treequery'(rel(t,1,2)).
TML: '@ask'(rel(t,1,2)).
TML: '@treequery'(e(E_Param,v1)).
TML: '@ask'(e(E_Param,v1)).
TML: father('Tom','Amy').
TML: father('Jack','Fred').
TML: father('Tony','CarolII').
TML: father('Fred','CarolIII').
TML: mother('Grace','Amy').
TML: mother('Amy','Fred').
TML: mother('CarolI','CarolII').
TML: mother('CarolII','CarolIII').
TML: parent(Parent_Param,Parent_Ret) :- father(Parent_Param,Parent_Ret).
TML: parent(Parent_Param,Parent_Ret) :- mother(Parent_Param,Parent_Ret).
TML: ancestor(Ancestor_Param,Ancestor_Ret) :- parent(Ancestor_Param,Ancestor_Ret).
TML: ancestor(Ancestor_Param,Ancestor_Ret) :- parent(Ancestor_Param,Ancestor_Param1) ',' ancestor(Ancestor_Param1,Ancestor_Ret).
TML: e(v1,v2).
TML: e(E_Param,E_Ret) :- e(E_Param,E_Param1) ',' e(E_Param1,E_Ret).
TML: e(v2,v3).
TML: e(v3,v4).
TML: e(v4,v5).
TML: e(v5,v1).
TML: e(E_Param,E_Ret) :- e(E_Param,E_Param1) ',' e(E_Param1,E_Ret).
TML: '@treequery'(e(E_Param,v1)).
TML: '@treequery'(e(E_Param,v1)).
TML: '@finline'([ a(b,c,d),
             '@naf'(e(E_Param,E_Param)) :- e(E_Param,E_Param)
           ]).
````

# TEST UNSAT2
````
# Following program does 6 steps and returns
# to the state where it initially started.
#
# TML has to stop and outputs: unsat
#
# Not stopping would cause an infinite loop

start.
running :- start.
~start :- running.
````
````
% /opt/logicmoo_workspace/packs_sys/tauchain_prolog/prolog/tauchain/tml_testing.pl:569
% ===PROCESS====================
TML: start.
TML: running :- start.
TML: '@naf'(start) :- running.


% User added facts:
 start.



% System infered facts:


% LogicMOO proofs:
% Current Rules...

 ==>(start,running).
 ==>(running,'@naf'(start)).



````

WARNING/Pfc: Couldn't db_retract start.

# TEST EUNSAT
````
# Following program does 6 steps and returns
# to the state where it initially started.
#
# TML has to stop and outputs: unsat
#
# Not stopping would cause an infinite loop

start.
running :- start.
~start :- running.
stop :- running.
~running :- stop.
start :- stop.
~stop :- start.
````
````
% ===PROCESS====================
TML: start.
TML: running :- start.
TML: '@naf'(start) :- running.
TML: stop :- running.
TML: '@naf'(running) :- stop.
TML: start :- stop.
TML: '@naf'(stop) :- start.


% User added facts:
 start.



% System infered facts:
 stop.



% LogicMOO proofs:
% ====
 stop.

%    1.1 running
%    1.2 ==>(running,stop)
% ====


% Current Rules...

 ==>(start,running).
 ==>(running,'@naf'(start)).
 ==>(running,stop).
 ==>(stop,'@naf'(running)).
 ==>(stop,start).
 ==>(start,'@naf'(stop)).



````

WARNING/Pfc: Couldn't db_retract start.
WARNING/Pfc: Couldn't db_retract start.

# TEST ARMAGEDDON
````
# There are birds Charlie and Coco
bird Charlie.
bird Coco.

# and there are humans John and Jane,
human John.
human Jane.

# Uncomment the following line to end the world
# armageddon.

# bird is a being
being ?x :- bird ?x.

# human is a being
being ?x :- human ?x.

# beings are mortal
mortal ?x :- being ?x.

# if armageddon, then all mortals die
dead ?x :- mortal ?x, armageddon.

# what dies isn't bird/human/
# mortal/being anymore
~bird ?x :- dead ?x.
~human ?x :- dead ?x.
~mortal ?x :- dead ?x.
~being ?x :- dead ?x.
````
````
% ===PROCESS====================
TML: bird('Charlie').
TML: bird('Coco').
TML: human('John').
TML: human('Jane').
TML: being(Being_Ret) :- bird(Being_Ret).
TML: being(Being_Ret) :- human(Being_Ret).
TML: mortal(Mortal_Ret) :- being(Mortal_Ret).
TML: dead(Dead_Ret) :- mortal(Dead_Ret) ',' armageddon.
TML: '@naf'(bird(Bird_Ret)) :- dead(Bird_Ret).
TML: '@naf'(human(Human_Ret)) :- dead(Human_Ret).
TML: '@naf'(mortal(Mortal_Ret)) :- dead(Mortal_Ret).
TML: '@naf'(being(Being_Ret)) :- dead(Being_Ret).


% User added facts:
 bird('Charlie').
 bird('Coco').
 human('Jane').
 human('John').



% System infered facts:
 being('Charlie').
 being('Coco').
 being('Jane').
 being('John').
 mortal('Charlie').
 mortal('Coco').
 mortal('Jane').
 mortal('John').



% LogicMOO proofs:
% ====
 being('Charlie').

%    1.1 bird('Charlie')
%    1.2 ==>(bird(A),being(A))
% ====

% ====
 being('Coco').

%    1.1 bird('Coco')
%    1.2 ==>(bird(A),being(A))
% ====

% ====
 being('Jane').

%    1.1 human('Jane')
%    1.2 ==>(human(A),being(A))
% ====

% ====
 being('John').

%    1.1 human('John')
%    1.2 ==>(human(A),being(A))
% ====

% ====
 mortal('Charlie').

%    1.1 being('Charlie')
%    1.2 ==>(being(A),mortal(A))
% ====

% ====
 mortal('Coco').

%    1.1 being('Coco')
%    1.2 ==>(being(A),mortal(A))
% ====

% ====
 mortal('Jane').

%    1.1 being('Jane')
%    1.2 ==>(being(A),mortal(A))
% ====

% ====
 mortal('John').

%    1.1 being('John')
%    1.2 ==>(being(A),mortal(A))
% ====


% Current Rules...

 ==>(bird(A),being(A)).
 ==>(human(A),being(A)).
 ==>(being(A),mortal(A)).
 ==>((mortal(A),armageddon),dead(A)).
 ==>(dead(A),'@naf'(bird(A))).
 ==>(dead(A),'@naf'(human(A))).
 ==>(dead(A),'@naf'(mortal(A))).
 ==>(dead(A),'@naf'(being(A))).



````

# TEST FAMILY
````
father Tom Amy.
father Jack Fred.
father Tony CarolII.
father Fred CarolIII.

mother Grace Amy.
mother Amy Fred.
mother CarolI CarolII.
mother CarolII CarolIII.

parent ?X ?Y :- father ?X ?Y.
parent ?X ?Y :- mother ?X ?Y.
ancestor ?X ?Y :- parent ?X ?Y.
ancestor ?X ?Y :- parent ?X ?Z, ancestor ?Z ?Y.

# This example is taken
# from Datalog Educational System
# http://des.sourceforge.net/
````
````
% ===PROCESS====================
TML: father('Tom','Amy').
TML: father('Jack','Fred').
TML: father('Tony','CarolII').
TML: father('Fred','CarolIII').
TML: mother('Grace','Amy').
TML: mother('Amy','Fred').
TML: mother('CarolI','CarolII').
TML: mother('CarolII','CarolIII').
TML: parent(Parent_Param,Parent_Ret) :- father(Parent_Param,Parent_Ret).
TML: parent(Parent_Param,Parent_Ret) :- mother(Parent_Param,Parent_Ret).
TML: ancestor(Ancestor_Param,Ancestor_Ret) :- parent(Ancestor_Param,Ancestor_Ret).
TML: ancestor(Ancestor_Param,Ancestor_Ret) :- parent(Ancestor_Param,Ancestor_Param3) ',' ancestor(Ancestor_Param3,Ancestor_Ret).


% User added facts:
 father('Fred','CarolIII').
 father('Jack','Fred').
 father('Tom','Amy').
 father('Tony','CarolII').
 mother('Amy','Fred').
 mother('CarolI','CarolII').
 mother('CarolII','CarolIII').
 mother('Grace','Amy').



% System infered facts:
 ancestor('Amy','CarolIII').
 ancestor('Amy','Fred').
 ancestor('CarolI','CarolII').
 ancestor('CarolI','CarolIII').
 ancestor('CarolII','CarolIII').
 ancestor('Fred','CarolIII').
 ancestor('Grace','Amy').
 ancestor('Grace','CarolIII').
 ancestor('Grace','Fred').
 ancestor('Jack','CarolIII').
 ancestor('Jack','Fred').
 ancestor('Tom','Amy').
 ancestor('Tom','CarolIII').
 ancestor('Tom','Fred').
 ancestor('Tony','CarolII').
 ancestor('Tony','CarolIII').
 parent('Amy','Fred').
 parent('CarolI','CarolII').
 parent('CarolII','CarolIII').
 parent('Fred','CarolIII').
 parent('Grace','Amy').
 parent('Jack','Fred').
 parent('Tom','Amy').
 parent('Tony','CarolII').



% LogicMOO proofs:
% ====
 ancestor('Amy','CarolIII').

%    1.1 ancestor('Fred','CarolIII')
%    1.2 parent('Amy','Fred')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
 ancestor('Amy','Fred').

%    1.1 parent('Amy','Fred')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
 ancestor('CarolI','CarolII').

%    1.1 parent('CarolI','CarolII')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
 ancestor('CarolI','CarolIII').

%    1.1 ancestor('CarolII','CarolIII')
%    1.2 parent('CarolI','CarolII')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
 ancestor('CarolII','CarolIII').

%    1.1 parent('CarolII','CarolIII')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
 ancestor('Fred','CarolIII').

%    1.1 parent('Fred','CarolIII')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
 ancestor('Grace','Amy').

%    1.1 parent('Grace','Amy')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
 ancestor('Grace','CarolIII').

%    1.1 ancestor('Amy','CarolIII')
%    1.2 parent('Grace','Amy')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
 ancestor('Grace','Fred').

%    1.1 ancestor('Amy','Fred')
%    1.2 parent('Grace','Amy')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
 ancestor('Jack','CarolIII').

%    1.1 ancestor('Fred','CarolIII')
%    1.2 parent('Jack','Fred')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
 ancestor('Jack','Fred').

%    1.1 parent('Jack','Fred')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
 ancestor('Tom','Amy').

%    1.1 parent('Tom','Amy')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
 ancestor('Tom','CarolIII').

%    1.1 ancestor('Amy','CarolIII')
%    1.2 parent('Tom','Amy')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
 ancestor('Tom','Fred').

%    1.1 ancestor('Amy','Fred')
%    1.2 parent('Tom','Amy')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
 ancestor('Tony','CarolII').

%    1.1 parent('Tony','CarolII')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
 ancestor('Tony','CarolIII').

%    1.1 ancestor('CarolII','CarolIII')
%    1.2 parent('Tony','CarolII')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
 parent('Amy','Fred').

%    1.1 mother('Amy','Fred')
%    1.2 ==>(mother(A,B),parent(A,B))
% ====

% ====
 parent('CarolI','CarolII').

%    1.1 mother('CarolI','CarolII')
%    1.2 ==>(mother(A,B),parent(A,B))
% ====

% ====
 parent('CarolII','CarolIII').

%    1.1 mother('CarolII','CarolIII')
%    1.2 ==>(mother(A,B),parent(A,B))
% ====

% ====
 parent('Fred','CarolIII').

%    1.1 father('Fred','CarolIII')
%    1.2 ==>(father(A,B),parent(A,B))
% ====

% ====
 parent('Grace','Amy').

%    1.1 mother('Grace','Amy')
%    1.2 ==>(mother(A,B),parent(A,B))
% ====

% ====
 parent('Jack','Fred').

%    1.1 father('Jack','Fred')
%    1.2 ==>(father(A,B),parent(A,B))
% ====

% ====
 parent('Tom','Amy').

%    1.1 father('Tom','Amy')
%    1.2 ==>(father(A,B),parent(A,B))
% ====

% ====
 parent('Tony','CarolII').

%    1.1 father('Tony','CarolII')
%    1.2 ==>(father(A,B),parent(A,B))
% ====


% Current Rules...

 ==>(father(A,B),parent(A,B)).
 ==>(mother(A,B),parent(A,B)).
 ==>(parent(A,B),ancestor(A,B)).
 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C)).



````

# TEST DIRECTEDGRAPH
````

# e relation represents directed graph:
# 1->2, 2->3, 3->4, 4->5, 5->1
e 1 2.
e 2 3.
e 3 4.
e 4 5.
e 5 1.

# Following program should get the first
# non-direct (transitive) path from each
# node of the graph 'e'

# state of the program: not done
notdone.

# TRANSITIVE CLOSURE to get all
# possible paths through the graph
# while notdone
t ?x ?y :- e ?x ?y, notdone.
t ?x ?z :- t ?x ?y, e ?y ?z, notdone.

# and we are done (yes, in the 1st step)
done :- notdone.

# if done, remove original graph
# from the resulting graph
~t ?x ?y :- e ?x ?y, done.

# if done, then remove notdone fact to
# stop the TC
~notdone :- done.
````
````
% ===PROCESS====================
TML: e(1,2).
TML: e(2,3).
TML: e(3,4).
TML: e(4,5).
TML: e(5,1).
TML: notdone.
TML: t(T_Param,T_Ret) :- e(T_Param,T_Ret) ',' notdone.
TML: t(T_Param,T_Ret) :- t(T_Param,E_Param) ',' e(E_Param,T_Ret) ',' notdone.
TML: done :- notdone.
TML: '@naf'(t(T_Param,T_Ret)) :- e(T_Param,T_Ret) ',' done.
TML: '@naf'(notdone) :- done.


% User added facts:
 notdone.
 e(1,2).
 e(2,3).
 e(3,4).
 e(4,5).
 e(5,1).



% System infered facts:


% LogicMOO proofs:
% Current Rules...

 ==>((e(A,B),notdone),t(A,B)).
 ==>((t(A,B),e(B,C),notdone),t(A,C)).
 ==>(notdone,done).
 ==>((e(A,B),done),'@naf'(t(A,B))).
 ==>(done,'@naf'(notdone)).



````

WARNING/Pfc: Couldn't db_retract notdone.
WARNING/Pfc: Couldn't db_retract trigPos(e(1,_167878),trigPos(notdone,rhs([t(1,_167878)]))).
WARNING/Pfc: Couldn't db_retract trigPos(e(2,_167878),trigPos(notdone,rhs([t(2,_167878)]))).
WARNING/Pfc: Couldn't db_retract trigPos(e(3,_167878),trigPos(notdone,rhs([t(3,_167878)]))).
WARNING/Pfc: Couldn't db_retract trigPos(e(4,_167878),trigPos(notdone,rhs([t(4,_167878)]))).
WARNING/Pfc: Couldn't db_retract trigPos(e(5,_167878),trigPos(notdone,rhs([t(5,_167878)]))).
ERROR/Pfc: Pfc database not empty after pfcReset, e.g., trigPos(e(2,_167874),trigPos(notdone,rhs([t(1,_167874)]))).

# TEST EDELETION
````
# Negation in heads deletes the fact from
# the database of facts.

happy.          # happy.
~happy :- sad.  # not happy if sad.
sad.            # sad.
# will result into 'sad'. No 'happy'.
````
````
% ===PROCESS====================
TML: happy.
TML: '@naf'(happy) :- sad.
TML: sad.


% User added facts:
 happy.
 sad.



% System infered facts:


% LogicMOO proofs:
% Current Rules...

 ==>(sad,'@naf'(happy)).



````

WARNING/Pfc: Couldn't db_retract happy.
ERROR/Pfc: Pfc database not empty after pfcReset, e.g., trigPos(e(2,_176750),trigPos(notdone,rhs([t(1,_176750)]))).

# TEST ENEGATION
````
# Negation
#
# For negation is used a '~' character.
# You can read it as 'not'.

bird Coco.
bird Charlie.
wounded Charlie.

# You can use negation in bodies
canFly ?X :- bird ?X, ~wounded ?X.
# ?X can fly if ?X is bird and is not wounded.
# or simply: Not wounded bird can fly.

# Coco and Charlie are birds but Charlie is
# wounded. The only fact TML can infer here
# is that Coco can fly.
````
````
% ===PROCESS====================
TML: bird('Coco').
TML: bird('Charlie').
TML: wounded('Charlie').
TML: canFly(CanFly_Ret) :- bird(CanFly_Ret) ',' '@naf'(wounded(CanFly_Ret)).

WARNING/Pfc: mpred_nf doesn't know how to normalize '@naf'(wounded(_192322))

% User added facts:
 bird('Charlie').
 bird('Coco').
 wounded('Charlie').



% System infered facts:


% LogicMOO proofs:
% Current Rules...

 ==>((bird(A),'@naf'(wounded(A))),canFly(A)).



````

ERROR/Pfc: Pfc database not empty after pfcReset, e.g., trigPos(e(2,_193518),trigPos(notdone,rhs([t(1,_193518)]))).

# TEST TRANSITIVE CLOSURE
````
# Transitive closure (TC)
#
# TC of a directed graph is simply another
# directed graph representing paths
# in the original graph.
#
# This is a classical example of recursion.
#
# Let's have a directed graph represented by
# following 'e' relation:

e 1 2.
e 2 3.
e 3 4.
e 4 5.
e 5 1.
e 8 9.

tc ?x ?y :- e ?x ?y.
# Edge from ?x to ?y is a path from ?x to ?y.

tc ?x ?y :- tc ?x ?z, e ?z ?y.
# If there is a path from ?x to ?z and there
# is an edge from ?z to ?y there is path from
# ?x to ?y

# TML infers all the possible paths in the
# 'e' graph into 'tc' graph.
````
````
% ===PROCESS====================
TML: e(1,2).
TML: e(2,3).
TML: e(3,4).
TML: e(4,5).
TML: e(5,1).
TML: e(8,9).
TML: tc(Tc_Param,Tc_Ret) :- e(Tc_Param,Tc_Ret).
TML: tc(Tc_Param,Tc_Ret) :- tc(Tc_Param,E_Param) ',' e(E_Param,Tc_Ret).


% User added facts:
 e(1,2).
 e(2,3).
 e(3,4).
 e(4,5).
 e(5,1).
 e(8,9).



% System infered facts:
 tc(1,1).
 tc(1,2).
 tc(1,3).
 tc(1,4).
 tc(1,5).
 tc(2,1).
 tc(2,2).
 tc(2,3).
 tc(2,4).
 tc(2,5).
 tc(3,1).
 tc(3,2).
 tc(3,3).
 tc(3,4).
 tc(3,5).
 tc(4,1).
 tc(4,2).
 tc(4,3).
 tc(4,4).
 tc(4,5).
 tc(5,1).
 tc(5,2).
 tc(5,3).
 tc(5,4).
 tc(5,5).
 tc(8,9).



% LogicMOO proofs:
% ====
 tc(1,1).

%    1.1 e(5,1)
%    1.2 tc(1,5)
%    1.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
 tc(1,2).

%    1.1 e(1,2)
%    1.2 ==>(e(A,B),tc(A,B))

%    2.1 e(1,2)
%    2.2 tc(1,1)
%    2.3 ==>((tc(A,B),e(B,C)),tc(A,C))

%    3.1 e(1,2)
%    3.2 tc(2,2)
%    3.3 ==>((tc(A,B),e(B,C)),tc(A,C))

%    4.1 e(1,2)
%    4.2 tc(3,3)
%    4.3 ==>((tc(A,B),e(B,C)),tc(A,C))

%    5.1 e(1,2)
%    5.2 tc(4,4)
%    5.3 ==>((tc(A,B),e(B,C)),tc(A,C))

%    6.1 e(1,2)
%    6.2 tc(5,5)
%    6.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
 tc(1,3).

%    1.1 e(2,3)
%    1.2 tc(1,2)
%    1.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
 tc(1,4).

%    1.1 e(3,4)
%    1.2 tc(1,3)
%    1.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
 tc(1,5).

%    1.1 e(4,5)
%    1.2 tc(1,4)
%    1.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
 tc(2,1).

%    1.1 e(5,1)
%    1.2 tc(2,5)
%    1.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
 tc(2,2).

%    1.1 e(1,2)
%    1.2 tc(2,1)
%    1.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
 tc(2,3).

%    1.1 e(2,3)
%    1.2 ==>(e(A,B),tc(A,B))

%    2.1 e(2,3)
%    2.2 tc(1,1)
%    2.3 ==>((tc(A,B),e(B,C)),tc(A,C))

%    3.1 e(2,3)
%    3.2 tc(2,2)
%    3.3 ==>((tc(A,B),e(B,C)),tc(A,C))

%    4.1 e(2,3)
%    4.2 tc(3,3)
%    4.3 ==>((tc(A,B),e(B,C)),tc(A,C))

%    5.1 e(2,3)
%    5.2 tc(4,4)
%    5.3 ==>((tc(A,B),e(B,C)),tc(A,C))

%    6.1 e(2,3)
%    6.2 tc(5,5)
%    6.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
 tc(2,4).

%    1.1 e(3,4)
%    1.2 tc(2,3)
%    1.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
 tc(2,5).

%    1.1 e(4,5)
%    1.2 tc(2,4)
%    1.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
 tc(3,1).

%    1.1 e(5,1)
%    1.2 tc(3,5)
%    1.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
 tc(3,2).

%    1.1 e(1,2)
%    1.2 tc(3,1)
%    1.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
 tc(3,3).

%    1.1 e(2,3)
%    1.2 tc(3,2)
%    1.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
 tc(3,4).

%    1.1 e(3,4)
%    1.2 ==>(e(A,B),tc(A,B))

%    2.1 e(3,4)
%    2.2 tc(1,1)
%    2.3 ==>((tc(A,B),e(B,C)),tc(A,C))

%    3.1 e(3,4)
%    3.2 tc(2,2)
%    3.3 ==>((tc(A,B),e(B,C)),tc(A,C))

%    4.1 e(3,4)
%    4.2 tc(3,3)
%    4.3 ==>((tc(A,B),e(B,C)),tc(A,C))

%    5.1 e(3,4)
%    5.2 tc(4,4)
%    5.3 ==>((tc(A,B),e(B,C)),tc(A,C))

%    6.1 e(3,4)
%    6.2 tc(5,5)
%    6.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
 tc(3,5).

%    1.1 e(4,5)
%    1.2 tc(3,4)
%    1.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
 tc(4,1).

%    1.1 e(5,1)
%    1.2 tc(4,5)
%    1.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
 tc(4,2).

%    1.1 e(1,2)
%    1.2 tc(4,1)
%    1.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
 tc(4,3).

%    1.1 e(2,3)
%    1.2 tc(4,2)
%    1.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
 tc(4,4).

%    1.1 e(3,4)
%    1.2 tc(4,3)
%    1.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
 tc(4,5).

%    1.1 e(4,5)
%    1.2 ==>(e(A,B),tc(A,B))

%    2.1 e(4,5)
%    2.2 tc(1,1)
%    2.3 ==>((tc(A,B),e(B,C)),tc(A,C))

%    3.1 e(4,5)
%    3.2 tc(2,2)
%    3.3 ==>((tc(A,B),e(B,C)),tc(A,C))

%    4.1 e(4,5)
%    4.2 tc(3,3)
%    4.3 ==>((tc(A,B),e(B,C)),tc(A,C))

%    5.1 e(4,5)
%    5.2 tc(4,4)
%    5.3 ==>((tc(A,B),e(B,C)),tc(A,C))

%    6.1 e(4,5)
%    6.2 tc(5,5)
%    6.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
 tc(5,1).

%    1.1 e(5,1)
%    1.2 ==>(e(A,B),tc(A,B))

%    2.1 e(5,1)
%    2.2 tc(1,1)
%    2.3 ==>((tc(A,B),e(B,C)),tc(A,C))

%    3.1 e(5,1)
%    3.2 tc(2,2)
%    3.3 ==>((tc(A,B),e(B,C)),tc(A,C))

%    4.1 e(5,1)
%    4.2 tc(3,3)
%    4.3 ==>((tc(A,B),e(B,C)),tc(A,C))

%    5.1 e(5,1)
%    5.2 tc(4,4)
%    5.3 ==>((tc(A,B),e(B,C)),tc(A,C))

%    6.1 e(5,1)
%    6.2 tc(5,5)
%    6.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
 tc(5,2).

%    1.1 e(1,2)
%    1.2 tc(5,1)
%    1.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
 tc(5,3).

%    1.1 e(2,3)
%    1.2 tc(5,2)
%    1.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
 tc(5,4).

%    1.1 e(3,4)
%    1.2 tc(5,3)
%    1.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
 tc(5,5).

%    1.1 e(4,5)
%    1.2 tc(5,4)
%    1.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
 tc(8,9).

%    1.1 e(8,9)
%    1.2 ==>(e(A,B),tc(A,B))

%    2.1 e(8,9)
%    2.2 tc(1,1)
%    2.3 ==>((tc(A,B),e(B,C)),tc(A,C))

%    3.1 e(8,9)
%    3.2 tc(2,2)
%    3.3 ==>((tc(A,B),e(B,C)),tc(A,C))

%    4.1 e(8,9)
%    4.2 tc(3,3)
%    4.3 ==>((tc(A,B),e(B,C)),tc(A,C))

%    5.1 e(8,9)
%    5.2 tc(4,4)
%    5.3 ==>((tc(A,B),e(B,C)),tc(A,C))

%    6.1 e(8,9)
%    6.2 tc(5,5)
%    6.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====


% Current Rules...

 ==>(e(A,B),tc(A,B)).
 ==>((tc(A,B),e(B,C)),tc(A,C)).



````

WARNING/Pfc: Couldn't db_retract trigPos(e(1,_236766),rhs([tc(1,_236766)])).
WARNING/Pfc: Couldn't db_retract trigPos(e(2,_236766),rhs([tc(2,_236766)])).
WARNING/Pfc: Couldn't db_retract trigPos(e(3,_236766),rhs([tc(3,_236766)])).
WARNING/Pfc: Couldn't db_retract trigPos(e(4,_236766),rhs([tc(4,_236766)])).
WARNING/Pfc: Couldn't db_retract trigPos(e(5,_236766),rhs([tc(5,_236766)])).
ERROR/Pfc: Pfc database not empty after pfcReset, e.g., trigPos(e(2,_236762),trigPos(notdone,rhs([t(1,_236762)]))).

# TEST ERECURSION
````
# Recursion is used to traverse through
# all the entities in a relation.
# It's a logic programs' alternative to loops.

# We can have a relation of parents.
parent Fred Sue.
parent Jack Fred.
parent Amy Fred.
parent Grace Amy.
parent Tom Amy.

# Let's say we want to know all the ancestor
# relations of all the known entities.

# We need to create 2 rules so TML knows,
# what ancestor means. Ancestor is a parent
# or a parent of an ancestor.

# 'parent of a child is an ancestor of the
# child':
ancestor ?anc ?child :-
    parent ?anc ?child.

# 'parent of a child, who is an ancestor of
# its descendant, is an ancestor of the
# descendant':
ancestor ?anc ?desc :-
    parent ?anc ?child, ancestor ?child ?desc.

# Notice how ancestor relation is used in both
# head and body. This is causing the recursion.
````
````
% ===PROCESS====================
TML: parent('Fred','Sue').
TML: parent('Jack','Fred').
TML: parent('Amy','Fred').
TML: parent('Grace','Amy').
TML: parent('Tom','Amy').
TML: ancestor(Ancestor_Param,Ancestor_Ret) :- parent(Ancestor_Param,Ancestor_Ret).
TML: ancestor(Ancestor_Param,Ancestor_Ret) :- parent(Ancestor_Param,Ancestor_Param3) ',' ancestor(Ancestor_Param3,Ancestor_Ret).


% User added facts:
 parent('Amy','Fred').
 parent('Fred','Sue').
 parent('Grace','Amy').
 parent('Jack','Fred').
 parent('Tom','Amy').



% System infered facts:
 ancestor('Amy','Fred').
 ancestor('Amy','Sue').
 ancestor('Fred','Sue').
 ancestor('Grace','Amy').
 ancestor('Grace','Fred').
 ancestor('Grace','Sue').
 ancestor('Jack','Fred').
 ancestor('Jack','Sue').
 ancestor('Tom','Amy').
 ancestor('Tom','Fred').
 ancestor('Tom','Sue').



% LogicMOO proofs:
% ====
 ancestor('Amy','Fred').

%    1.1 parent('Amy','Fred')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
 ancestor('Amy','Sue').

%    1.1 ancestor('Fred','Sue')
%    1.2 parent('Amy','Fred')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
 ancestor('Fred','Sue').

%    1.1 parent('Fred','Sue')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
 ancestor('Grace','Amy').

%    1.1 parent('Grace','Amy')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
 ancestor('Grace','Fred').

%    1.1 ancestor('Amy','Fred')
%    1.2 parent('Grace','Amy')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
 ancestor('Grace','Sue').

%    1.1 ancestor('Amy','Sue')
%    1.2 parent('Grace','Amy')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
 ancestor('Jack','Fred').

%    1.1 parent('Jack','Fred')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
 ancestor('Jack','Sue').

%    1.1 ancestor('Fred','Sue')
%    1.2 parent('Jack','Fred')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
 ancestor('Tom','Amy').

%    1.1 parent('Tom','Amy')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
 ancestor('Tom','Fred').

%    1.1 ancestor('Amy','Fred')
%    1.2 parent('Tom','Amy')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
 ancestor('Tom','Sue').

%    1.1 ancestor('Amy','Sue')
%    1.2 parent('Tom','Amy')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====


% Current Rules...

 ==>(parent(A,B),ancestor(A,B)).
 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C)).



````

ERROR/Pfc: Pfc database not empty after pfcReset, e.g., trigPos(e(2,_72450),trigPos(notdone,rhs([t(1,_72450)]))).

# TEST AND/OR
````
# When you need multiple conditions in a body
# separate them by a comma. You can read comma
# as 'and':

boy ?x :- child ?x, male ?x.
# ?x is a boy if ?x is both child and male.

girl ?x :- child ?x, female ?x.
# ?x is a girl if ?x is both child and female.

# When you need multiple bodies for the same
# head, you can have multiple rules with the
# same head:

human ?x :- child ?x.
human ?x :- adult ?x.
# ?x is a human if ?x is child or adult.

adult Amy.
child John.
child Jack.
child Jane.
child Suzi.
male John.
male Jack.
female Amy.
female Jane.
female Suzi.

# TML infers: Jack and John are boys.
# Jane and Suzi are girls.
# And Amy, Jack, Jane, John and Suzi are
# humans.
````
````
% ===PROCESS====================
TML: boy(Boy_Ret) :- child(Boy_Ret) ',' male(Boy_Ret).
TML: girl(Girl_Ret) :- child(Girl_Ret) ',' female(Girl_Ret).
TML: human(Human_Ret) :- child(Human_Ret).
TML: human(Human_Ret) :- adult(Human_Ret).
TML: adult('Amy').
TML: child('John').
TML: child('Jack').
TML: child('Jane').
TML: child('Suzi').
TML: male('John').
TML: male('Jack').
TML: female('Amy').
TML: female('Jane').
TML: female('Suzi').


% User added facts:
 adult('Amy').
 child('Jack').
 child('Jane').
 child('John').
 child('Suzi').
 female('Amy').
 female('Jane').
 female('Suzi').
 male('Jack').
 male('John').



% System infered facts:
 boy('Jack').
 boy('John').
 girl('Jane').
 girl('Suzi').
 human('Amy').
 human('Jack').
 human('Jane').
 human('John').
 human('Suzi').



% LogicMOO proofs:
% ====
 boy('Jack').

%    1.1 male('Jack')
%    1.2 child('Jack')
%    1.3 ==>((child(A),male(A)),boy(A))
% ====

% ====
 boy('John').

%    1.1 male('John')
%    1.2 child('John')
%    1.3 ==>((child(A),male(A)),boy(A))
% ====

% ====
 girl('Jane').

%    1.1 female('Jane')
%    1.2 child('Jane')
%    1.3 ==>((child(A),female(A)),girl(A))
% ====

% ====
 girl('Suzi').

%    1.1 female('Suzi')
%    1.2 child('Suzi')
%    1.3 ==>((child(A),female(A)),girl(A))
% ====

% ====
 human('Amy').

%    1.1 adult('Amy')
%    1.2 ==>(adult(A),human(A))
% ====

% ====
 human('Jack').

%    1.1 child('Jack')
%    1.2 ==>(child(A),human(A))
% ====

% ====
 human('Jane').

%    1.1 child('Jane')
%    1.2 ==>(child(A),human(A))
% ====

% ====
 human('John').

%    1.1 child('John')
%    1.2 ==>(child(A),human(A))
% ====

% ====
 human('Suzi').

%    1.1 child('Suzi')
%    1.2 ==>(child(A),human(A))
% ====


% Current Rules...

 ==>((child(A),male(A)),boy(A)).
 ==>((child(A),female(A)),girl(A)).
 ==>(child(A),human(A)).
 ==>(adult(A),human(A)).



````

ERROR/Pfc: Pfc database not empty after pfcReset, e.g., trigPos(e(2,_112090),trigPos(notdone,rhs([t(1,_112090)]))).

# TEST EVARIABLES
````
# Variables are used for substitution of
# multiple possible entities in rules.
# If a variable is substituted by an entity
# in a body it is substituted by the same entity
# in body's head.
# Variables begin with '?' character.

bird Charlie.
bird Coco.
cat Bella.

canFly ?something :- bird ?something.
# If something is a bird, it can fly.
# TML infers that Charlie and Coco can fly.

beeps ?some :- bird ?some.
# If there is some bird, it beeps.
# TML infers that Charlie and Coco beeps.

meows ?some :- cat ?some.
# If there is some cat, it meows.
# TML infers that Bella meows.


employee Suzi female.
employee John male.
employee Jane female.

salutation ?Person Madam :-
    employee ?Person female.
# salutation for any employee female is Madam.
# TML infers that Suzi's and Jane's salutation
# is Madam.

salutation ?Person Sir :-
    employee ?Person male.
# salutation for any employee male is Sir
# TML infers that John's salutation is Sir.


parent ?x ?y :- father ?x ?y.
parent ?x ?y :- mother ?x ?y.
father Coco Charlie.
mother Suzi John.

# TML infers that Coco is Charlie's parent.
# and that Suzi is John's parent.

# Just for fun, let's say, John is a bird:
bird John.

# TML infers that John beeps and he can fly.
````
````
% ===PROCESS====================
TML: bird('Charlie').
TML: bird('Coco').
TML: cat('Bella').
TML: canFly(CanFly_Ret) :- bird(CanFly_Ret).
TML: beeps(Beeps_Ret) :- bird(Beeps_Ret).
TML: meows(Meows_Ret) :- cat(Meows_Ret).
TML: employee('Suzi',female).
TML: employee('John',male).
TML: employee('Jane',female).
TML: salutation(Salutation_Param,'Madam') :- employee(Salutation_Param,female).
TML: salutation(Salutation_Param,'Sir') :- employee(Salutation_Param,male).
TML: parent(Parent_Param,Parent_Ret) :- father(Parent_Param,Parent_Ret).
TML: parent(Parent_Param,Parent_Ret) :- mother(Parent_Param,Parent_Ret).
TML: father('Coco','Charlie').
TML: mother('Suzi','John').
TML: bird('John').


% User added facts:
 bird('Charlie').
 bird('Coco').
 bird('John').
 cat('Bella').
 employee('Jane',female).
 employee('John',male).
 employee('Suzi',female).
 father('Coco','Charlie').
 mother('Suzi','John').



% System infered facts:
 beeps('Charlie').
 beeps('Coco').
 beeps('John').
 canFly('Charlie').
 canFly('Coco').
 canFly('John').
 meows('Bella').
 parent('Coco','Charlie').
 parent('Suzi','John').
 salutation('Jane','Madam').
 salutation('John','Sir').
 salutation('Suzi','Madam').



% LogicMOO proofs:
% ====
 beeps('Charlie').

%    1.1 bird('Charlie')
%    1.2 ==>(bird(A),beeps(A))
% ====

% ====
 beeps('Coco').

%    1.1 bird('Coco')
%    1.2 ==>(bird(A),beeps(A))
% ====

% ====
 beeps('John').

%    1.1 bird('John')
%    1.2 ==>(bird(A),beeps(A))
% ====

% ====
 canFly('Charlie').

%    1.1 bird('Charlie')
%    1.2 ==>(bird(A),canFly(A))
% ====

% ====
 canFly('Coco').

%    1.1 bird('Coco')
%    1.2 ==>(bird(A),canFly(A))
% ====

% ====
 canFly('John').

%    1.1 bird('John')
%    1.2 ==>(bird(A),canFly(A))
% ====

% ====
 meows('Bella').

%    1.1 cat('Bella')
%    1.2 ==>(cat(A),meows(A))
% ====

% ====
 parent('Coco','Charlie').

%    1.1 father('Coco','Charlie')
%    1.2 ==>(father(A,B),parent(A,B))
% ====

% ====
 parent('Suzi','John').

%    1.1 mother('Suzi','John')
%    1.2 ==>(mother(A,B),parent(A,B))
% ====

% ====
 salutation('Jane','Madam').

%    1.1 employee('Jane',female)
%    1.2 ==>(employee(A,female),salutation(A,'Madam'))
% ====

% ====
 salutation('John','Sir').

%    1.1 employee('John',male)
%    1.2 ==>(employee(A,male),salutation(A,'Sir'))
% ====

% ====
 salutation('Suzi','Madam').

%    1.1 employee('Suzi',female)
%    1.2 ==>(employee(A,female),salutation(A,'Madam'))
% ====


% Current Rules...

 ==>(bird(A),canFly(A)).
 ==>(bird(A),beeps(A)).
 ==>(cat(A),meows(A)).
 ==>(employee(A,female),salutation(A,'Madam')).
 ==>(employee(A,male),salutation(A,'Sir')).
 ==>(father(A,B),parent(A,B)).
 ==>(mother(A,B),parent(A,B)).



````

ERROR/Pfc: Pfc database not empty after pfcReset, e.g., trigPos(e(2,_172130),trigPos(notdone,rhs([t(1,_172130)]))).

# TEST EMADAM
````
employee Suzi female.
salutation Suzi Madam :- employee Suzi female.

# If employee Suzi is female, Suzi's salutation
# is Madam.
# TML correctly infers that Suzi's salutation is
# Madam because employee Suzi is female.

# Rules become more powerful when used with
# VARIABLES.
````
````
% ===PROCESS====================
TML: employee('Suzi',female).
TML: salutation('Suzi','Madam') :- employee('Suzi',female).


% User added facts:
 employee('Suzi',female).



% System infered facts:
 salutation('Suzi','Madam').



% LogicMOO proofs:
% ====
 salutation('Suzi','Madam').

%    1.1 employee('Suzi',female)
%    1.2 ==>(employee('Suzi',female),salutation('Suzi','Madam'))
% ====


% Current Rules...

 ==>(employee('Suzi',female),salutation('Suzi','Madam')).



````

ERROR/Pfc: Pfc database not empty after pfcReset, e.g., trigPos(e(2,_183882),trigPos(notdone,rhs([t(1,_183882)]))).

# TEST E1234
````

1 2.        # 1-2 exists.
1 4.        # 1-4 exists.
3 1 :- 1 3. # 3-1 exists if 1-3 exists.
2 1 :- 1 2. # 2-1 exists if 1-2 exists.

# Here TML infers 2 1 because there exist 1 2.
# You should see 1 2, 1 4 and 2 1 in the output.
# There is no 3 1 because there is no 1 3.

````
````
% ===PROCESS====================
TML: holds(1,2).
TML: holds(1,4).
TML: holds(3,1) :- holds(1,3).
TML: holds(2,1) :- holds(1,2).


% User added facts:
 holds(1,2).
 holds(1,4).



% System infered facts:
 holds(2,1).



% LogicMOO proofs:
% ====
 holds(2,1).

%    1.1 holds(1,2)
%    1.2 ==>(holds(1,2),holds(2,1))
% ====


% Current Rules...

 ==>(holds(1,3),holds(3,1)).
 ==>(holds(1,2),holds(2,1)).



````

ERROR/Pfc: Pfc database not empty after pfcReset, e.g., trigPos(e(2,_196712),trigPos(notdone,rhs([t(1,_196712)]))).

# TEST ERULES
````
# Rules allow creation/inferring of new facts.
# Every rule has a head and a body separated by
# ':-' symbol. Head is on the left side and body
# is on the right side.
# Rules are also called Horn Clauses.
# They work the way that head is true if body is
# true.
# You can imagine rules like facts (in head)
# with conditions (in body).

# TML takes all the known facts and tries to
# match them into bodies of all the known rules.
# When a fact matches a body of a rule it infers
# new fact from the head of the rule.

rain.                   # rain.
wet :- rain.            # wet if rain.
freezing :- bellowZero. # freezing if bellow 0.

# Here TML infers it's wet because it knows it
# rains.
# See there is 'rain' and 'wet' in the output.
# There is no 'freezing' because there is no
# 'bellowZero'.
````
````
% ===PROCESS====================
TML: rain.
TML: wet :- rain.
TML: freezing :- bellowZero.


% User added facts:
 rain.



% System infered facts:
 wet.



% LogicMOO proofs:
% ====
 wet.

%    1.1 rain
%    1.2 ==>(rain,wet)
% ====


% Current Rules...

 ==>(rain,wet).
 ==>(bellowZero,freezing).



````

ERROR/Pfc: Pfc database not empty after pfcReset, e.g., trigPos(e(2,_217240),trigPos(notdone,rhs([t(1,_217240)]))).

# TEST EARITY
````
# Every clause has its arity. It's a dimension
# of the domain in the corresponding Cartesian
# product.
# Basically it's a number of RELATION's entities
# (columns). It can be written as 'n-ary' or
# latin/greek name is used.

# Arity (latin/greek):

# 0-ary (nullary/niladic)
rain.
night.

# 1-ary (unary/monadic)
happy Sue.
barks Max.

# 2-ary (binary/dyadic)
mother Jane Jack.
employee John Doe.

# 3-ary (ternary/triadic)
married Tom Jane 2004.
employee Jane Doe support.

# ...
# 6-ary (senary)
a 1 2 3 4 5 6.

# 2-ary or more are also
# called multiary/polyadic

# Output of TML is padded by '*' character
# up to the highest known arity.
````
````
% ===PROCESS====================
TML: rain.
TML: night.
TML: happy('Sue').
TML: barks('Max').
TML: mother('Jane','Jack').
TML: employee('John','Doe').
TML: married('Tom','Jane',2004).
TML: employee('Jane','Doe',support).
TML: a(1,2,3,4,5,6).


% User added facts:
 night.
 rain.
 barks('Max').
 happy('Sue').
 employee('John','Doe').
 mother('Jane','Jack').
 employee('Jane','Doe',support).
 married('Tom','Jane',2004).
 a(1,2,3,4,5,6).



% System infered facts:


% LogicMOO proofs:
% Current Rules...




````

ERROR/Pfc: Pfc database not empty after pfcReset, e.g., trigPos(e(2,_241096),trigPos(notdone,rhs([t(1,_241096)]))).

# TEST ERELATIONS
````
# Every FACT begins with a predicate,
# which is also the name of a relation.
#
# We can think of:
#     relations as tables,
#     facts as rows and
#     entities as columns.
#
# Set of relations is called a model, or
# relational structure.
#                    _____________
                  # |_beginsWithJ_|
beginsWithJ Jane. # |    Jane     |
beginsWithJ John. # |    John     |
beginsWithJ Jack. # |____Jack_____|
                  #  _____________
                  # |___uncle_____|
uncle Jim Joe.    # |  Jim | Joe  |
uncle Joe Jill.   # |  Joe | Jill |
uncle Joe Jack.   # |__Joe_|_Jack_|

employee John Doe sales.
employee Jane Doe support.
#  ______________________
# |______employee________|
# | John | Doe | sales   |
# |_Jane_|_Doe_|_support_|

# FACTS (rows) in a relation (table) are
# unordered. It means it doesn't matter which
# fact comes first.
# Entities (columns) are unnamed and ordered.
# It's a difference from common relational
# databases where columns are named.
#
# Number of columns is also called ARITY.
````
````
% ===PROCESS====================
TML: beginsWithJ('Jane').
TML: beginsWithJ('John').
TML: beginsWithJ('Jack').
TML: uncle('Jim','Joe').
TML: uncle('Joe','Jill').
TML: uncle('Joe','Jack').
TML: employee('John','Doe',sales).
TML: employee('Jane','Doe',support).


% User added facts:
 beginsWithJ('Jack').
 beginsWithJ('Jane').
 beginsWithJ('John').
 uncle('Jim','Joe').
 uncle('Joe','Jack').
 uncle('Joe','Jill').
 employee('Jane','Doe',support).
 employee('John','Doe',sales).



% System infered facts:


% LogicMOO proofs:
% Current Rules...




````

ERROR/Pfc: Pfc database not empty after pfcReset, e.g., trigPos(e(2,_271886),trigPos(notdone,rhs([t(1,_271886)]))).

# TEST EFACTS
````
# Facts define RELATIONS between entities.
# Fact clauses are considered to be true.

father Tom Amy.   # Tom is a father of Amy.
canFly bird.      # Bird can fly.
edge 6 3.         # Exists an edge from 6 to 3.
night.            # It's night.
1 2.              # Exists a pair 1-2.
direct London NY. # London has a direct to NY.
3 9 12.           # Exists a triple 3-9-12.
beginsWithJ Joe.  # Joe begins with J.

# Output is padded by '*' character when
# different ARITIES are used.
````
````
% ===PROCESS====================
TML: father('Tom','Amy').
TML: canFly(bird).
TML: edge(6,3).
TML: night.
TML: holds(1,2).
TML: direct('London','NY').
TML: holds(3,9,12).
TML: beginsWithJ('Joe').


% User added facts:
 night.
 beginsWithJ('Joe').
 canFly(bird).
 direct('London','NY').
 edge(6,3).
 father('Tom','Amy').
 holds(1,2).
 holds(3,9,12).



% System infered facts:


% LogicMOO proofs:
% Current Rules...




````
% init_why(after('/opt/logicmoo_workspace/packs_sys/tauchain_prolog/prolog/tauchain/tml_testing.pl')).
% init_why(program).
?-

