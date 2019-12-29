# READER TESTS
````
TML: e(1,2).
TML: e(2,1).
TML: e(E_Param,E_Ret) :- e(E_Param,E_Param1) ',' e(E_Param1,E_Ret).
TML: ~ 'S'(A,A) :- 'S'(A,A).
TML: ~ prog(Prog_Param,Prog_Param) :- prog(Prog_Param,Prog_Param).
TML: ~ alt(Alt_Param,Alt_Param) :- alt(Alt_Param,Alt_Param).
TML: ~ alts(Alts_Param,Alts_Param) :- alts(Alts_Param,Alts_Param).
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
             ~ e(E_Param,E_Param) :- e(E_Param,E_Param)
           ]).
````

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
% /opt/logicmoo_workspace/packs_sys/tauchain_prolog/tests/tml_testing.pl:570
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




% Positive triggers...

% Negative triggers...

% Goal (Backchain) triggers...

% Supports...
 night.
 beginsWithJ('Joe').
 canFly(bird).
 direct('London','NY').
 edge(6,3).
 father('Tom','Amy').
 holds(1,2).
 holds(3,9,12).

:- dynamic mpred_queue/2.


````

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




% Positive triggers...

% Negative triggers...

% Goal (Backchain) triggers...

% Supports...
 beginsWithJ('Jack').
 beginsWithJ('Jane').
 beginsWithJ('John').
 uncle('Jim','Joe').
 uncle('Joe','Jack').
 uncle('Joe','Jill').
 employee('Jane','Doe',support).
 employee('John','Doe',sales).

:- dynamic mpred_queue/2.


````

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




% Positive triggers...

% Negative triggers...

% Goal (Backchain) triggers...

% Supports...
 night.
 rain.
 barks('Max').
 happy('Sue').
 employee('John','Doe').
 mother('Jane','Jack').
 employee('Jane','Doe',support).
 married('Tom','Jane',2004).
 a(1,2,3,4,5,6).

:- dynamic mpred_queue/2.


````

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
wet proof:

%    1.1 rain
%    1.2 ==>(rain,wet)
% ====


% Current Rules...

 ==>(rain,wet).
 ==>(bellowZero,freezing).



% Positive triggers...
 trigPos(rain,rhs([wet])).
 trigPos(bellowZero,rhs([freezing])).

% Negative triggers...

% Goal (Backchain) triggers...

% Supports...
 rain.
 ==>(bellowZero,freezing).
 ==>(rain,wet).
% ====
wet proof:

%    1.1 rain
%    1.2 ==>(rain,wet)
% ====

% ====
trigPos(bellowZero,rhs([freezing])) proof:

%    1.1 ==>(bellowZero,freezing)
% ====

% ====
trigPos(rain,rhs([wet])) proof:

%    1.1 ==>(rain,wet)
% ====


:- dynamic mpred_queue/2.


````

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
holds(2,1) proof:

%    1.1 holds(1,2)
%    1.2 ==>(holds(1,2),holds(2,1))
% ====


% Current Rules...

 ==>(holds(1,3),holds(3,1)).
 ==>(holds(1,2),holds(2,1)).



% Positive triggers...
 trigPos(holds(1,3),rhs([holds(3,1)])).
 trigPos(holds(1,2),rhs([holds(2,1)])).

% Negative triggers...

% Goal (Backchain) triggers...

% Supports...
 ==>(holds(1,2),holds(2,1)).
 ==>(holds(1,3),holds(3,1)).
 holds(1,2).
 holds(1,4).
% ====
trigPos(holds(1,2),rhs([holds(2,1)])) proof:

%    1.1 ==>(holds(1,2),holds(2,1))
% ====

% ====
trigPos(holds(1,3),rhs([holds(3,1)])) proof:

%    1.1 ==>(holds(1,3),holds(3,1))
% ====

% ====
holds(2,1) proof:

%    1.1 holds(1,2)
%    1.2 ==>(holds(1,2),holds(2,1))
% ====


:- dynamic mpred_queue/2.


````

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
salutation('Suzi','Madam') proof:

%    1.1 employee('Suzi',female)
%    1.2 ==>(employee('Suzi',female),salutation('Suzi','Madam'))
% ====


% Current Rules...

 ==>(employee('Suzi',female),salutation('Suzi','Madam')).



% Positive triggers...
 trigPos(employee('Suzi',female),rhs([salutation('Suzi','Madam')])).

% Negative triggers...

% Goal (Backchain) triggers...

% Supports...
 ==>(employee('Suzi',female),salutation('Suzi','Madam')).
 employee('Suzi',female).
% ====
trigPos(employee('Suzi',female),rhs([salutation('Suzi','Madam')])) proof:

%    1.1 ==>(employee('Suzi',female),salutation('Suzi','Madam'))
% ====

% ====
salutation('Suzi','Madam') proof:

%    1.1 employee('Suzi',female)
%    1.2 ==>(employee('Suzi',female),salutation('Suzi','Madam'))
% ====


:- dynamic mpred_queue/2.


````

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
beeps('Charlie') proof:

%    1.1 bird('Charlie')
%    1.2 ==>(bird(A),beeps(A))
% ====

% ====
beeps('Coco') proof:

%    1.1 bird('Coco')
%    1.2 ==>(bird(A),beeps(A))
% ====

% ====
beeps('John') proof:

%    1.1 bird('John')
%    1.2 ==>(bird(A),beeps(A))
% ====

% ====
canFly('Charlie') proof:

%    1.1 bird('Charlie')
%    1.2 ==>(bird(A),canFly(A))
% ====

% ====
canFly('Coco') proof:

%    1.1 bird('Coco')
%    1.2 ==>(bird(A),canFly(A))
% ====

% ====
canFly('John') proof:

%    1.1 bird('John')
%    1.2 ==>(bird(A),canFly(A))
% ====

% ====
meows('Bella') proof:

%    1.1 cat('Bella')
%    1.2 ==>(cat(A),meows(A))
% ====

% ====
parent('Coco','Charlie') proof:

%    1.1 father('Coco','Charlie')
%    1.2 ==>(father(A,B),parent(A,B))
% ====

% ====
parent('Suzi','John') proof:

%    1.1 mother('Suzi','John')
%    1.2 ==>(mother(A,B),parent(A,B))
% ====

% ====
salutation('Jane','Madam') proof:

%    1.1 employee('Jane',female)
%    1.2 ==>(employee(A,female),salutation(A,'Madam'))
% ====

% ====
salutation('John','Sir') proof:

%    1.1 employee('John',male)
%    1.2 ==>(employee(A,male),salutation(A,'Sir'))
% ====

% ====
salutation('Suzi','Madam') proof:

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



% Positive triggers...
 trigPos(bird(A),rhs([canFly(A)])).
 trigPos(bird(A),rhs([beeps(A)])).
 trigPos(cat(A),rhs([meows(A)])).
 trigPos(employee(A,female),rhs([salutation(A,'Madam')])).
 trigPos(employee(A,male),rhs([salutation(A,'Sir')])).
 trigPos(father(A,B),rhs([parent(A,B)])).
 trigPos(mother(A,B),rhs([parent(A,B)])).

% Negative triggers...

% Goal (Backchain) triggers...

% Supports...
 bird('Charlie').
 bird('Coco').
 bird('John').
 cat('Bella').
 ==>(bird(A),beeps(A)).
 ==>(bird(A),canFly(A)).
 ==>(cat(A),meows(A)).
 ==>(employee(A,male),salutation(A,'Sir')).
 ==>(employee(A,female),salutation(A,'Madam')).
 ==>(father(A,B),parent(A,B)).
 ==>(mother(A,B),parent(A,B)).
 employee('Jane',female).
 employee('John',male).
 employee('Suzi',female).
 father('Coco','Charlie').
 mother('Suzi','John').
% ====
beeps('Charlie') proof:

%    1.1 bird('Charlie')
%    1.2 ==>(bird(A),beeps(A))
% ====

% ====
canFly('Charlie') proof:

%    1.1 bird('Charlie')
%    1.2 ==>(bird(A),canFly(A))
% ====

% ====
beeps('Coco') proof:

%    1.1 bird('Coco')
%    1.2 ==>(bird(A),beeps(A))
% ====

% ====
canFly('Coco') proof:

%    1.1 bird('Coco')
%    1.2 ==>(bird(A),canFly(A))
% ====

% ====
beeps('John') proof:

%    1.1 bird('John')
%    1.2 ==>(bird(A),beeps(A))
% ====

% ====
canFly('John') proof:

%    1.1 bird('John')
%    1.2 ==>(bird(A),canFly(A))
% ====

% ====
meows('Bella') proof:

%    1.1 cat('Bella')
%    1.2 ==>(cat(A),meows(A))
% ====

% ====
trigPos(bird(_85688),rhs([beeps(_85688)])) proof:

%    1.1 ==>(bird(A),beeps(A))
% ====

% ====
trigPos(bird(_85876),rhs([canFly(_85876)])) proof:

%    1.1 ==>(bird(A),canFly(A))
% ====

% ====
trigPos(cat(_85500),rhs([meows(_85500)])) proof:

%    1.1 ==>(cat(A),meows(A))
% ====

% ====
trigPos(employee(_85066,male),rhs([salutation(_85066,'Sir')])) proof:

%    1.1 ==>(employee(A,male),salutation(A,'Sir'))
% ====

% ====
trigPos(employee(_85282,female),rhs([salutation(_85282,'Madam')])) proof:

%    1.1 ==>(employee(A,female),salutation(A,'Madam'))
% ====

% ====
trigPos(father(_84908,_84910),rhs([parent(_84908,_84910)])) proof:

%    1.1 ==>(father(A,B),parent(A,B))
% ====

% ====
trigPos(mother(_84808,_84810),rhs([parent(_84808,_84810)])) proof:

%    1.1 ==>(mother(A,B),parent(A,B))
% ====

% ====
salutation('Jane','Madam') proof:

%    1.1 employee('Jane',female)
%    1.2 ==>(employee(A,female),salutation(A,'Madam'))
% ====

% ====
salutation('John','Sir') proof:

%    1.1 employee('John',male)
%    1.2 ==>(employee(A,male),salutation(A,'Sir'))
% ====

% ====
salutation('Suzi','Madam') proof:

%    1.1 employee('Suzi',female)
%    1.2 ==>(employee(A,female),salutation(A,'Madam'))
% ====

% ====
parent('Coco','Charlie') proof:

%    1.1 father('Coco','Charlie')
%    1.2 ==>(father(A,B),parent(A,B))
% ====

% ====
parent('Suzi','John') proof:

%    1.1 mother('Suzi','John')
%    1.2 ==>(mother(A,B),parent(A,B))
% ====


:- dynamic mpred_queue/2.


````

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
boy('Jack') proof:

%    1.1 male('Jack')
%    1.2 child('Jack')
%    1.3 ==>((child(A),male(A)),boy(A))
% ====

% ====
boy('John') proof:

%    1.1 male('John')
%    1.2 child('John')
%    1.3 ==>((child(A),male(A)),boy(A))
% ====

% ====
girl('Jane') proof:

%    1.1 female('Jane')
%    1.2 child('Jane')
%    1.3 ==>((child(A),female(A)),girl(A))
% ====

% ====
girl('Suzi') proof:

%    1.1 female('Suzi')
%    1.2 child('Suzi')
%    1.3 ==>((child(A),female(A)),girl(A))
% ====

% ====
human('Amy') proof:

%    1.1 adult('Amy')
%    1.2 ==>(adult(A),human(A))
% ====

% ====
human('Jack') proof:

%    1.1 child('Jack')
%    1.2 ==>(child(A),human(A))
% ====

% ====
human('Jane') proof:

%    1.1 child('Jane')
%    1.2 ==>(child(A),human(A))
% ====

% ====
human('John') proof:

%    1.1 child('John')
%    1.2 ==>(child(A),human(A))
% ====

% ====
human('Suzi') proof:

%    1.1 child('Suzi')
%    1.2 ==>(child(A),human(A))
% ====


% Current Rules...

 ==>((child(A),male(A)),boy(A)).
 ==>((child(A),female(A)),girl(A)).
 ==>(child(A),human(A)).
 ==>(adult(A),human(A)).



% Positive triggers...
 trigPos(child(A),trigPos(male(A),rhs([boy(A)]))).
 trigPos(child(A),trigPos(female(A),rhs([girl(A)]))).
 trigPos(child(A),rhs([human(A)])).
 trigPos(adult(A),rhs([human(A)])).
 trigPos(male('John'),rhs([boy('John')])).
 trigPos(female('John'),rhs([girl('John')])).
 trigPos(male('Jack'),rhs([boy('Jack')])).
 trigPos(female('Jack'),rhs([girl('Jack')])).
 trigPos(male('Jane'),rhs([boy('Jane')])).
 trigPos(female('Jane'),rhs([girl('Jane')])).
 trigPos(male('Suzi'),rhs([boy('Suzi')])).
 trigPos(female('Suzi'),rhs([girl('Suzi')])).

% Negative triggers...

% Goal (Backchain) triggers...

% Supports...
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
 ==>(adult(A),human(A)).
 ==>(child(A),human(A)).
 ==>((child(A),female(A)),girl(A)).
 ==>((child(A),male(A)),boy(A)).
% ====
human('Amy') proof:

%    1.1 adult('Amy')
%    1.2 ==>(adult(A),human(A))
% ====

% ====
human('Jack') proof:

%    1.1 child('Jack')
%    1.2 ==>(child(A),human(A))
% ====

% ====
trigPos(female('Jack'),rhs([girl('Jack')])) proof:

%    1.1 child('Jack')
%    1.2 ==>((child(A),female(A)),girl(A))
% ====

% ====
trigPos(male('Jack'),rhs([boy('Jack')])) proof:

%    1.1 child('Jack')
%    1.2 ==>((child(A),male(A)),boy(A))
% ====

% ====
human('Jane') proof:

%    1.1 child('Jane')
%    1.2 ==>(child(A),human(A))
% ====

% ====
trigPos(female('Jane'),rhs([girl('Jane')])) proof:

%    1.1 child('Jane')
%    1.2 ==>((child(A),female(A)),girl(A))
% ====

% ====
trigPos(male('Jane'),rhs([boy('Jane')])) proof:

%    1.1 child('Jane')
%    1.2 ==>((child(A),male(A)),boy(A))
% ====

% ====
human('John') proof:

%    1.1 child('John')
%    1.2 ==>(child(A),human(A))
% ====

% ====
trigPos(female('John'),rhs([girl('John')])) proof:

%    1.1 child('John')
%    1.2 ==>((child(A),female(A)),girl(A))
% ====

% ====
trigPos(male('John'),rhs([boy('John')])) proof:

%    1.1 child('John')
%    1.2 ==>((child(A),male(A)),boy(A))
% ====

% ====
human('Suzi') proof:

%    1.1 child('Suzi')
%    1.2 ==>(child(A),human(A))
% ====

% ====
trigPos(female('Suzi'),rhs([girl('Suzi')])) proof:

%    1.1 child('Suzi')
%    1.2 ==>((child(A),female(A)),girl(A))
% ====

% ====
trigPos(male('Suzi'),rhs([boy('Suzi')])) proof:

%    1.1 child('Suzi')
%    1.2 ==>((child(A),male(A)),boy(A))
% ====

% ====
girl('Jane') proof:

%    1.1 female('Jane')
%    1.2 child('Jane')
%    1.3 ==>((child(A),female(A)),girl(A))
% ====

% ====
girl('Suzi') proof:

%    1.1 female('Suzi')
%    1.2 child('Suzi')
%    1.3 ==>((child(A),female(A)),girl(A))
% ====

% ====
boy('Jack') proof:

%    1.1 male('Jack')
%    1.2 child('Jack')
%    1.3 ==>((child(A),male(A)),boy(A))
% ====

% ====
boy('John') proof:

%    1.1 male('John')
%    1.2 child('John')
%    1.3 ==>((child(A),male(A)),boy(A))
% ====

% ====
trigPos(adult(_132602),rhs([human(_132602)])) proof:

%    1.1 ==>(adult(A),human(A))
% ====

% ====
trigPos(child(_132690),rhs([human(_132690)])) proof:

%    1.1 ==>(child(A),human(A))
% ====

% ====
trigPos(child(_132788),trigPos(female(_132788),rhs([girl(_132788)]))) proof:

%    1.1 ==>((child(A),female(A)),girl(A))
% ====

% ====
trigPos(child(_132906),trigPos(male(_132906),rhs([boy(_132906)]))) proof:

%    1.1 ==>((child(A),male(A)),boy(A))
% ====


:- dynamic mpred_queue/2.


````

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
TML: ancestor(Ancestor_Param,Ancestor_Ret) :- parent(Ancestor_Param,Ancestor_Param2) ',' ancestor(Ancestor_Param2,Ancestor_Ret).


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
ancestor('Amy','Fred') proof:

%    1.1 parent('Amy','Fred')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
ancestor('Amy','Sue') proof:

%    1.1 ancestor('Fred','Sue')
%    1.2 parent('Amy','Fred')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('Fred','Sue') proof:

%    1.1 parent('Fred','Sue')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
ancestor('Grace','Amy') proof:

%    1.1 parent('Grace','Amy')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
ancestor('Grace','Fred') proof:

%    1.1 ancestor('Amy','Fred')
%    1.2 parent('Grace','Amy')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('Grace','Sue') proof:

%    1.1 ancestor('Amy','Sue')
%    1.2 parent('Grace','Amy')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('Jack','Fred') proof:

%    1.1 parent('Jack','Fred')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
ancestor('Jack','Sue') proof:

%    1.1 ancestor('Fred','Sue')
%    1.2 parent('Jack','Fred')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('Tom','Amy') proof:

%    1.1 parent('Tom','Amy')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
ancestor('Tom','Fred') proof:

%    1.1 ancestor('Amy','Fred')
%    1.2 parent('Tom','Amy')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('Tom','Sue') proof:

%    1.1 ancestor('Amy','Sue')
%    1.2 parent('Tom','Amy')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====


% Current Rules...

 ==>(parent(A,B),ancestor(A,B)).
 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C)).



% Positive triggers...
 trigPos(parent(A,B),rhs([ancestor(A,B)])).
 trigPos(parent(A,B),trigPos(ancestor(B,C),rhs([ancestor(A,C)]))).
 trigPos(ancestor('Sue',A),rhs([ancestor('Fred',A)])).
 trigPos(ancestor('Fred',A),rhs([ancestor('Jack',A)])).
 trigPos(ancestor('Fred',A),rhs([ancestor('Amy',A)])).
 trigPos(ancestor('Amy',A),rhs([ancestor('Grace',A)])).
 trigPos(ancestor('Amy',A),rhs([ancestor('Tom',A)])).

% Negative triggers...

% Goal (Backchain) triggers...

% Supports...
 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C)).
 ==>(parent(A,B),ancestor(A,B)).
 parent('Amy','Fred').
 parent('Fred','Sue').
 parent('Grace','Amy').
 parent('Jack','Fred').
 parent('Tom','Amy').
% ====
trigPos(parent(_177506,_177508),trigPos(ancestor(_177508,_177520),rhs([ancestor(_177506,_177520)]))) proof:

%    1.1 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
trigPos(parent(_177920,_177922),rhs([ancestor(_177920,_177922)])) proof:

%    1.1 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
ancestor('Tom','Fred') proof:

%    1.1 ancestor('Amy','Fred')
%    1.2 parent('Tom','Amy')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('Grace','Fred') proof:

%    1.1 ancestor('Amy','Fred')
%    1.2 parent('Grace','Amy')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('Tom','Sue') proof:

%    1.1 ancestor('Amy','Sue')
%    1.2 parent('Tom','Amy')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('Grace','Sue') proof:

%    1.1 ancestor('Amy','Sue')
%    1.2 parent('Grace','Amy')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('Amy','Sue') proof:

%    1.1 ancestor('Fred','Sue')
%    1.2 parent('Amy','Fred')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('Jack','Sue') proof:

%    1.1 ancestor('Fred','Sue')
%    1.2 parent('Jack','Fred')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
trigPos(ancestor('Fred',_177190),rhs([ancestor('Amy',_177190)])) proof:

%    1.1 parent('Amy','Fred')
%    1.2 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('Amy','Fred') proof:

%    1.1 parent('Amy','Fred')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
trigPos(ancestor('Sue',_177432),rhs([ancestor('Fred',_177432)])) proof:

%    1.1 parent('Fred','Sue')
%    1.2 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('Fred','Sue') proof:

%    1.1 parent('Fred','Sue')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
trigPos(ancestor('Amy',_177040),rhs([ancestor('Grace',_177040)])) proof:

%    1.1 parent('Grace','Amy')
%    1.2 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('Grace','Amy') proof:

%    1.1 parent('Grace','Amy')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
trigPos(ancestor('Fred',_177340),rhs([ancestor('Jack',_177340)])) proof:

%    1.1 parent('Jack','Fred')
%    1.2 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('Jack','Fred') proof:

%    1.1 parent('Jack','Fred')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
trigPos(ancestor('Amy',_176832),rhs([ancestor('Tom',_176832)])) proof:

%    1.1 parent('Tom','Amy')
%    1.2 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('Tom','Amy') proof:

%    1.1 parent('Tom','Amy')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====


:- dynamic mpred_queue/2.


````

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
 tc(1,2).
 tc(1,3).
 tc(2,3).
 tc(2,4).
 tc(3,4).
 tc(3,5).
 tc(4,1).
 tc(4,5).
 tc(5,1).
 tc(5,2).
 tc(8,9).



% LogicMOO proofs:
% ====
tc(1,2) proof:

%    1.1 e(1,2)
%    1.2 ==>(e(A,B),tc(A,B))
% ====

% ====
tc(1,3) proof:

%    1.1 e(2,3)
%    1.2 tc(1,2)
%    1.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
tc(2,3) proof:

%    1.1 e(2,3)
%    1.2 ==>(e(A,B),tc(A,B))
% ====

% ====
tc(2,4) proof:

%    1.1 e(3,4)
%    1.2 tc(2,3)
%    1.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
tc(3,4) proof:

%    1.1 e(3,4)
%    1.2 ==>(e(A,B),tc(A,B))
% ====

% ====
tc(3,5) proof:

%    1.1 e(4,5)
%    1.2 tc(3,4)
%    1.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
tc(4,1) proof:

%    1.1 e(5,1)
%    1.2 tc(4,5)
%    1.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
tc(4,5) proof:

%    1.1 e(4,5)
%    1.2 ==>(e(A,B),tc(A,B))
% ====

% ====
tc(5,1) proof:

%    1.1 e(5,1)
%    1.2 ==>(e(A,B),tc(A,B))
% ====

% ====
tc(5,2) proof:

%    1.1 e(1,2)
%    1.2 tc(5,1)
%    1.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
tc(8,9) proof:

%    1.1 e(8,9)
%    1.2 ==>(e(A,B),tc(A,B))
% ====


% Current Rules...

 ==>(e(A,B),tc(A,B)).
 ==>((tc(A,B),e(B,C)),tc(A,C)).



% Positive triggers...
 trigPos(e(A,B),rhs([tc(A,B)])).
 trigPos(tc(A,B),trigPos(e(B,C),rhs([tc(A,C)]))).
 trigPos(e(2,A),rhs([tc(1,A)])).
 trigPos(e(3,A),rhs([tc(2,A)])).
 trigPos(e(4,A),rhs([tc(3,A)])).
 trigPos(e(5,A),rhs([tc(4,A)])).
 trigPos(e(1,A),rhs([tc(5,A)])).
 trigPos(e(9,A),rhs([tc(8,A)])).

% Negative triggers...

% Goal (Backchain) triggers...

% Supports...
 ==>((tc(A,B),e(B,C)),tc(A,C)).
 ==>(e(A,B),tc(A,B)).
 e(1,2).
 e(2,3).
 e(3,4).
 e(4,5).
 e(5,1).
 e(8,9).
% ====
trigPos(tc(_216782,_216784),trigPos(e(_216784,_216796),rhs([tc(_216782,_216796)]))) proof:

%    1.1 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
trigPos(e(_217254,_217256),rhs([tc(_217254,_217256)])) proof:

%    1.1 ==>(e(A,B),tc(A,B))
% ====

% ====
tc(1,2) proof:

%    1.1 e(1,2)
%    1.2 ==>(e(A,B),tc(A,B))
% ====

% ====
tc(5,2) proof:

%    1.1 e(1,2)
%    1.2 tc(5,1)
%    1.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
tc(2,3) proof:

%    1.1 e(2,3)
%    1.2 ==>(e(A,B),tc(A,B))
% ====

% ====
tc(1,3) proof:

%    1.1 e(2,3)
%    1.2 tc(1,2)
%    1.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
tc(3,4) proof:

%    1.1 e(3,4)
%    1.2 ==>(e(A,B),tc(A,B))
% ====

% ====
tc(2,4) proof:

%    1.1 e(3,4)
%    1.2 tc(2,3)
%    1.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
tc(4,5) proof:

%    1.1 e(4,5)
%    1.2 ==>(e(A,B),tc(A,B))
% ====

% ====
tc(3,5) proof:

%    1.1 e(4,5)
%    1.2 tc(3,4)
%    1.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
tc(5,1) proof:

%    1.1 e(5,1)
%    1.2 ==>(e(A,B),tc(A,B))
% ====

% ====
tc(4,1) proof:

%    1.1 e(5,1)
%    1.2 tc(4,5)
%    1.3 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
tc(8,9) proof:

%    1.1 e(8,9)
%    1.2 ==>(e(A,B),tc(A,B))
% ====

% ====
trigPos(e(2,_216708),rhs([tc(1,_216708)])) proof:

%    1.1 tc(1,2)
%    1.2 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
trigPos(e(3,_216558),rhs([tc(2,_216558)])) proof:

%    1.1 tc(2,3)
%    1.2 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
trigPos(e(4,_216408),rhs([tc(3,_216408)])) proof:

%    1.1 tc(3,4)
%    1.2 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
trigPos(e(5,_216258),rhs([tc(4,_216258)])) proof:

%    1.1 tc(4,5)
%    1.2 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
trigPos(e(1,_216108),rhs([tc(5,_216108)])) proof:

%    1.1 tc(5,1)
%    1.2 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====

% ====
trigPos(e(9,_215958),rhs([tc(8,_215958)])) proof:

%    1.1 tc(8,9)
%    1.2 ==>((tc(A,B),e(B,C)),tc(A,C))
% ====


:- dynamic mpred_queue/2.


````

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
TML: canFly(CanFly_Ret) :- bird(CanFly_Ret) ',' ~ wounded(CanFly_Ret).


% User added facts:
 bird('Charlie').
 bird('Coco').
 wounded('Charlie').



% System infered facts:
 canFly('Coco').



% LogicMOO proofs:
% ====
canFly('Coco') proof:

%    1.1 \+wounded('Coco')
%    1.2 bird('Coco')
%    1.3 ==>((bird(A),~(wounded(A))),canFly(A))
% ====


% Current Rules...

 ==>((bird(A),~(wounded(A))),canFly(A)).



% Positive triggers...
 trigPos(bird(A),trigNeg(wounded(A),pfcBC(wounded(A)),rhs([canFly(A)]))).

% Negative triggers...
 trigNeg(wounded('Coco'),pfcBC(wounded('Coco')),rhs([canFly('Coco')])).
 trigNeg(wounded('Charlie'),pfcBC(wounded('Charlie')),rhs([canFly('Charlie')])).

% Goal (Backchain) triggers...

% Supports...
 bird('Charlie').
 bird('Coco').
 wounded('Charlie').
 ==>((bird(A),~(wounded(A))),canFly(A)).
% ====
canFly('Coco') proof:

%    1.1 \+wounded('Coco')
%    1.2 bird('Coco')
%    1.3 ==>((bird(A),~(wounded(A))),canFly(A))
% ====

% ====
trigNeg(wounded('Charlie'),pfcBC(wounded('Charlie')),rhs([canFly('Charlie')])) proof:

%    1.1 bird('Charlie')
%    1.2 ==>((bird(A),~(wounded(A))),canFly(A))
% ====

% ====
trigNeg(wounded('Coco'),pfcBC(wounded('Coco')),rhs([canFly('Coco')])) proof:

%    1.1 bird('Coco')
%    1.2 ==>((bird(A),~(wounded(A))),canFly(A))
% ====

% ====
trigPos(bird(_63158),trigNeg(wounded(_63158),pfcBC(wounded(_63158)),rhs([canFly(_63158)]))) proof:

%    1.1 ==>((bird(A),~(wounded(A))),canFly(A))
% ====


:- dynamic mpred_queue/2.


````

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
TML: ~ happy :- sad.
TML: sad.


% User added facts:
 sad.



% System infered facts:


% LogicMOO proofs:
% Current Rules...

 ==>(sad,~(happy)).



% Positive triggers...
 trigPos(sad,rhs([~(happy)])).

% Negative triggers...

% Goal (Backchain) triggers...

% Supports...
 sad.
 ==>(sad,~(happy)).
% ====
trigPos(sad,rhs([~(happy)])) proof:

%    1.1 ==>(sad,~(happy))
% ====


:- dynamic mpred_queue/2.


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
TML: ~ t(T_Param,T_Ret) :- e(T_Param,T_Ret) ',' done.
TML: ~ notdone :- done.


% User added facts:
 e(1,2).
 e(2,3).
 e(3,4).
 e(4,5).
 e(5,1).



% System infered facts:
 done.
 t(1,3).
 t(2,4).
 t(3,5).
 t(4,1).
 t(5,2).



% LogicMOO proofs:
% ====
done proof:

%    1.1 notdone
%    1.2 ==>(notdone,done)
% ====

% ====
t(1,3) proof:

%    1.1 notdone
%    1.2 e(2,3)
%    1.3 t(1,2)
%    1.4 ==>((t(A,B),e(B,C),notdone),t(A,C))
% ====

% ====
t(2,4) proof:

%    1.1 notdone
%    1.2 e(3,4)
%    1.3 t(2,3)
%    1.4 ==>((t(A,B),e(B,C),notdone),t(A,C))
% ====

% ====
t(3,5) proof:

%    1.1 notdone
%    1.2 e(4,5)
%    1.3 t(3,4)
%    1.4 ==>((t(A,B),e(B,C),notdone),t(A,C))
% ====

% ====
t(4,1) proof:

%    1.1 notdone
%    1.2 e(5,1)
%    1.3 t(4,5)
%    1.4 ==>((t(A,B),e(B,C),notdone),t(A,C))
% ====

% ====
t(5,2) proof:

%    1.1 notdone
%    1.2 e(1,2)
%    1.3 t(5,1)
%    1.4 ==>((t(A,B),e(B,C),notdone),t(A,C))
% ====


% Current Rules...

 ==>((e(A,B),notdone),t(A,B)).
 ==>((t(A,B),e(B,C),notdone),t(A,C)).
 ==>(notdone,done).
 ==>((e(A,B),done),~(t(A,B))).
 ==>(done,~(notdone)).



% Positive triggers...
 trigPos(e(A,B),trigPos(notdone,rhs([t(A,B)]))).
 trigPos(notdone,rhs([t(1,2)])).
 trigPos(notdone,rhs([t(2,3)])).
 trigPos(notdone,rhs([t(3,4)])).
 trigPos(notdone,rhs([t(4,5)])).
 trigPos(notdone,rhs([t(5,1)])).
 trigPos(t(A,B),trigPos(e(B,C),trigPos(notdone,rhs([t(A,C)])))).
 trigPos(e(2,A),trigPos(notdone,rhs([t(1,A)]))).
 trigPos(notdone,rhs([t(1,3)])).
 trigPos(e(3,A),trigPos(notdone,rhs([t(2,A)]))).
 trigPos(notdone,rhs([t(2,4)])).
 trigPos(e(4,A),trigPos(notdone,rhs([t(3,A)]))).
 trigPos(notdone,rhs([t(3,5)])).
 trigPos(e(5,A),trigPos(notdone,rhs([t(4,A)]))).
 trigPos(notdone,rhs([t(4,1)])).
 trigPos(e(1,A),trigPos(notdone,rhs([t(5,A)]))).
 trigPos(notdone,rhs([t(5,2)])).
 trigPos(notdone,rhs([done])).
 trigPos(e(A,B),trigPos(done,rhs([~(t(A,B))]))).
 trigPos(done,rhs([~(t(1,2))])).
 trigPos(done,rhs([~(t(2,3))])).
 trigPos(done,rhs([~(t(3,4))])).
 trigPos(done,rhs([~(t(4,5))])).
 trigPos(done,rhs([~(t(5,1))])).
 trigPos(done,rhs([~(notdone)])).

% Negative triggers...

% Goal (Backchain) triggers...

% Supports...
% ====
done proof:

%    1.1 notdone
%    1.2 ==>(notdone,done)
% ====

% ====
t(1,2) proof:

%    1.1 notdone
%    1.2 e(1,2)
%    1.3 ==>((e(A,B),notdone),t(A,B))
% ====

% ====
t(1,3) proof:

%    1.1 notdone
%    1.2 e(2,3)
%    1.3 t(1,2)
%    1.4 ==>((t(A,B),e(B,C),notdone),t(A,C))
% ====

% ====
t(2,3) proof:

%    1.1 notdone
%    1.2 e(2,3)
%    1.3 ==>((e(A,B),notdone),t(A,B))
% ====

% ====
t(2,4) proof:

%    1.1 notdone
%    1.2 e(3,4)
%    1.3 t(2,3)
%    1.4 ==>((t(A,B),e(B,C),notdone),t(A,C))
% ====

% ====
t(3,4) proof:

%    1.1 notdone
%    1.2 e(3,4)
%    1.3 ==>((e(A,B),notdone),t(A,B))
% ====

% ====
t(3,5) proof:

%    1.1 notdone
%    1.2 e(4,5)
%    1.3 t(3,4)
%    1.4 ==>((t(A,B),e(B,C),notdone),t(A,C))
% ====

% ====
t(4,1) proof:

%    1.1 notdone
%    1.2 e(5,1)
%    1.3 t(4,5)
%    1.4 ==>((t(A,B),e(B,C),notdone),t(A,C))
% ====

% ====
t(4,5) proof:

%    1.1 notdone
%    1.2 e(4,5)
%    1.3 ==>((e(A,B),notdone),t(A,B))
% ====

% ====
t(5,1) proof:

%    1.1 notdone
%    1.2 e(5,1)
%    1.3 ==>((e(A,B),notdone),t(A,B))
% ====

% ====
t(5,2) proof:

%    1.1 notdone
%    1.2 e(1,2)
%    1.3 t(5,1)
%    1.4 ==>((t(A,B),e(B,C),notdone),t(A,C))
% ====

 ==>(done,~(notdone)).
 ==>(notdone,done).
 ==>((e(A,B),done),~(t(A,B))).
 ==>((e(A,B),notdone),t(A,B)).
 ==>((t(A,B),e(B,C),notdone),t(A,C)).
 e(1,2).
 e(2,3).
 e(3,4).
 e(4,5).
 e(5,1).
% ====
trigPos(done,rhs([~(notdone)])) proof:

%    1.1 ==>(done,~(notdone))
% ====

% ====
trigPos(notdone,rhs([done])) proof:

%    1.1 ==>(notdone,done)
% ====

% ====
trigPos(e(_115506,_115508),trigPos(done,rhs([~(t(_115506,_115508))]))) proof:

%    1.1 ==>((e(A,B),done),~(t(A,B)))
% ====

% ====
trigPos(e(_117664,_117666),trigPos(notdone,rhs([t(_117664,_117666)]))) proof:

%    1.1 ==>((e(A,B),notdone),t(A,B))
% ====

% ====
trigPos(t(_116892,_116894),trigPos(e(_116894,_116906),trigPos(notdone,rhs([t(_116892,_116906)])))) proof:

%    1.1 ==>((t(A,B),e(B,C),notdone),t(A,C))
% ====

% ====
trigPos(done,rhs([~(t(1,2))])) proof:

%    1.1 e(1,2)
%    1.2 ==>((e(A,B),done),~(t(A,B)))
% ====

% ====
trigPos(notdone,rhs([t(1,2)])) proof:

%    1.1 e(1,2)
%    1.2 ==>((e(A,B),notdone),t(A,B))
% ====

% ====
trigPos(notdone,rhs([t(5,2)])) proof:

%    1.1 e(1,2)
%    1.2 t(5,1)
%    1.3 ==>((t(A,B),e(B,C),notdone),t(A,C))
% ====

% ====
trigPos(done,rhs([~(t(2,3))])) proof:

%    1.1 e(2,3)
%    1.2 ==>((e(A,B),done),~(t(A,B)))
% ====

% ====
trigPos(notdone,rhs([t(2,3)])) proof:

%    1.1 e(2,3)
%    1.2 ==>((e(A,B),notdone),t(A,B))
% ====

% ====
trigPos(notdone,rhs([t(1,3)])) proof:

%    1.1 e(2,3)
%    1.2 t(1,2)
%    1.3 ==>((t(A,B),e(B,C),notdone),t(A,C))
% ====

% ====
trigPos(done,rhs([~(t(3,4))])) proof:

%    1.1 e(3,4)
%    1.2 ==>((e(A,B),done),~(t(A,B)))
% ====

% ====
trigPos(notdone,rhs([t(3,4)])) proof:

%    1.1 e(3,4)
%    1.2 ==>((e(A,B),notdone),t(A,B))
% ====

% ====
trigPos(notdone,rhs([t(2,4)])) proof:

%    1.1 e(3,4)
%    1.2 t(2,3)
%    1.3 ==>((t(A,B),e(B,C),notdone),t(A,C))
% ====

% ====
trigPos(done,rhs([~(t(4,5))])) proof:

%    1.1 e(4,5)
%    1.2 ==>((e(A,B),done),~(t(A,B)))
% ====

% ====
trigPos(notdone,rhs([t(4,5)])) proof:

%    1.1 e(4,5)
%    1.2 ==>((e(A,B),notdone),t(A,B))
% ====

% ====
trigPos(notdone,rhs([t(3,5)])) proof:

%    1.1 e(4,5)
%    1.2 t(3,4)
%    1.3 ==>((t(A,B),e(B,C),notdone),t(A,C))
% ====

% ====
trigPos(done,rhs([~(t(5,1))])) proof:

%    1.1 e(5,1)
%    1.2 ==>((e(A,B),done),~(t(A,B)))
% ====

% ====
trigPos(notdone,rhs([t(5,1)])) proof:

%    1.1 e(5,1)
%    1.2 ==>((e(A,B),notdone),t(A,B))
% ====

% ====
trigPos(notdone,rhs([t(4,1)])) proof:

%    1.1 e(5,1)
%    1.2 t(4,5)
%    1.3 ==>((t(A,B),e(B,C),notdone),t(A,C))
% ====

% ====
trigPos(e(2,_116806),trigPos(notdone,rhs([t(1,_116806)]))) proof:

%    1.1 t(1,2)
%    1.2 ==>((t(A,B),e(B,C),notdone),t(A,C))
% ====

% ====
trigPos(e(3,_116576),trigPos(notdone,rhs([t(2,_116576)]))) proof:

%    1.1 t(2,3)
%    1.2 ==>((t(A,B),e(B,C),notdone),t(A,C))
% ====

% ====
trigPos(e(4,_116346),trigPos(notdone,rhs([t(3,_116346)]))) proof:

%    1.1 t(3,4)
%    1.2 ==>((t(A,B),e(B,C),notdone),t(A,C))
% ====

% ====
trigPos(e(5,_116116),trigPos(notdone,rhs([t(4,_116116)]))) proof:

%    1.1 t(4,5)
%    1.2 ==>((t(A,B),e(B,C),notdone),t(A,C))
% ====

% ====
trigPos(e(1,_115886),trigPos(notdone,rhs([t(5,_115886)]))) proof:

%    1.1 t(5,1)
%    1.2 ==>((t(A,B),e(B,C),notdone),t(A,C))
% ====


:- dynamic mpred_queue/2.


````

WARNING/Pfc: Couldn't db_retract t(1,2).
WARNING/Pfc: Couldn't db_retract t(2,3).
WARNING/Pfc: Couldn't db_retract t(3,4).
WARNING/Pfc: Couldn't db_retract t(4,5).
WARNING/Pfc: Couldn't db_retract t(5,1).

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
TML: ancestor(Ancestor_Param,Ancestor_Ret) :- parent(Ancestor_Param,Ancestor_Param2) ',' ancestor(Ancestor_Param2,Ancestor_Ret).


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
 ancestor('Grace','Fred').
 ancestor('Jack','CarolIII').
 ancestor('Jack','Fred').
 ancestor('Tom','Amy').
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
ancestor('Amy','CarolIII') proof:

%    1.1 ancestor('Fred','CarolIII')
%    1.2 parent('Amy','Fred')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('Amy','Fred') proof:

%    1.1 parent('Amy','Fred')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
ancestor('CarolI','CarolII') proof:

%    1.1 parent('CarolI','CarolII')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
ancestor('CarolI','CarolIII') proof:

%    1.1 ancestor('CarolII','CarolIII')
%    1.2 parent('CarolI','CarolII')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('CarolII','CarolIII') proof:

%    1.1 parent('CarolII','CarolIII')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
ancestor('Fred','CarolIII') proof:

%    1.1 parent('Fred','CarolIII')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
ancestor('Grace','Amy') proof:

%    1.1 parent('Grace','Amy')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
ancestor('Grace','Fred') proof:

%    1.1 ancestor('Amy','Fred')
%    1.2 parent('Grace','Amy')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('Jack','CarolIII') proof:

%    1.1 ancestor('Fred','CarolIII')
%    1.2 parent('Jack','Fred')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('Jack','Fred') proof:

%    1.1 parent('Jack','Fred')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
ancestor('Tom','Amy') proof:

%    1.1 parent('Tom','Amy')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
ancestor('Tom','Fred') proof:

%    1.1 ancestor('Amy','Fred')
%    1.2 parent('Tom','Amy')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('Tony','CarolII') proof:

%    1.1 parent('Tony','CarolII')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
ancestor('Tony','CarolIII') proof:

%    1.1 ancestor('CarolII','CarolIII')
%    1.2 parent('Tony','CarolII')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
parent('Amy','Fred') proof:

%    1.1 mother('Amy','Fred')
%    1.2 ==>(mother(A,B),parent(A,B))
% ====

% ====
parent('CarolI','CarolII') proof:

%    1.1 mother('CarolI','CarolII')
%    1.2 ==>(mother(A,B),parent(A,B))
% ====

% ====
parent('CarolII','CarolIII') proof:

%    1.1 mother('CarolII','CarolIII')
%    1.2 ==>(mother(A,B),parent(A,B))
% ====

% ====
parent('Fred','CarolIII') proof:

%    1.1 father('Fred','CarolIII')
%    1.2 ==>(father(A,B),parent(A,B))
% ====

% ====
parent('Grace','Amy') proof:

%    1.1 mother('Grace','Amy')
%    1.2 ==>(mother(A,B),parent(A,B))
% ====

% ====
parent('Jack','Fred') proof:

%    1.1 father('Jack','Fred')
%    1.2 ==>(father(A,B),parent(A,B))
% ====

% ====
parent('Tom','Amy') proof:

%    1.1 father('Tom','Amy')
%    1.2 ==>(father(A,B),parent(A,B))
% ====

% ====
parent('Tony','CarolII') proof:

%    1.1 father('Tony','CarolII')
%    1.2 ==>(father(A,B),parent(A,B))
% ====


% Current Rules...

 ==>(father(A,B),parent(A,B)).
 ==>(mother(A,B),parent(A,B)).
 ==>(parent(A,B),ancestor(A,B)).
 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C)).



% Positive triggers...
 trigPos(father(A,B),rhs([parent(A,B)])).
 trigPos(mother(A,B),rhs([parent(A,B)])).
 trigPos(parent(A,B),rhs([ancestor(A,B)])).
 trigPos(parent(A,B),trigPos(ancestor(B,C),rhs([ancestor(A,C)]))).
 trigPos(ancestor('Amy',A),rhs([ancestor('Tom',A)])).
 trigPos(ancestor('Fred',A),rhs([ancestor('Jack',A)])).
 trigPos(ancestor('CarolII',A),rhs([ancestor('Tony',A)])).
 trigPos(ancestor('CarolIII',A),rhs([ancestor('Fred',A)])).
 trigPos(ancestor('Amy',A),rhs([ancestor('Grace',A)])).
 trigPos(ancestor('Fred',A),rhs([ancestor('Amy',A)])).
 trigPos(ancestor('CarolII',A),rhs([ancestor('CarolI',A)])).
 trigPos(ancestor('CarolIII',A),rhs([ancestor('CarolII',A)])).

% Negative triggers...

% Goal (Backchain) triggers...

% Supports...
 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C)).
 ==>(father(A,B),parent(A,B)).
 ==>(mother(A,B),parent(A,B)).
 ==>(parent(A,B),ancestor(A,B)).
 father('Fred','CarolIII').
 father('Jack','Fred').
 father('Tom','Amy').
 father('Tony','CarolII').
 mother('Amy','Fred').
 mother('CarolI','CarolII').
 mother('CarolII','CarolIII').
 mother('Grace','Amy').
% ====
trigPos(parent(_174612,_174614),trigPos(ancestor(_174614,_174626),rhs([ancestor(_174612,_174626)]))) proof:

%    1.1 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
trigPos(father(_175864,_175866),rhs([parent(_175864,_175866)])) proof:

%    1.1 ==>(father(A,B),parent(A,B))
% ====

% ====
trigPos(mother(_175532,_175534),rhs([parent(_175532,_175534)])) proof:

%    1.1 ==>(mother(A,B),parent(A,B))
% ====

% ====
trigPos(parent(_175200,_175202),rhs([ancestor(_175200,_175202)])) proof:

%    1.1 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
ancestor('Grace','Fred') proof:

%    1.1 ancestor('Amy','Fred')
%    1.2 parent('Grace','Amy')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('Tom','Fred') proof:

%    1.1 ancestor('Amy','Fred')
%    1.2 parent('Tom','Amy')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('CarolI','CarolIII') proof:

%    1.1 ancestor('CarolII','CarolIII')
%    1.2 parent('CarolI','CarolII')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('Tony','CarolIII') proof:

%    1.1 ancestor('CarolII','CarolIII')
%    1.2 parent('Tony','CarolII')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('Amy','CarolIII') proof:

%    1.1 ancestor('Fred','CarolIII')
%    1.2 parent('Amy','Fred')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('Jack','CarolIII') proof:

%    1.1 ancestor('Fred','CarolIII')
%    1.2 parent('Jack','Fred')
%    1.3 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
parent('Fred','CarolIII') proof:

%    1.1 father('Fred','CarolIII')
%    1.2 ==>(father(A,B),parent(A,B))
% ====

% ====
parent('Jack','Fred') proof:

%    1.1 father('Jack','Fred')
%    1.2 ==>(father(A,B),parent(A,B))
% ====

% ====
parent('Tom','Amy') proof:

%    1.1 father('Tom','Amy')
%    1.2 ==>(father(A,B),parent(A,B))
% ====

% ====
parent('Tony','CarolII') proof:

%    1.1 father('Tony','CarolII')
%    1.2 ==>(father(A,B),parent(A,B))
% ====

% ====
parent('Amy','Fred') proof:

%    1.1 mother('Amy','Fred')
%    1.2 ==>(mother(A,B),parent(A,B))
% ====

% ====
parent('CarolI','CarolII') proof:

%    1.1 mother('CarolI','CarolII')
%    1.2 ==>(mother(A,B),parent(A,B))
% ====

% ====
parent('CarolII','CarolIII') proof:

%    1.1 mother('CarolII','CarolIII')
%    1.2 ==>(mother(A,B),parent(A,B))
% ====

% ====
parent('Grace','Amy') proof:

%    1.1 mother('Grace','Amy')
%    1.2 ==>(mother(A,B),parent(A,B))
% ====

% ====
trigPos(ancestor('Fred',_173846),rhs([ancestor('Amy',_173846)])) proof:

%    1.1 parent('Amy','Fred')
%    1.2 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('Amy','Fred') proof:

%    1.1 parent('Amy','Fred')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
trigPos(ancestor('CarolII',_173696),rhs([ancestor('CarolI',_173696)])) proof:

%    1.1 parent('CarolI','CarolII')
%    1.2 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('CarolI','CarolII') proof:

%    1.1 parent('CarolI','CarolII')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
trigPos(ancestor('CarolIII',_173546),rhs([ancestor('CarolII',_173546)])) proof:

%    1.1 parent('CarolII','CarolIII')
%    1.2 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('CarolII','CarolIII') proof:

%    1.1 parent('CarolII','CarolIII')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
trigPos(ancestor('CarolIII',_174088),rhs([ancestor('Fred',_174088)])) proof:

%    1.1 parent('Fred','CarolIII')
%    1.2 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('Fred','CarolIII') proof:

%    1.1 parent('Fred','CarolIII')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
trigPos(ancestor('Amy',_173996),rhs([ancestor('Grace',_173996)])) proof:

%    1.1 parent('Grace','Amy')
%    1.2 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('Grace','Amy') proof:

%    1.1 parent('Grace','Amy')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
trigPos(ancestor('Fred',_174388),rhs([ancestor('Jack',_174388)])) proof:

%    1.1 parent('Jack','Fred')
%    1.2 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('Jack','Fred') proof:

%    1.1 parent('Jack','Fred')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
trigPos(ancestor('Amy',_174538),rhs([ancestor('Tom',_174538)])) proof:

%    1.1 parent('Tom','Amy')
%    1.2 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('Tom','Amy') proof:

%    1.1 parent('Tom','Amy')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====

% ====
trigPos(ancestor('CarolII',_174238),rhs([ancestor('Tony',_174238)])) proof:

%    1.1 parent('Tony','CarolII')
%    1.2 ==>((parent(A,B),ancestor(B,C)),ancestor(A,C))
% ====

% ====
ancestor('Tony','CarolII') proof:

%    1.1 parent('Tony','CarolII')
%    1.2 ==>(parent(A,B),ancestor(A,B))
% ====


:- dynamic mpred_queue/2.


````

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
TML: ~ bird(Bird_Ret) :- dead(Bird_Ret).
TML: ~ human(Human_Ret) :- dead(Human_Ret).
TML: ~ mortal(Mortal_Ret) :- dead(Mortal_Ret).
TML: ~ being(Being_Ret) :- dead(Being_Ret).


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
being('Charlie') proof:

%    1.1 bird('Charlie')
%    1.2 ==>(bird(A),being(A))
% ====

% ====
being('Coco') proof:

%    1.1 bird('Coco')
%    1.2 ==>(bird(A),being(A))
% ====

% ====
being('Jane') proof:

%    1.1 human('Jane')
%    1.2 ==>(human(A),being(A))
% ====

% ====
being('John') proof:

%    1.1 human('John')
%    1.2 ==>(human(A),being(A))
% ====

% ====
mortal('Charlie') proof:

%    1.1 being('Charlie')
%    1.2 ==>(being(A),mortal(A))
% ====

% ====
mortal('Coco') proof:

%    1.1 being('Coco')
%    1.2 ==>(being(A),mortal(A))
% ====

% ====
mortal('Jane') proof:

%    1.1 being('Jane')
%    1.2 ==>(being(A),mortal(A))
% ====

% ====
mortal('John') proof:

%    1.1 being('John')
%    1.2 ==>(being(A),mortal(A))
% ====


% Current Rules...

 ==>(bird(A),being(A)).
 ==>(human(A),being(A)).
 ==>(being(A),mortal(A)).
 ==>((mortal(A),armageddon),dead(A)).
 ==>(dead(A),~(bird(A))).
 ==>(dead(A),~(human(A))).
 ==>(dead(A),~(mortal(A))).
 ==>(dead(A),~(being(A))).



% Positive triggers...
 trigPos(bird(A),rhs([being(A)])).
 trigPos(human(A),rhs([being(A)])).
 trigPos(being(A),rhs([mortal(A)])).
 trigPos(mortal(A),trigPos(armageddon,rhs([dead(A)]))).
 trigPos(armageddon,rhs([dead('Charlie')])).
 trigPos(armageddon,rhs([dead('Coco')])).
 trigPos(armageddon,rhs([dead('John')])).
 trigPos(armageddon,rhs([dead('Jane')])).
 trigPos(dead(A),rhs([~(bird(A))])).
 trigPos(dead(A),rhs([~(human(A))])).
 trigPos(dead(A),rhs([~(mortal(A))])).
 trigPos(dead(A),rhs([~(being(A))])).

% Negative triggers...

% Goal (Backchain) triggers...

% Supports...
 bird('Charlie').
 bird('Coco').
 human('Jane').
 human('John').
 ==>(being(A),mortal(A)).
 ==>(bird(A),being(A)).
 ==>(dead(A),~(being(A))).
 ==>(dead(A),~(mortal(A))).
 ==>(dead(A),~(human(A))).
 ==>(dead(A),~(bird(A))).
 ==>(human(A),being(A)).
 ==>((mortal(A),armageddon),dead(A)).
% ====
mortal('Charlie') proof:

%    1.1 being('Charlie')
%    1.2 ==>(being(A),mortal(A))
% ====

% ====
mortal('Coco') proof:

%    1.1 being('Coco')
%    1.2 ==>(being(A),mortal(A))
% ====

% ====
mortal('Jane') proof:

%    1.1 being('Jane')
%    1.2 ==>(being(A),mortal(A))
% ====

% ====
mortal('John') proof:

%    1.1 being('John')
%    1.2 ==>(being(A),mortal(A))
% ====

% ====
being('Charlie') proof:

%    1.1 bird('Charlie')
%    1.2 ==>(bird(A),being(A))
% ====

% ====
being('Coco') proof:

%    1.1 bird('Coco')
%    1.2 ==>(bird(A),being(A))
% ====

% ====
being('Jane') proof:

%    1.1 human('Jane')
%    1.2 ==>(human(A),being(A))
% ====

% ====
being('John') proof:

%    1.1 human('John')
%    1.2 ==>(human(A),being(A))
% ====

% ====
trigPos(armageddon,rhs([dead('Charlie')])) proof:

%    1.1 mortal('Charlie')
%    1.2 ==>((mortal(A),armageddon),dead(A))
% ====

% ====
trigPos(armageddon,rhs([dead('Coco')])) proof:

%    1.1 mortal('Coco')
%    1.2 ==>((mortal(A),armageddon),dead(A))
% ====

% ====
trigPos(armageddon,rhs([dead('Jane')])) proof:

%    1.1 mortal('Jane')
%    1.2 ==>((mortal(A),armageddon),dead(A))
% ====

% ====
trigPos(armageddon,rhs([dead('John')])) proof:

%    1.1 mortal('John')
%    1.2 ==>((mortal(A),armageddon),dead(A))
% ====

% ====
trigPos(being(_69324),rhs([mortal(_69324)])) proof:

%    1.1 ==>(being(A),mortal(A))
% ====

% ====
trigPos(bird(_69700),rhs([being(_69700)])) proof:

%    1.1 ==>(bird(A),being(A))
% ====

% ====
trigPos(dead(_68334),rhs([~(being(_68334))])) proof:

%    1.1 ==>(dead(A),~(being(A)))
% ====

% ====
trigPos(dead(_68434),rhs([~(mortal(_68434))])) proof:

%    1.1 ==>(dead(A),~(mortal(A)))
% ====

% ====
trigPos(dead(_68534),rhs([~(human(_68534))])) proof:

%    1.1 ==>(dead(A),~(human(A)))
% ====

% ====
trigPos(dead(_68634),rhs([~(bird(_68634))])) proof:

%    1.1 ==>(dead(A),~(bird(A)))
% ====

% ====
trigPos(human(_69512),rhs([being(_69512)])) proof:

%    1.1 ==>(human(A),being(A))
% ====

% ====
trigPos(mortal(_69024),trigPos(armageddon,rhs([dead(_69024)]))) proof:

%    1.1 ==>((mortal(A),armageddon),dead(A))
% ====


:- dynamic mpred_queue/2.


````

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
TML: ~ start :- running.
TML: stop :- running.
TML: ~ running :- stop.
TML: start :- stop.
TML: ~ stop :- start.


% User added facts:


% System infered facts:
 start.



% LogicMOO proofs:
% ====
start proof:

%    1.1 stop
%    1.2 ==>(stop,start)
% ====


% Current Rules...

 ==>(start,running).
 ==>(running,~(start)).
 ==>(running,stop).
 ==>(stop,~(running)).
 ==>(stop,start).
 ==>(start,~(stop)).



% Positive triggers...
 trigPos(start,rhs([running])).
 trigPos(running,rhs([~(start)])).
 trigPos(running,rhs([stop])).
 trigPos(stop,rhs([~(running)])).
 trigPos(stop,rhs([start])).
 trigPos(start,rhs([~(stop)])).

% Negative triggers...

% Goal (Backchain) triggers...

% Supports...
 ==>(running,stop).
 ==>(running,~(start)).
 ==>(start,running).
 ==>(start,~(stop)).
 ==>(stop,start).
 ==>(stop,~(running)).
% ====
stop proof:

%    1.1 running
%    1.2 ==>(running,stop)
% ====

% ====
running proof:

%    1.1 start
%    1.2 ==>(start,running)
% ====

% ====
start proof:

%    1.1 stop
%    1.2 ==>(stop,start)
% ====

% ====
trigPos(running,rhs([stop])) proof:

%    1.1 ==>(running,stop)
% ====

% ====
trigPos(running,rhs([~(start)])) proof:

%    1.1 ==>(running,~(start))
% ====

% ====
trigPos(start,rhs([running])) proof:

%    1.1 ==>(start,running)
% ====

% ====
trigPos(start,rhs([~(stop)])) proof:

%    1.1 ==>(start,~(stop))
% ====

% ====
trigPos(stop,rhs([start])) proof:

%    1.1 ==>(stop,start)
% ====

% ====
trigPos(stop,rhs([~(running)])) proof:

%    1.1 ==>(stop,~(running))
% ====


:- dynamic mpred_queue/2.


````

WARNING/Pfc: Couldn't db_retract running.
WARNING/Pfc: Couldn't db_retract stop.

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
% ===PROCESS====================
TML: start.
TML: running :- start.
TML: ~ start :- running.


% User added facts:


% System infered facts:
 running.



% LogicMOO proofs:
% ====
running proof:

%    1.1 start
%    1.2 ==>(start,running)
% ====


% Current Rules...

 ==>(start,running).
 ==>(running,~(start)).



% Positive triggers...
 trigPos(start,rhs([running])).
 trigPos(running,rhs([~(start)])).

% Negative triggers...

% Goal (Backchain) triggers...

% Supports...
 ==>(running,~(start)).
 ==>(start,running).
% ====
running proof:

%    1.1 start
%    1.2 ==>(start,running)
% ====

% ====
trigPos(running,rhs([~(start)])) proof:

%    1.1 ==>(running,~(start))
% ====

% ====
trigPos(start,rhs([running])) proof:

%    1.1 ==>(start,running)
% ====


:- dynamic mpred_queue/2.


````
% init_why(after('/opt/logicmoo_workspace/packs_sys/tauchain_prolog/tests/tml_testing.pl')).
% init_why(program).
?- ^D
% halt
(base) root@gitlab:/opt/logicmoo_workspace/packs_sys/tauchain_prolog/tests#


