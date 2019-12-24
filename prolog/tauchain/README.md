````
Adding (u) j(A),k(B)==>bothJK(A,B)
Adding (u) bothJK(A,B),go==>jkGo(A,B)
Adding (u) j(1)
Adding (u) go
Adding (u) k(2)
Adding (g) bothJK(1,2)          % WHY k(2),trigPos(k(2),rhs([bothJK(1,2)])).

% /opt/logicmoo_workspace/packs_sys/tauchain_prolog/prolog/tauchain/tml_fwdchaing.pl:1847
%
% pfcShowWhy(bothJK(1, 2)).
Adding (g) jkGo(1,2)          % WHY go,trigPos(go,rhs([jkGo(1,2)])).
Justifications for bothJK(1,2):

%    1.1 k(2)
%    1.2 j(1)
%    1.3 j(A),k(B)==>bothJK(A,B)
%


% User added facts:
 go.
 j(1).
 k(2).



% LogicMOO infered facts:
% ====
 bothJK(1,2).

%    1.1 k(2)
%    1.2 j(1)
%    1.3 j(A),k(B)==>bothJK(A,B)
% ====

% ====
 jkGo(1,2).

%    1.1 go
%    1.2 bothJK(1,2)
%    1.3 bothJK(A,B),go==>jkGo(A,B)
% ====


% Rules...
 j(A),k(B)==>bothJK(A,B).
 bothJK(A,B),go==>jkGo(A,B).



Adding (u) faz(A),~baz(B)/{A=:=B}==>fazbaz(A)
Adding (u) fazbaz(A),go==>found(A)
Adding (u) found(A),{A>=100}==>big(A)
Adding (u) found(A),{A>=10,A<100}==>medium(A)
Adding (u) found(A),{A<10}==>little(A)
Adding (u) faz(1)
Adding (g) fazbaz(1)          % WHY \+baz(A),trigNeg(baz(B),(pfcBC(baz(A)),1=:=A),rhs([fazbaz(1)])).
Adding (g) found(1)          % WHY go,trigPos(go,rhs([found(1)])).
Adding (g) little(1)          % WHY found(1),trigPos(found(1),(1<10->rhs([little(1)]))).
Adding (u) goAhead
Adding (u) baz(2)
Adding (u) baz(1)

Removing fazbaz(1).
% /opt/logicmoo_workspace/packs_sys/tauchain_prolog/prolog/tauchain/tml_fwdchaing.pl:1859
%


% User added facts:
 go.
 goAhead.
 baz(1).
 baz(2).
 faz(1).
 j(1).
 k(2).



% LogicMOO infered facts:
% ====
 found(1).

%    1.1 go
%    1.2 fazbaz(1)
%    1.3 fazbaz(A),go==>found(A)
% ====

% ====
 little(1).

%    1.1 found(1)
%    1.2 found(A),{A<10}==>little(A)
% ====

% ====
 bothJK(1,2).

%    1.1 k(2)
%    1.2 j(1)
%    1.3 j(A),k(B)==>bothJK(A,B)
% ====

% ====
 jkGo(1,2).

%    1.1 go
%    1.2 bothJK(1,2)
%    1.3 bothJK(A,B),go==>jkGo(A,B)
% ====


% Rules...
 j(A),k(B)==>bothJK(A,B).
 bothJK(A,B),go==>jkGo(A,B).
 faz(A),~baz(B)/{A=:=B}==>fazbaz(A).
 fazbaz(A),go==>found(A).
 found(A),{A>=100}==>big(A).
 found(A),{A>=10,A<100}==>medium(A).
 found(A),{A<10}==>little(A).



TML: e(1,2).
TML: e(2,1).
TML: e(X,Y):-e(X,Z),e(Z,Y).
TML: not('S'(X,X)):-'S'(X,X).
TML: not(prog(X,X)):-prog(X,X).
TML: not(alt(X,X)):-alt(X,X).
TML: not(alts(X,X)):-alts(X,X).
TML: a(b,c).
TML: a(b(c)).
TML: a(1,2,3).
TML: rel(t,1,2).
TML: b(X).
TML: '@trace'(foo).
TML: '@trace'(bar).
TML: r.
TML: HI.
TML: '@treequery'(rel(t,1,2)).
TML: '@ask'(rel(t,1,2)).
TML: a(b,c).
TML: a(b(c)).
TML: '@finline'([a(1,2,3),rel(t,'$VAR'('1'),2),b(X),r]).
TML: '@treequery'(rel(t,1,2)).
TML: '@ask'(rel(t,1,2)).
TML: '@treequery'(e(X,v1)).
TML: '@ask'(e(X,v1)).
TML: father('Tom','Amy').
TML: father('Jack','Fred').
TML: father('Tony','CarolII').
TML: father('Fred','CarolIII').
TML: mother('Grace','Amy').
TML: mother('Amy','Fred').
TML: mother('CarolI','CarolII').
TML: mother('CarolII','CarolIII').
TML: parent(X,Y):-father(X,Y).
TML: parent(X,Y):-mother(X,Y).
TML: ancestor(X,Y):-parent(X,Y).
TML: ancestor(X,Y):-parent(X,Z),ancestor(Z,Y).
TML: e(v1,v2).
TML: e(X,Y):-e(X,Z),e(Z,Y).
TML: e(v2,v3).
TML: e(v3,v4).
TML: e(v4,v5).
TML: e(v5,v1).
TML: e(X,Y):-e(X,Z),e(Z,Y).
TML: '@treequery'(e(X,v1)).
TML: '@treequery'(e(X,v1)).
TML: '@finline'([a(b,c,d),(not(e(X,X)):-e(X,X))]).
````

== TEST: INTRO
````
# Enter your TML logic program here and
# press RUN to execute.
#
# Any text following the '#' character is
# a comment and is ignored by TML.
#
# Logic programs consist of logic clauses.
# This program has no logic clause.
#
# Clauses can be either FACTS or RULES and
# they are terminated by the '.' character
# like sentences in English.
````
% /opt/logicmoo_workspace/packs_sys/tauchain_prolog/prolog/tauchain/tml_interp.pl:47
% ===PROCESS====================
````
% ===SUCESSS====================


% User added facts:


% LogicMOO infered facts:
% Rules...



````

== TEST: EFACTS
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
% ===PROCESS====================
````
TML: father('Tom','Amy').
Adding (u) father('Tom','Amy')
TML: canFly(bird).
Adding (u) canFly(bird)
TML: edge(6,3).
Adding (u) edge(6,3)
TML: night.
Adding (u) night
TML: holds(1,2).
Adding (u) holds(1,2)
TML: direct('London','NY').
Adding (u) direct('London','NY')
TML: holds(3,9,12).
Adding (u) holds(3,9,12)
TML: beginsWithJ('Joe').
Adding (u) beginsWithJ('Joe')
% ===SUCESSS====================


% User added facts:
 night.
 beginsWithJ('Joe').
 canFly(bird).
 direct('London','NY').
 edge(6,3).
 father('Tom','Amy').
 holds(1,2).
 holds(3,9,12).



% LogicMOO infered facts:
% Rules...



````

== TEST: ERELATIONS
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
% ===PROCESS====================
````
TML: beginsWithJ('Jane').
Adding (u) beginsWithJ('Jane')
TML: beginsWithJ('John').
Adding (u) beginsWithJ('John')
TML: beginsWithJ('Jack').
Adding (u) beginsWithJ('Jack')
TML: uncle('Jim','Joe').
Adding (u) uncle('Jim','Joe')
TML: uncle('Joe','Jill').
Adding (u) uncle('Joe','Jill')
TML: uncle('Joe','Jack').
Adding (u) uncle('Joe','Jack')
TML: employee('John','Doe',sales).
Adding (u) employee('John','Doe',sales)
TML: employee('Jane','Doe',support).
Adding (u) employee('Jane','Doe',support)
% ===SUCESSS====================


% User added facts:
 beginsWithJ('Jack').
 beginsWithJ('Jane').
 beginsWithJ('John').
 uncle('Jim','Joe').
 uncle('Joe','Jack').
 uncle('Joe','Jill').
 employee('Jane','Doe',support).
 employee('John','Doe',sales).



% LogicMOO infered facts:
% Rules...



````

== TEST: EARITY
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
% ===PROCESS====================
````
TML: rain.
Adding (u) rain
TML: night.
Adding (u) night
TML: happy('Sue').
Adding (u) happy('Sue')
TML: barks('Max').
Adding (u) barks('Max')
TML: mother('Jane','Jack').
Adding (u) mother('Jane','Jack')
TML: employee('John','Doe').
Adding (u) employee('John','Doe')
TML: married('Tom','Jane',2004).
Adding (u) married('Tom','Jane',2004)
TML: employee('Jane','Doe',support).
Adding (u) employee('Jane','Doe',support)
TML: a(1,2,3,4,5,6).
Adding (u) a(1,2,3,4,5,6)
% ===SUCESSS====================


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



% LogicMOO infered facts:
% Rules...



````

== TEST: ERULES
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
% ===PROCESS====================
````
TML: rain.
Adding (u) rain
TML: wet:-rain.
Adding (u) rain==>wet
Adding (g) wet          % WHY rain,trigPos(rain,rhs([wet])).
TML: freezing:-bellowZero.
Adding (u) bellowZero==>freezing
% ===SUCESSS====================


% User added facts:
 rain.



% LogicMOO infered facts:
% ====
 wet.

%    1.1 rain
%    1.2 rain==>wet
% ====


% Rules...
 rain==>wet.
 bellowZero==>freezing.



````

== TEST: E1234
````

1 2.        # 1-2 exists.
1 4.        # 1-4 exists.
3 1 :- 1 3. # 3-1 exists if 1-3 exists.
2 1 :- 1 2. # 2-1 exists if 1-2 exists.

# Here TML infers 2 1 because there exist 1 2.
# You should see 1 2, 1 4 and 2 1 in the output.
# There is no 3 1 because there is no 1 3.


````
% ===PROCESS====================
````
TML: holds(1,2).
Adding (u) holds(1,2)
TML: holds(1,4).
Adding (u) holds(1,4)
TML: holds(3,1):-holds(1,3).
Adding (u) holds(1,3)==>holds(3,1)
TML: holds(2,1):-holds(1,2).
Adding (u) holds(1,2)==>holds(2,1)

% ===SUCESSS====================
Adding (g) holds(2,1)          % WHY holds(1,2),trigPos(holds(1,2),rhs([holds(2,1)])).

% User added facts:
 holds(1,2).
 holds(1,4).



% LogicMOO infered facts:
% ====
 holds(2,1).

%    1.1 holds(1,2)
%    1.2 holds(1,2)==>holds(2,1)
% ====


% Rules...
 holds(1,3)==>holds(3,1).
 holds(1,2)==>holds(2,1).



````

== TEST: EMADAM
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
% ===PROCESS====================
````
TML: employee('Suzi',female).
Adding (u) employee('Suzi',female)
TML: salutation('Suzi','Madam'):-employee('Suzi',female).
Adding (u) employee('Suzi',female)==>salutation('Suzi','Madam')

% ===SUCESSS====================
Adding (g) salutation('Suzi','Madam')          % WHY employee('Suzi',female),trigPos(employee('Suzi',female),rhs([salutation('Suzi','Madam')])).

% User added facts:
 employee('Suzi',female).



% LogicMOO infered facts:
% ====
 salutation('Suzi','Madam').

%    1.1 employee('Suzi',female)
%    1.2 employee('Suzi',female)==>salutation('Suzi','Madam')
% ====


% Rules...
 employee('Suzi',female)==>salutation('Suzi','Madam').



````

== TEST: EVARIABLES
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
% ===PROCESS====================
````
TML: bird('Charlie').
Adding (u) bird('Charlie')
TML: bird('Coco').
Adding (u) bird('Coco')
TML: cat('Bella').
Adding (u) cat('Bella')
TML: canFly(SOMETHING):-bird(SOMETHING).
Adding (u) bird(A)==>canFly(A)
Adding (g) canFly('Charlie')          % WHY bird('Charlie'),trigPos(bird(A),rhs([canFly(A)])).
Adding (g) canFly('Coco')          % WHY bird('Coco'),trigPos(bird(A),rhs([canFly(A)])).
TML: beeps(SOME):-bird(SOME).
Adding (u) bird(A)==>beeps(A)
Adding (g) beeps('Charlie')          % WHY bird('Charlie'),trigPos(bird(A),rhs([beeps(A)])).
Adding (g) beeps('Coco')          % WHY bird('Coco'),trigPos(bird(A),rhs([beeps(A)])).
TML: meows(SOME):-cat(SOME).
Adding (u) cat(A)==>meows(A)
Adding (g) meows('Bella')          % WHY cat('Bella'),trigPos(cat(A),rhs([meows(A)])).
TML: employee('Suzi',female).
Adding (u) employee('Suzi',female)
TML: employee('John',male).
Adding (u) employee('John',male)
TML: employee('Jane',female).
Adding (u) employee('Jane',female)
TML: salutation(PERSON,'Madam'):-employee(PERSON,female).
Adding (u) employee(A,female)==>salutation(A,'Madam')
Adding (g) salutation('Suzi','Madam')          % WHY employee('Suzi',female),trigPos(employee(A,female),rhs([salutation(A,'Madam')])).
Adding (g) salutation('Jane','Madam')          % WHY employee('Jane',female),trigPos(employee(A,female),rhs([salutation(A,'Madam')])).
TML: salutation(PERSON,'Sir'):-employee(PERSON,male).
Adding (u) employee(A,male)==>salutation(A,'Sir')
Adding (g) salutation('John','Sir')          % WHY employee('John',male),trigPos(employee(A,male),rhs([salutation(A,'Sir')])).
TML: parent(X,Y):-father(X,Y).
Adding (u) father(A,B)==>parent(A,B)
TML: parent(X,Y):-mother(X,Y).
Adding (u) mother(A,B)==>parent(A,B)
TML: father('Coco','Charlie').
Adding (u) father('Coco','Charlie')
Adding (g) parent('Coco','Charlie')          % WHY father('Coco','Charlie'),trigPos(father('Coco','Charlie'),rhs([parent('Coco','Charlie')])).
TML: mother('Suzi','John').
Adding (u) mother('Suzi','John')
Adding (g) parent('Suzi','John')          % WHY mother('Suzi','John'),trigPos(mother('Suzi','John'),rhs([parent('Suzi','John')])).
TML: bird('John').
Adding (u) bird('John')
Adding (g) canFly('John')          % WHY bird('John'),trigPos(bird('John'),rhs([canFly('John')])).

% ===SUCESSS====================
Adding (g) beeps('John')          % WHY bird('John'),trigPos(bird('John'),rhs([beeps('John')])).

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



% LogicMOO infered facts:
% ====
 beeps('Charlie').

%    1.1 bird('Charlie')
%    1.2 bird(A)==>beeps(A)
% ====

% ====
 beeps('Coco').

%    1.1 bird('Coco')
%    1.2 bird(A)==>beeps(A)
% ====

% ====
 beeps('John').

%    1.1 bird('John')
%    1.2 bird(A)==>beeps(A)
% ====

% ====
 canFly('Charlie').

%    1.1 bird('Charlie')
%    1.2 bird(A)==>canFly(A)
% ====

% ====
 canFly('Coco').

%    1.1 bird('Coco')
%    1.2 bird(A)==>canFly(A)
% ====

% ====
 canFly('John').

%    1.1 bird('John')
%    1.2 bird(A)==>canFly(A)
% ====

% ====
 meows('Bella').

%    1.1 cat('Bella')
%    1.2 cat(A)==>meows(A)
% ====

% ====
 parent('Coco','Charlie').

%    1.1 father('Coco','Charlie')
%    1.2 father(A,B)==>parent(A,B)
% ====

% ====
 parent('Suzi','John').

%    1.1 mother('Suzi','John')
%    1.2 mother(A,B)==>parent(A,B)
% ====

% ====
 salutation('Jane','Madam').

%    1.1 employee('Jane',female)
%    1.2 employee(A,female)==>salutation(A,'Madam')
% ====

% ====
 salutation('John','Sir').

%    1.1 employee('John',male)
%    1.2 employee(A,male)==>salutation(A,'Sir')
% ====

% ====
 salutation('Suzi','Madam').

%    1.1 employee('Suzi',female)
%    1.2 employee(A,female)==>salutation(A,'Madam')
% ====


% Rules...
 bird(A)==>canFly(A).
 bird(A)==>beeps(A).
 cat(A)==>meows(A).
 employee(A,female)==>salutation(A,'Madam').
 employee(A,male)==>salutation(A,'Sir').
 father(A,B)==>parent(A,B).
 mother(A,B)==>parent(A,B).



````

== TEST: AND/OR
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
% ===PROCESS====================
````
TML: boy(X):-child(X),male(X).
Adding (u) child(A),male(A)==>boy(A)
TML: girl(X):-child(X),female(X).
Adding (u) child(A),female(A)==>girl(A)
TML: human(X):-child(X).
Adding (u) child(A)==>human(A)
TML: human(X):-adult(X).
Adding (u) adult(A)==>human(A)
TML: adult('Amy').
Adding (u) adult('Amy')
Adding (g) human('Amy')          % WHY adult('Amy'),trigPos(adult('Amy'),rhs([human('Amy')])).
TML: child('John').
Adding (u) child('John')
Adding (g) human('John')          % WHY child('John'),trigPos(child('John'),rhs([human('John')])).
TML: child('Jack').
Adding (u) child('Jack')
Adding (g) human('Jack')          % WHY child('Jack'),trigPos(child('Jack'),rhs([human('Jack')])).
TML: child('Jane').
Adding (u) child('Jane')
Adding (g) human('Jane')          % WHY child('Jane'),trigPos(child('Jane'),rhs([human('Jane')])).
TML: child('Suzi').
Adding (u) child('Suzi')
Adding (g) human('Suzi')          % WHY child('Suzi'),trigPos(child('Suzi'),rhs([human('Suzi')])).
TML: male('John').
Adding (u) male('John')
Adding (g) boy('John')          % WHY male('John'),trigPos(male('John'),rhs([boy('John')])).
TML: male('Jack').
Adding (u) male('Jack')
Adding (g) boy('Jack')          % WHY male('Jack'),trigPos(male('Jack'),rhs([boy('Jack')])).
TML: female('Amy').
Adding (u) female('Amy')
TML: female('Jane').
Adding (u) female('Jane')
Adding (g) girl('Jane')          % WHY female('Jane'),trigPos(female('Jane'),rhs([girl('Jane')])).
TML: female('Suzi').
Adding (u) female('Suzi')

% ===SUCESSS====================
Adding (g) girl('Suzi')          % WHY female('Suzi'),trigPos(female('Suzi'),rhs([girl('Suzi')])).

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



% LogicMOO infered facts:
% ====
 boy('Jack').

%    1.1 male('Jack')
%    1.2 child('Jack')
%    1.3 child(A),male(A)==>boy(A)
% ====

% ====
 boy('John').

%    1.1 male('John')
%    1.2 child('John')
%    1.3 child(A),male(A)==>boy(A)
% ====

% ====
 girl('Jane').

%    1.1 female('Jane')
%    1.2 child('Jane')
%    1.3 child(A),female(A)==>girl(A)
% ====

% ====
 girl('Suzi').

%    1.1 female('Suzi')
%    1.2 child('Suzi')
%    1.3 child(A),female(A)==>girl(A)
% ====

% ====
 human('Amy').

%    1.1 adult('Amy')
%    1.2 adult(A)==>human(A)
% ====

% ====
 human('Jack').

%    1.1 child('Jack')
%    1.2 child(A)==>human(A)
% ====

% ====
 human('Jane').

%    1.1 child('Jane')
%    1.2 child(A)==>human(A)
% ====

% ====
 human('John').

%    1.1 child('John')
%    1.2 child(A)==>human(A)
% ====

% ====
 human('Suzi').

%    1.1 child('Suzi')
%    1.2 child(A)==>human(A)
% ====


% Rules...
 child(A),male(A)==>boy(A).
 child(A),female(A)==>girl(A).
 child(A)==>human(A).
 adult(A)==>human(A).



````

== TEST: ERECURSION
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
% ===PROCESS====================
````
TML: parent('Fred','Sue').
Adding (u) parent('Fred','Sue')
TML: parent('Jack','Fred').
Adding (u) parent('Jack','Fred')
TML: parent('Amy','Fred').
Adding (u) parent('Amy','Fred')
TML: parent('Grace','Amy').
Adding (u) parent('Grace','Amy')
TML: parent('Tom','Amy').
Adding (u) parent('Tom','Amy')
TML: ancestor(ANC,CHILD):-parent(ANC,CHILD).
Adding (u) parent(A,B)==>ancestor(A,B)
Adding (g) ancestor('Fred','Sue')          % WHY parent('Fred','Sue'),trigPos(parent(A,B),rhs([ancestor(A,B)])).
Adding (g) ancestor('Jack','Fred')          % WHY parent('Jack','Fred'),trigPos(parent(A,B),rhs([ancestor(A,B)])).
Adding (g) ancestor('Amy','Fred')          % WHY parent('Amy','Fred'),trigPos(parent(A,B),rhs([ancestor(A,B)])).
Adding (g) ancestor('Grace','Amy')          % WHY parent('Grace','Amy'),trigPos(parent(A,B),rhs([ancestor(A,B)])).
Adding (g) ancestor('Tom','Amy')          % WHY parent('Tom','Amy'),trigPos(parent(A,B),rhs([ancestor(A,B)])).
TML: ancestor(ANC,DESC):-parent(ANC,CHILD),ancestor(CHILD,DESC).
Adding (u) parent(A,B),ancestor(B,C)==>ancestor(A,C)
Adding (g) ancestor('Jack','Sue')          % WHY ancestor('Fred','Sue'),trigPos(ancestor('Fred',A),rhs([ancestor('Jack',A)])).
Adding (g) ancestor('Amy','Sue')          % WHY ancestor('Fred','Sue'),trigPos(ancestor('Fred',A),rhs([ancestor('Amy',A)])).
Adding (g) ancestor('Grace','Fred')          % WHY ancestor('Amy','Fred'),trigPos(ancestor('Amy',A),rhs([ancestor('Grace',A)])).
Adding (g) ancestor('Grace','Sue')          % WHY ancestor('Amy','Sue'),trigPos(ancestor('Amy',A),rhs([ancestor('Grace',A)])).
Adding (g) ancestor('Tom','Fred')          % WHY ancestor('Amy','Fred'),trigPos(ancestor('Amy',A),rhs([ancestor('Tom',A)])).

% ===SUCESSS====================
Adding (g) ancestor('Tom','Sue')          % WHY ancestor('Amy','Sue'),trigPos(ancestor('Amy',A),rhs([ancestor('Tom',A)])).

% User added facts:
 parent('Amy','Fred').
 parent('Fred','Sue').
 parent('Grace','Amy').
 parent('Jack','Fred').
 parent('Tom','Amy').



% LogicMOO infered facts:
% ====
 ancestor('Amy','Fred').

%    1.1 parent('Amy','Fred')
%    1.2 parent(A,B)==>ancestor(A,B)
% ====

% ====
 ancestor('Amy','Sue').

%    1.1 ancestor('Fred','Sue')
%    1.2 parent('Amy','Fred')
%    1.3 parent(A,B),ancestor(B,C)==>ancestor(A,C)
% ====

% ====
 ancestor('Fred','Sue').

%    1.1 parent('Fred','Sue')
%    1.2 parent(A,B)==>ancestor(A,B)
% ====

% ====
 ancestor('Grace','Amy').

%    1.1 parent('Grace','Amy')
%    1.2 parent(A,B)==>ancestor(A,B)
% ====

% ====
 ancestor('Grace','Fred').

%    1.1 ancestor('Amy','Fred')
%    1.2 parent('Grace','Amy')
%    1.3 parent(A,B),ancestor(B,C)==>ancestor(A,C)
% ====

% ====
 ancestor('Grace','Sue').

%    1.1 ancestor('Amy','Sue')
%    1.2 parent('Grace','Amy')
%    1.3 parent(A,B),ancestor(B,C)==>ancestor(A,C)
% ====

% ====
 ancestor('Jack','Fred').

%    1.1 parent('Jack','Fred')
%    1.2 parent(A,B)==>ancestor(A,B)
% ====

% ====
 ancestor('Jack','Sue').

%    1.1 ancestor('Fred','Sue')
%    1.2 parent('Jack','Fred')
%    1.3 parent(A,B),ancestor(B,C)==>ancestor(A,C)
% ====

% ====
 ancestor('Tom','Amy').

%    1.1 parent('Tom','Amy')
%    1.2 parent(A,B)==>ancestor(A,B)
% ====

% ====
 ancestor('Tom','Fred').

%    1.1 ancestor('Amy','Fred')
%    1.2 parent('Tom','Amy')
%    1.3 parent(A,B),ancestor(B,C)==>ancestor(A,C)
% ====

% ====
 ancestor('Tom','Sue').

%    1.1 ancestor('Amy','Sue')
%    1.2 parent('Tom','Amy')
%    1.3 parent(A,B),ancestor(B,C)==>ancestor(A,C)
% ====


% Rules...
 parent(A,B)==>ancestor(A,B).
 parent(A,B),ancestor(B,C)==>ancestor(A,C).



````

== TEST: TRANSITIVE CLOSURE
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
% ===PROCESS====================
````
TML: e(1,2).
Adding (u) e(1,2)
TML: e(2,3).
Adding (u) e(2,3)
TML: e(3,4).
Adding (u) e(3,4)
TML: e(4,5).
Adding (u) e(4,5)
TML: e(5,1).
Adding (u) e(5,1)
TML: e(8,9).
Adding (u) e(8,9)
TML: tc(X,Y):-e(X,Y).
Adding (u) e(A,B)==>tc(A,B)
Adding (g) tc(1,2)          % WHY e(1,2),trigPos(e(A,B),rhs([tc(A,B)])).
Adding (g) tc(2,3)          % WHY e(2,3),trigPos(e(A,B),rhs([tc(A,B)])).
Adding (g) tc(3,4)          % WHY e(3,4),trigPos(e(A,B),rhs([tc(A,B)])).
Adding (g) tc(4,5)          % WHY e(4,5),trigPos(e(A,B),rhs([tc(A,B)])).
Adding (g) tc(5,1)          % WHY e(5,1),trigPos(e(A,B),rhs([tc(A,B)])).
Adding (g) tc(8,9)          % WHY e(8,9),trigPos(e(A,B),rhs([tc(A,B)])).
TML: tc(X,Y):-tc(X,Z),e(Z,Y).
Adding (u) tc(A,B),e(B,C)==>tc(A,C)
Adding (g) tc(1,3)          % WHY e(2,3),trigPos(e(2,A),rhs([tc(1,A)])).
Adding (g) tc(1,4)          % WHY e(3,4),trigPos(e(3,A),rhs([tc(1,A)])).
Adding (g) tc(1,5)          % WHY e(4,5),trigPos(e(4,A),rhs([tc(1,A)])).
Adding (g) tc(1,1)          % WHY e(5,1),trigPos(e(5,A),rhs([tc(1,A)])).
Adding (g) tc(2,4)          % WHY e(3,4),trigPos(e(3,A),rhs([tc(2,A)])).
Adding (g) tc(2,5)          % WHY e(4,5),trigPos(e(4,A),rhs([tc(2,A)])).
Adding (g) tc(2,1)          % WHY e(5,1),trigPos(e(5,A),rhs([tc(2,A)])).
Adding (g) tc(2,2)          % WHY e(1,2),trigPos(e(1,A),rhs([tc(2,A)])).
Adding (g) tc(3,5)          % WHY e(4,5),trigPos(e(4,A),rhs([tc(3,A)])).
Adding (g) tc(3,1)          % WHY e(5,1),trigPos(e(5,A),rhs([tc(3,A)])).
Adding (g) tc(3,2)          % WHY e(1,2),trigPos(e(1,A),rhs([tc(3,A)])).
Adding (g) tc(3,3)          % WHY e(2,3),trigPos(e(2,A),rhs([tc(3,A)])).
Adding (g) tc(4,1)          % WHY e(5,1),trigPos(e(5,A),rhs([tc(4,A)])).
Adding (g) tc(4,2)          % WHY e(1,2),trigPos(e(1,A),rhs([tc(4,A)])).
Adding (g) tc(4,3)          % WHY e(2,3),trigPos(e(2,A),rhs([tc(4,A)])).
Adding (g) tc(4,4)          % WHY e(3,4),trigPos(e(3,A),rhs([tc(4,A)])).
Adding (g) tc(5,2)          % WHY e(1,2),trigPos(e(1,A),rhs([tc(5,A)])).
Adding (g) tc(5,3)          % WHY e(2,3),trigPos(e(2,A),rhs([tc(5,A)])).
Adding (g) tc(5,4)          % WHY e(3,4),trigPos(e(3,A),rhs([tc(5,A)])).

% ===SUCESSS====================
Adding (g) tc(5,5)          % WHY e(4,5),trigPos(e(4,A),rhs([tc(5,A)])).

% User added facts:
 e(1,2).
 e(2,3).
 e(3,4).
 e(4,5).
 e(5,1).
 e(8,9).



% LogicMOO infered facts:
% ====
 tc(1,1).

%    1.1 e(5,1)
%    1.2 tc(1,5)
%    1.3 tc(A,B),e(B,C)==>tc(A,C)
% ====

% ====
 tc(1,2).

%    1.1 e(1,2)
%    1.2 e(A,B)==>tc(A,B)

%    2.1 e(1,2)
%    2.2 tc(1,1)
%    2.3 tc(A,B),e(B,C)==>tc(A,C)

%    3.1 e(1,2)
%    3.2 tc(2,2)
%    3.3 tc(A,B),e(B,C)==>tc(A,C)

%    4.1 e(1,2)
%    4.2 tc(3,3)
%    4.3 tc(A,B),e(B,C)==>tc(A,C)

%    5.1 e(1,2)
%    5.2 tc(4,4)
%    5.3 tc(A,B),e(B,C)==>tc(A,C)

%    6.1 e(1,2)
%    6.2 tc(5,5)
%    6.3 tc(A,B),e(B,C)==>tc(A,C)

%    7.1 e(1,2)
%    7.2 e(A,B)==>tc(A,B)

%    8.1 e(1,2)
%    8.2 tc(1,1)
%    8.3 tc(A,B),e(B,C)==>tc(A,C)
% ====

% ====
 tc(1,3).

%    1.1 e(2,3)
%    1.2 tc(1,2)
%    1.3 tc(A,B),e(B,C)==>tc(A,C)
% ====

% ====
 tc(1,4).

%    1.1 e(3,4)
%    1.2 tc(1,3)
%    1.3 tc(A,B),e(B,C)==>tc(A,C)
% ====

% ====
 tc(1,5).

%    1.1 e(4,5)
%    1.2 tc(1,4)
%    1.3 tc(A,B),e(B,C)==>tc(A,C)
% ====

% ====
 tc(2,1).

%    1.1 e(5,1)
%    1.2 tc(2,5)
%    1.3 tc(A,B),e(B,C)==>tc(A,C)
% ====

% ====
 tc(2,2).

%    1.1 e(1,2)
%    1.2 tc(2,1)
%    1.3 tc(A,B),e(B,C)==>tc(A,C)
% ====

% ====
 tc(2,3).

%    1.1 e(2,3)
%    1.2 e(A,B)==>tc(A,B)

%    2.1 e(2,3)
%    2.2 tc(1,1)
%    2.3 tc(A,B),e(B,C)==>tc(A,C)

%    3.1 e(2,3)
%    3.2 tc(2,2)
%    3.3 tc(A,B),e(B,C)==>tc(A,C)

%    4.1 e(2,3)
%    4.2 tc(3,3)
%    4.3 tc(A,B),e(B,C)==>tc(A,C)

%    5.1 e(2,3)
%    5.2 tc(4,4)
%    5.3 tc(A,B),e(B,C)==>tc(A,C)

%    6.1 e(2,3)
%    6.2 tc(5,5)
%    6.3 tc(A,B),e(B,C)==>tc(A,C)

%    7.1 e(2,3)
%    7.2 e(A,B)==>tc(A,B)

%    8.1 e(2,3)
%    8.2 tc(2,2)
%    8.3 tc(A,B),e(B,C)==>tc(A,C)
% ====

% ====
 tc(2,4).

%    1.1 e(3,4)
%    1.2 tc(2,3)
%    1.3 tc(A,B),e(B,C)==>tc(A,C)
% ====

% ====
 tc(2,5).

%    1.1 e(4,5)
%    1.2 tc(2,4)
%    1.3 tc(A,B),e(B,C)==>tc(A,C)
% ====

% ====
 tc(3,1).

%    1.1 e(5,1)
%    1.2 tc(3,5)
%    1.3 tc(A,B),e(B,C)==>tc(A,C)
% ====

% ====
 tc(3,2).

%    1.1 e(1,2)
%    1.2 tc(3,1)
%    1.3 tc(A,B),e(B,C)==>tc(A,C)
% ====

% ====
 tc(3,3).

%    1.1 e(2,3)
%    1.2 tc(3,2)
%    1.3 tc(A,B),e(B,C)==>tc(A,C)
% ====

% ====
 tc(3,4).

%    1.1 e(3,4)
%    1.2 e(A,B)==>tc(A,B)

%    2.1 e(3,4)
%    2.2 tc(1,1)
%    2.3 tc(A,B),e(B,C)==>tc(A,C)

%    3.1 e(3,4)
%    3.2 tc(2,2)
%    3.3 tc(A,B),e(B,C)==>tc(A,C)

%    4.1 e(3,4)
%    4.2 tc(3,3)
%    4.3 tc(A,B),e(B,C)==>tc(A,C)

%    5.1 e(3,4)
%    5.2 tc(4,4)
%    5.3 tc(A,B),e(B,C)==>tc(A,C)

%    6.1 e(3,4)
%    6.2 tc(5,5)
%    6.3 tc(A,B),e(B,C)==>tc(A,C)

%    7.1 e(3,4)
%    7.2 e(A,B)==>tc(A,B)

%    8.1 e(3,4)
%    8.2 tc(3,3)
%    8.3 tc(A,B),e(B,C)==>tc(A,C)
% ====

% ====
 tc(3,5).

%    1.1 e(4,5)
%    1.2 tc(3,4)
%    1.3 tc(A,B),e(B,C)==>tc(A,C)
% ====

% ====
 tc(4,1).

%    1.1 e(5,1)
%    1.2 tc(4,5)
%    1.3 tc(A,B),e(B,C)==>tc(A,C)
% ====

% ====
 tc(4,2).

%    1.1 e(1,2)
%    1.2 tc(4,1)
%    1.3 tc(A,B),e(B,C)==>tc(A,C)
% ====

% ====
 tc(4,3).

%    1.1 e(2,3)
%    1.2 tc(4,2)
%    1.3 tc(A,B),e(B,C)==>tc(A,C)
% ====

% ====
 tc(4,4).

%    1.1 e(3,4)
%    1.2 tc(4,3)
%    1.3 tc(A,B),e(B,C)==>tc(A,C)
% ====

% ====
 tc(4,5).

%    1.1 e(4,5)
%    1.2 e(A,B)==>tc(A,B)

%    2.1 e(4,5)
%    2.2 tc(1,1)
%    2.3 tc(A,B),e(B,C)==>tc(A,C)

%    3.1 e(4,5)
%    3.2 tc(2,2)
%    3.3 tc(A,B),e(B,C)==>tc(A,C)

%    4.1 e(4,5)
%    4.2 tc(3,3)
%    4.3 tc(A,B),e(B,C)==>tc(A,C)

%    5.1 e(4,5)
%    5.2 tc(4,4)
%    5.3 tc(A,B),e(B,C)==>tc(A,C)

%    6.1 e(4,5)
%    6.2 tc(5,5)
%    6.3 tc(A,B),e(B,C)==>tc(A,C)

%    7.1 e(4,5)
%    7.2 e(A,B)==>tc(A,B)

%    8.1 e(4,5)
%    8.2 tc(4,4)
%    8.3 tc(A,B),e(B,C)==>tc(A,C)
% ====

% ====
 tc(5,1).

%    1.1 e(5,1)
%    1.2 e(A,B)==>tc(A,B)

%    2.1 e(5,1)
%    2.2 tc(1,1)
%    2.3 tc(A,B),e(B,C)==>tc(A,C)

%    3.1 e(5,1)
%    3.2 tc(2,2)
%    3.3 tc(A,B),e(B,C)==>tc(A,C)

%    4.1 e(5,1)
%    4.2 tc(3,3)
%    4.3 tc(A,B),e(B,C)==>tc(A,C)

%    5.1 e(5,1)
%    5.2 tc(4,4)
%    5.3 tc(A,B),e(B,C)==>tc(A,C)

%    6.1 e(5,1)
%    6.2 tc(5,5)
%    6.3 tc(A,B),e(B,C)==>tc(A,C)

%    7.1 e(5,1)
%    7.2 e(A,B)==>tc(A,B)

%    8.1 e(5,1)
%    8.2 tc(5,5)
%    8.3 tc(A,B),e(B,C)==>tc(A,C)
% ====

% ====
 tc(5,2).

%    1.1 e(1,2)
%    1.2 tc(5,1)
%    1.3 tc(A,B),e(B,C)==>tc(A,C)
% ====

% ====
 tc(5,3).

%    1.1 e(2,3)
%    1.2 tc(5,2)
%    1.3 tc(A,B),e(B,C)==>tc(A,C)
% ====

% ====
 tc(5,4).

%    1.1 e(3,4)
%    1.2 tc(5,3)
%    1.3 tc(A,B),e(B,C)==>tc(A,C)
% ====

% ====
 tc(5,5).

%    1.1 e(4,5)
%    1.2 tc(5,4)
%    1.3 tc(A,B),e(B,C)==>tc(A,C)
% ====

% ====
 tc(8,9).

%    1.1 e(8,9)
%    1.2 e(A,B)==>tc(A,B)

%    2.1 e(8,9)
%    2.2 tc(1,1)
%    2.3 tc(A,B),e(B,C)==>tc(A,C)

%    3.1 e(8,9)
%    3.2 tc(2,2)
%    3.3 tc(A,B),e(B,C)==>tc(A,C)

%    4.1 e(8,9)
%    4.2 tc(3,3)
%    4.3 tc(A,B),e(B,C)==>tc(A,C)

%    5.1 e(8,9)
%    5.2 tc(4,4)
%    5.3 tc(A,B),e(B,C)==>tc(A,C)

%    6.1 e(8,9)
%    6.2 tc(5,5)
%    6.3 tc(A,B),e(B,C)==>tc(A,C)
% ====


% Rules...
 e(A,B)==>tc(A,B).
 tc(A,B),e(B,C)==>tc(A,C).



````

== TEST: ENEGATION
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
% ===PROCESS====================
````

WARNING/Pfc: Couldn't db_retract trigPos(e(1,_483212),rhs([tc(1,_483212)])).
WARNING/Pfc: Couldn't db_retract tc(1,2).
WARNING/Pfc: Couldn't db_retract trigPos(e(2,_483212),rhs([tc(2,_483212)])).
WARNING/Pfc: Couldn't db_retract tc(2,3).
WARNING/Pfc: Couldn't db_retract trigPos(e(3,_483212),rhs([tc(3,_483212)])).
WARNING/Pfc: Couldn't db_retract tc(3,4).
WARNING/Pfc: Couldn't db_retract trigPos(e(4,_483212),rhs([tc(4,_483212)])).
WARNING/Pfc: Couldn't db_retract tc(4,5).
WARNING/Pfc: Couldn't db_retract trigPos(e(5,_483212),rhs([tc(5,_483212)])).
WARNING/Pfc: Couldn't db_retract tc(5,1).
TML: bird('Coco').
Adding (u) bird('Coco')
TML: bird('Charlie').
Adding (u) bird('Charlie')
TML: wounded('Charlie').
Adding (u) wounded('Charlie')
TML: canFly(X):-bird(X),not(wounded(X)).
Adding (u) bird(A),\+wounded(A)==>canFly(A)

% ===SUCESSS====================
Adding (g) canFly('Coco')          % WHY \+wounded('Coco'),trigNeg(wounded('Coco'),pfcBC(wounded('Coco')),rhs([canFly('Coco')])).

% User added facts:
 bird('Charlie').
 bird('Coco').
 wounded('Charlie').



% LogicMOO infered facts:
% ====
 canFly('Coco').

%    1.1 \+wounded('Coco')
%    1.2 bird('Coco')
%    1.3 bird(A),\+wounded(A)==>canFly(A)
% ====


% Rules...
 bird(A),\+wounded(A)==>canFly(A).



````

== TEST: EDELETION
````
# Negation in heads deletes the fact from
# the database of facts.

happy.          # happy.
~happy :- sad.  # not happy if sad.
sad.            # sad.
# will result into 'sad'. No 'happy'.

````
% ===PROCESS====================
````
TML: happy.
Adding (u) happy
TML: not(happy):-sad.
Adding (u) sad==> \+happy
TML: sad.
Adding (u) sad

WARNING/Pfc: Couldn't db_retract spft(\+happy,pcfUser,pcfUser).
WARNING/Pfc: Couldn't db_retract support2(pcfUser,pcfUser,\+happy).

% ===SUCESSS====================
WARNING/Pfc: Couldn't db_retract support3(pcfUser,\+happy,pcfUser).

% User added facts:
 happy.
 sad.



% LogicMOO infered facts:
% Rules...
 sad==> \+happy.



````

== TEST: DIRECTEDGRAPH
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
% ===PROCESS====================
````
TML: e(1,2).
Adding (u) e(1,2)
TML: e(2,3).
Adding (u) e(2,3)
TML: e(3,4).
Adding (u) e(3,4)
TML: e(4,5).
Adding (u) e(4,5)
TML: e(5,1).
Adding (u) e(5,1)
TML: notdone.
Adding (u) notdone
TML: t(X,Y):-e(X,Y),notdone.
Adding (u) e(A,B),notdone==>t(A,B)
Adding (g) t(1,2)          % WHY notdone,trigPos(notdone,rhs([t(1,2)])).
Adding (g) t(2,3)          % WHY notdone,trigPos(notdone,rhs([t(2,3)])).
Adding (g) t(3,4)          % WHY notdone,trigPos(notdone,rhs([t(3,4)])).
Adding (g) t(4,5)          % WHY notdone,trigPos(notdone,rhs([t(4,5)])).
Adding (g) t(5,1)          % WHY notdone,trigPos(notdone,rhs([t(5,1)])).
TML: t(X,Z):-t(X,Y),e(Y,Z),notdone.
Adding (u) t(A,B),e(B,C),notdone==>t(A,C)
Adding (g) t(1,3)          % WHY notdone,trigPos(notdone,rhs([t(1,3)])).
Adding (g) t(1,4)          % WHY notdone,trigPos(notdone,rhs([t(1,4)])).
Adding (g) t(1,5)          % WHY notdone,trigPos(notdone,rhs([t(1,5)])).
Adding (g) t(1,1)          % WHY notdone,trigPos(notdone,rhs([t(1,1)])).
Adding (g) t(2,4)          % WHY notdone,trigPos(notdone,rhs([t(2,4)])).
Adding (g) t(2,5)          % WHY notdone,trigPos(notdone,rhs([t(2,5)])).
Adding (g) t(2,1)          % WHY notdone,trigPos(notdone,rhs([t(2,1)])).
Adding (g) t(2,2)          % WHY notdone,trigPos(notdone,rhs([t(2,2)])).
Adding (g) t(3,5)          % WHY notdone,trigPos(notdone,rhs([t(3,5)])).
Adding (g) t(3,1)          % WHY notdone,trigPos(notdone,rhs([t(3,1)])).
Adding (g) t(3,2)          % WHY notdone,trigPos(notdone,rhs([t(3,2)])).
Adding (g) t(3,3)          % WHY notdone,trigPos(notdone,rhs([t(3,3)])).
Adding (g) t(4,1)          % WHY notdone,trigPos(notdone,rhs([t(4,1)])).
Adding (g) t(4,2)          % WHY notdone,trigPos(notdone,rhs([t(4,2)])).
Adding (g) t(4,3)          % WHY notdone,trigPos(notdone,rhs([t(4,3)])).
Adding (g) t(4,4)          % WHY notdone,trigPos(notdone,rhs([t(4,4)])).
Adding (g) t(5,2)          % WHY notdone,trigPos(notdone,rhs([t(5,2)])).
Adding (g) t(5,3)          % WHY notdone,trigPos(notdone,rhs([t(5,3)])).
Adding (g) t(5,4)          % WHY notdone,trigPos(notdone,rhs([t(5,4)])).
Adding (g) t(5,5)          % WHY notdone,trigPos(notdone,rhs([t(5,5)])).
TML: done:-notdone.
Adding (u) notdone==>done
Adding (g) done          % WHY notdone,trigPos(notdone,rhs([done])).
TML: not(t(X,Y)):-e(X,Y),done.
Adding (u) e(A,B),done==> \+t(A,B)

WARNING/Pfc: Couldn't db_retract spft(\+t(1,2),pcfUser,pcfUser).
WARNING/Pfc: Couldn't db_retract support2(pcfUser,pcfUser,\+t(1,2)).
WARNING/Pfc: Couldn't db_retract support3(pcfUser,\+t(1,2),pcfUser).
WARNING/Pfc: Couldn't db_retract spft(\+t(2,3),pcfUser,pcfUser).
WARNING/Pfc: Couldn't db_retract support2(pcfUser,pcfUser,\+t(2,3)).
WARNING/Pfc: Couldn't db_retract support3(pcfUser,\+t(2,3),pcfUser).
WARNING/Pfc: Couldn't db_retract spft(\+t(3,4),pcfUser,pcfUser).
WARNING/Pfc: Couldn't db_retract support2(pcfUser,pcfUser,\+t(3,4)).
WARNING/Pfc: Couldn't db_retract support3(pcfUser,\+t(3,4),pcfUser).
WARNING/Pfc: Couldn't db_retract spft(\+t(4,5),pcfUser,pcfUser).
WARNING/Pfc: Couldn't db_retract support2(pcfUser,pcfUser,\+t(4,5)).
WARNING/Pfc: Couldn't db_retract support3(pcfUser,\+t(4,5),pcfUser).
WARNING/Pfc: Couldn't db_retract spft(\+t(5,1),pcfUser,pcfUser).
WARNING/Pfc: Couldn't db_retract support2(pcfUser,pcfUser,\+t(5,1)).
WARNING/Pfc: Couldn't db_retract support3(pcfUser,\+t(5,1),pcfUser).
TML: not(notdone):-done.
Adding (u) done==> \+notdone

WARNING/Pfc: Couldn't db_retract spft(\+notdone,pcfUser,pcfUser).
WARNING/Pfc: Couldn't db_retract support2(pcfUser,pcfUser,\+notdone).

% ===SUCESSS====================
WARNING/Pfc: Couldn't db_retract support3(pcfUser,\+notdone,pcfUser).

% User added facts:
 notdone.
 e(1,2).
 e(2,3).
 e(3,4).
 e(4,5).
 e(5,1).



% LogicMOO infered facts:
% ====
 done.

%    1.1 notdone
%    1.2 notdone==>done
% ====

% ====
 t(1,1).

%    1.1 notdone
%    1.2 e(5,1)
%    1.3 t(1,5)
%    1.4 t(A,B),e(B,C),notdone==>t(A,C)
% ====

% ====
 t(1,2).

%    1.1 notdone
%    1.2 e(1,2)
%    1.3 e(A,B),notdone==>t(A,B)

%    2.1 notdone
%    2.2 e(1,2)
%    2.3 t(1,1)
%    2.4 t(A,B),e(B,C),notdone==>t(A,C)

%    3.1 notdone
%    3.2 e(1,2)
%    3.3 t(2,2)
%    3.4 t(A,B),e(B,C),notdone==>t(A,C)

%    4.1 notdone
%    4.2 e(1,2)
%    4.3 t(3,3)
%    4.4 t(A,B),e(B,C),notdone==>t(A,C)

%    5.1 notdone
%    5.2 e(1,2)
%    5.3 t(4,4)
%    5.4 t(A,B),e(B,C),notdone==>t(A,C)

%    6.1 notdone
%    6.2 e(1,2)
%    6.3 t(5,5)
%    6.4 t(A,B),e(B,C),notdone==>t(A,C)

%    7.1 notdone
%    7.2 e(1,2)
%    7.3 e(A,B),notdone==>t(A,B)

%    8.1 notdone
%    8.2 e(1,2)
%    8.3 t(1,1)
%    8.4 t(A,B),e(B,C),notdone==>t(A,C)

%    9.1 notdone
%    9.2 e(1,2)
%    9.3 e(A,B),notdone==>t(A,B)

%    10.1 notdone
%    10.2 e(1,2)
%    10.3 t(1,1)
%    10.4 t(A,B),e(B,C),notdone==>t(A,C)

%    11.1 notdone
%    11.2 e(1,2)
%    11.3 t(2,2)
%    11.4 t(A,B),e(B,C),notdone==>t(A,C)

%    12.1 notdone
%    12.2 e(1,2)
%    12.3 t(3,3)
%    12.4 t(A,B),e(B,C),notdone==>t(A,C)

%    13.1 notdone
%    13.2 e(1,2)
%    13.3 t(4,4)
%    13.4 t(A,B),e(B,C),notdone==>t(A,C)

%    14.1 notdone
%    14.2 e(1,2)
%    14.3 t(5,5)
%    14.4 t(A,B),e(B,C),notdone==>t(A,C)

%    15.1 notdone
%    15.2 e(1,2)
%    15.3 e(A,B),notdone==>t(A,B)

%    16.1 notdone
%    16.2 e(1,2)
%    16.3 t(1,1)
%    16.4 t(A,B),e(B,C),notdone==>t(A,C)
% ====

% ====
 t(1,3).

%    1.1 notdone
%    1.2 e(2,3)
%    1.3 t(1,2)
%    1.4 t(A,B),e(B,C),notdone==>t(A,C)
% ====

% ====
 t(1,4).

%    1.1 notdone
%    1.2 e(3,4)
%    1.3 t(1,3)
%    1.4 t(A,B),e(B,C),notdone==>t(A,C)
% ====

% ====
 t(1,5).

%    1.1 notdone
%    1.2 e(4,5)
%    1.3 t(1,4)
%    1.4 t(A,B),e(B,C),notdone==>t(A,C)
% ====

% ====
 t(2,1).

%    1.1 notdone
%    1.2 e(5,1)
%    1.3 t(2,5)
%    1.4 t(A,B),e(B,C),notdone==>t(A,C)
% ====

% ====
 t(2,2).

%    1.1 notdone
%    1.2 e(1,2)
%    1.3 t(2,1)
%    1.4 t(A,B),e(B,C),notdone==>t(A,C)
% ====

% ====
 t(2,3).

%    1.1 notdone
%    1.2 e(2,3)
%    1.3 e(A,B),notdone==>t(A,B)

%    2.1 notdone
%    2.2 e(2,3)
%    2.3 t(1,1)
%    2.4 t(A,B),e(B,C),notdone==>t(A,C)

%    3.1 notdone
%    3.2 e(2,3)
%    3.3 t(2,2)
%    3.4 t(A,B),e(B,C),notdone==>t(A,C)

%    4.1 notdone
%    4.2 e(2,3)
%    4.3 t(3,3)
%    4.4 t(A,B),e(B,C),notdone==>t(A,C)

%    5.1 notdone
%    5.2 e(2,3)
%    5.3 t(4,4)
%    5.4 t(A,B),e(B,C),notdone==>t(A,C)

%    6.1 notdone
%    6.2 e(2,3)
%    6.3 t(5,5)
%    6.4 t(A,B),e(B,C),notdone==>t(A,C)

%    7.1 notdone
%    7.2 e(2,3)
%    7.3 e(A,B),notdone==>t(A,B)

%    8.1 notdone
%    8.2 e(2,3)
%    8.3 t(2,2)
%    8.4 t(A,B),e(B,C),notdone==>t(A,C)

%    9.1 notdone
%    9.2 e(2,3)
%    9.3 e(A,B),notdone==>t(A,B)

%    10.1 notdone
%    10.2 e(2,3)
%    10.3 t(1,1)
%    10.4 t(A,B),e(B,C),notdone==>t(A,C)

%    11.1 notdone
%    11.2 e(2,3)
%    11.3 t(2,2)
%    11.4 t(A,B),e(B,C),notdone==>t(A,C)

%    12.1 notdone
%    12.2 e(2,3)
%    12.3 t(3,3)
%    12.4 t(A,B),e(B,C),notdone==>t(A,C)

%    13.1 notdone
%    13.2 e(2,3)
%    13.3 t(4,4)
%    13.4 t(A,B),e(B,C),notdone==>t(A,C)

%    14.1 notdone
%    14.2 e(2,3)
%    14.3 t(5,5)
%    14.4 t(A,B),e(B,C),notdone==>t(A,C)

%    15.1 notdone
%    15.2 e(2,3)
%    15.3 e(A,B),notdone==>t(A,B)

%    16.1 notdone
%    16.2 e(2,3)
%    16.3 t(2,2)
%    16.4 t(A,B),e(B,C),notdone==>t(A,C)
% ====

% ====
 t(2,4).

%    1.1 notdone
%    1.2 e(3,4)
%    1.3 t(2,3)
%    1.4 t(A,B),e(B,C),notdone==>t(A,C)
% ====

% ====
 t(2,5).

%    1.1 notdone
%    1.2 e(4,5)
%    1.3 t(2,4)
%    1.4 t(A,B),e(B,C),notdone==>t(A,C)
% ====

% ====
 t(3,1).

%    1.1 notdone
%    1.2 e(5,1)
%    1.3 t(3,5)
%    1.4 t(A,B),e(B,C),notdone==>t(A,C)
% ====

% ====
 t(3,2).

%    1.1 notdone
%    1.2 e(1,2)
%    1.3 t(3,1)
%    1.4 t(A,B),e(B,C),notdone==>t(A,C)
% ====

% ====
 t(3,3).

%    1.1 notdone
%    1.2 e(2,3)
%    1.3 t(3,2)
%    1.4 t(A,B),e(B,C),notdone==>t(A,C)
% ====

% ====
 t(3,4).

%    1.1 notdone
%    1.2 e(3,4)
%    1.3 e(A,B),notdone==>t(A,B)

%    2.1 notdone
%    2.2 e(3,4)
%    2.3 t(1,1)
%    2.4 t(A,B),e(B,C),notdone==>t(A,C)

%    3.1 notdone
%    3.2 e(3,4)
%    3.3 t(2,2)
%    3.4 t(A,B),e(B,C),notdone==>t(A,C)

%    4.1 notdone
%    4.2 e(3,4)
%    4.3 t(3,3)
%    4.4 t(A,B),e(B,C),notdone==>t(A,C)

%    5.1 notdone
%    5.2 e(3,4)
%    5.3 t(4,4)
%    5.4 t(A,B),e(B,C),notdone==>t(A,C)

%    6.1 notdone
%    6.2 e(3,4)
%    6.3 t(5,5)
%    6.4 t(A,B),e(B,C),notdone==>t(A,C)

%    7.1 notdone
%    7.2 e(3,4)
%    7.3 e(A,B),notdone==>t(A,B)

%    8.1 notdone
%    8.2 e(3,4)
%    8.3 t(3,3)
%    8.4 t(A,B),e(B,C),notdone==>t(A,C)

%    9.1 notdone
%    9.2 e(3,4)
%    9.3 e(A,B),notdone==>t(A,B)

%    10.1 notdone
%    10.2 e(3,4)
%    10.3 t(1,1)
%    10.4 t(A,B),e(B,C),notdone==>t(A,C)

%    11.1 notdone
%    11.2 e(3,4)
%    11.3 t(2,2)
%    11.4 t(A,B),e(B,C),notdone==>t(A,C)

%    12.1 notdone
%    12.2 e(3,4)
%    12.3 t(3,3)
%    12.4 t(A,B),e(B,C),notdone==>t(A,C)

%    13.1 notdone
%    13.2 e(3,4)
%    13.3 t(4,4)
%    13.4 t(A,B),e(B,C),notdone==>t(A,C)

%    14.1 notdone
%    14.2 e(3,4)
%    14.3 t(5,5)
%    14.4 t(A,B),e(B,C),notdone==>t(A,C)

%    15.1 notdone
%    15.2 e(3,4)
%    15.3 e(A,B),notdone==>t(A,B)

%    16.1 notdone
%    16.2 e(3,4)
%    16.3 t(3,3)
%    16.4 t(A,B),e(B,C),notdone==>t(A,C)
% ====

% ====
 t(3,5).

%    1.1 notdone
%    1.2 e(4,5)
%    1.3 t(3,4)
%    1.4 t(A,B),e(B,C),notdone==>t(A,C)
% ====

% ====
 t(4,1).

%    1.1 notdone
%    1.2 e(5,1)
%    1.3 t(4,5)
%    1.4 t(A,B),e(B,C),notdone==>t(A,C)
% ====

% ====
 t(4,2).

%    1.1 notdone
%    1.2 e(1,2)
%    1.3 t(4,1)
%    1.4 t(A,B),e(B,C),notdone==>t(A,C)
% ====

% ====
 t(4,3).

%    1.1 notdone
%    1.2 e(2,3)
%    1.3 t(4,2)
%    1.4 t(A,B),e(B,C),notdone==>t(A,C)
% ====

% ====
 t(4,4).

%    1.1 notdone
%    1.2 e(3,4)
%    1.3 t(4,3)
%    1.4 t(A,B),e(B,C),notdone==>t(A,C)
% ====

% ====
 t(4,5).

%    1.1 notdone
%    1.2 e(4,5)
%    1.3 e(A,B),notdone==>t(A,B)

%    2.1 notdone
%    2.2 e(4,5)
%    2.3 t(1,1)
%    2.4 t(A,B),e(B,C),notdone==>t(A,C)

%    3.1 notdone
%    3.2 e(4,5)
%    3.3 t(2,2)
%    3.4 t(A,B),e(B,C),notdone==>t(A,C)

%    4.1 notdone
%    4.2 e(4,5)
%    4.3 t(3,3)
%    4.4 t(A,B),e(B,C),notdone==>t(A,C)

%    5.1 notdone
%    5.2 e(4,5)
%    5.3 t(4,4)
%    5.4 t(A,B),e(B,C),notdone==>t(A,C)

%    6.1 notdone
%    6.2 e(4,5)
%    6.3 t(5,5)
%    6.4 t(A,B),e(B,C),notdone==>t(A,C)

%    7.1 notdone
%    7.2 e(4,5)
%    7.3 e(A,B),notdone==>t(A,B)

%    8.1 notdone
%    8.2 e(4,5)
%    8.3 t(4,4)
%    8.4 t(A,B),e(B,C),notdone==>t(A,C)

%    9.1 notdone
%    9.2 e(4,5)
%    9.3 e(A,B),notdone==>t(A,B)

%    10.1 notdone
%    10.2 e(4,5)
%    10.3 t(1,1)
%    10.4 t(A,B),e(B,C),notdone==>t(A,C)

%    11.1 notdone
%    11.2 e(4,5)
%    11.3 t(2,2)
%    11.4 t(A,B),e(B,C),notdone==>t(A,C)

%    12.1 notdone
%    12.2 e(4,5)
%    12.3 t(3,3)
%    12.4 t(A,B),e(B,C),notdone==>t(A,C)

%    13.1 notdone
%    13.2 e(4,5)
%    13.3 t(4,4)
%    13.4 t(A,B),e(B,C),notdone==>t(A,C)

%    14.1 notdone
%    14.2 e(4,5)
%    14.3 t(5,5)
%    14.4 t(A,B),e(B,C),notdone==>t(A,C)

%    15.1 notdone
%    15.2 e(4,5)
%    15.3 e(A,B),notdone==>t(A,B)

%    16.1 notdone
%    16.2 e(4,5)
%    16.3 t(4,4)
%    16.4 t(A,B),e(B,C),notdone==>t(A,C)
% ====

% ====
 t(5,1).

%    1.1 notdone
%    1.2 e(5,1)
%    1.3 e(A,B),notdone==>t(A,B)

%    2.1 notdone
%    2.2 e(5,1)
%    2.3 t(1,1)
%    2.4 t(A,B),e(B,C),notdone==>t(A,C)

%    3.1 notdone
%    3.2 e(5,1)
%    3.3 t(2,2)
%    3.4 t(A,B),e(B,C),notdone==>t(A,C)

%    4.1 notdone
%    4.2 e(5,1)
%    4.3 t(3,3)
%    4.4 t(A,B),e(B,C),notdone==>t(A,C)

%    5.1 notdone
%    5.2 e(5,1)
%    5.3 t(4,4)
%    5.4 t(A,B),e(B,C),notdone==>t(A,C)

%    6.1 notdone
%    6.2 e(5,1)
%    6.3 t(5,5)
%    6.4 t(A,B),e(B,C),notdone==>t(A,C)

%    7.1 notdone
%    7.2 e(5,1)
%    7.3 e(A,B),notdone==>t(A,B)

%    8.1 notdone
%    8.2 e(5,1)
%    8.3 t(5,5)
%    8.4 t(A,B),e(B,C),notdone==>t(A,C)

%    9.1 notdone
%    9.2 e(5,1)
%    9.3 e(A,B),notdone==>t(A,B)

%    10.1 notdone
%    10.2 e(5,1)
%    10.3 t(1,1)
%    10.4 t(A,B),e(B,C),notdone==>t(A,C)

%    11.1 notdone
%    11.2 e(5,1)
%    11.3 t(2,2)
%    11.4 t(A,B),e(B,C),notdone==>t(A,C)

%    12.1 notdone
%    12.2 e(5,1)
%    12.3 t(3,3)
%    12.4 t(A,B),e(B,C),notdone==>t(A,C)

%    13.1 notdone
%    13.2 e(5,1)
%    13.3 t(4,4)
%    13.4 t(A,B),e(B,C),notdone==>t(A,C)

%    14.1 notdone
%    14.2 e(5,1)
%    14.3 t(5,5)
%    14.4 t(A,B),e(B,C),notdone==>t(A,C)

%    15.1 notdone
%    15.2 e(5,1)
%    15.3 e(A,B),notdone==>t(A,B)

%    16.1 notdone
%    16.2 e(5,1)
%    16.3 t(5,5)
%    16.4 t(A,B),e(B,C),notdone==>t(A,C)
% ====

% ====
 t(5,2).

%    1.1 notdone
%    1.2 e(1,2)
%    1.3 t(5,1)
%    1.4 t(A,B),e(B,C),notdone==>t(A,C)
% ====

% ====
 t(5,3).

%    1.1 notdone
%    1.2 e(2,3)
%    1.3 t(5,2)
%    1.4 t(A,B),e(B,C),notdone==>t(A,C)
% ====

% ====
 t(5,4).

%    1.1 notdone
%    1.2 e(3,4)
%    1.3 t(5,3)
%    1.4 t(A,B),e(B,C),notdone==>t(A,C)
% ====

% ====
 t(5,5).

%    1.1 notdone
%    1.2 e(4,5)
%    1.3 t(5,4)
%    1.4 t(A,B),e(B,C),notdone==>t(A,C)
% ====


% Rules...
 e(A,B),notdone==>t(A,B).
 t(A,B),e(B,C),notdone==>t(A,C).
 notdone==>done.
 e(A,B),done==> \+t(A,B).
 done==> \+notdone.



````

== TEST: FAMILY
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
% ===PROCESS====================
````

WARNING/Pfc: Couldn't db_retract trigPos(e(1,_569292),trigPos(notdone,rhs([t(1,_569292)]))).
WARNING/Pfc: Couldn't db_retract trigPos(notdone,rhs([t(1,2)])).
WARNING/Pfc: Couldn't db_retract t(1,2).
WARNING/Pfc: Couldn't db_retract trigPos(e(2,_569292),trigPos(notdone,rhs([t(2,_569292)]))).
WARNING/Pfc: Couldn't db_retract trigPos(notdone,rhs([t(2,3)])).
WARNING/Pfc: Couldn't db_retract t(2,3).
WARNING/Pfc: Couldn't db_retract trigPos(e(3,_569292),trigPos(notdone,rhs([t(3,_569292)]))).
WARNING/Pfc: Couldn't db_retract trigPos(notdone,rhs([t(3,4)])).
WARNING/Pfc: Couldn't db_retract t(3,4).
WARNING/Pfc: Couldn't db_retract trigPos(e(4,_569292),trigPos(notdone,rhs([t(4,_569292)]))).
WARNING/Pfc: Couldn't db_retract trigPos(notdone,rhs([t(4,5)])).
WARNING/Pfc: Couldn't db_retract t(4,5).
WARNING/Pfc: Couldn't db_retract trigPos(e(5,_569292),trigPos(notdone,rhs([t(5,_569292)]))).
WARNING/Pfc: Couldn't db_retract trigPos(notdone,rhs([t(5,1)])).
WARNING/Pfc: Couldn't db_retract t(5,1).
TML: father('Tom','Amy').
Adding (u) father('Tom','Amy')
TML: father('Jack','Fred').
Adding (u) father('Jack','Fred')
TML: father('Tony','CarolII').
Adding (u) father('Tony','CarolII')
TML: father('Fred','CarolIII').
Adding (u) father('Fred','CarolIII')
TML: mother('Grace','Amy').
Adding (u) mother('Grace','Amy')
TML: mother('Amy','Fred').
Adding (u) mother('Amy','Fred')
TML: mother('CarolI','CarolII').
Adding (u) mother('CarolI','CarolII')
TML: mother('CarolII','CarolIII').
Adding (u) mother('CarolII','CarolIII')
TML: parent(X,Y):-father(X,Y).
Adding (u) father(A,B)==>parent(A,B)
Adding (g) parent('Tom','Amy')          % WHY father('Tom','Amy'),trigPos(father(A,B),rhs([parent(A,B)])).
Adding (g) parent('Jack','Fred')          % WHY father('Jack','Fred'),trigPos(father(A,B),rhs([parent(A,B)])).
Adding (g) parent('Tony','CarolII')          % WHY father('Tony','CarolII'),trigPos(father(A,B),rhs([parent(A,B)])).
Adding (g) parent('Fred','CarolIII')          % WHY father('Fred','CarolIII'),trigPos(father(A,B),rhs([parent(A,B)])).
TML: parent(X,Y):-mother(X,Y).
Adding (u) mother(A,B)==>parent(A,B)
Adding (g) parent('Grace','Amy')          % WHY mother('Grace','Amy'),trigPos(mother(A,B),rhs([parent(A,B)])).
Adding (g) parent('Amy','Fred')          % WHY mother('Amy','Fred'),trigPos(mother(A,B),rhs([parent(A,B)])).
Adding (g) parent('CarolI','CarolII')          % WHY mother('CarolI','CarolII'),trigPos(mother(A,B),rhs([parent(A,B)])).
Adding (g) parent('CarolII','CarolIII')          % WHY mother('CarolII','CarolIII'),trigPos(mother(A,B),rhs([parent(A,B)])).
TML: ancestor(X,Y):-parent(X,Y).
Adding (u) parent(A,B)==>ancestor(A,B)
Adding (g) ancestor('Tom','Amy')          % WHY parent('Tom','Amy'),trigPos(parent(A,B),rhs([ancestor(A,B)])).
Adding (g) ancestor('Jack','Fred')          % WHY parent('Jack','Fred'),trigPos(parent(A,B),rhs([ancestor(A,B)])).
Adding (g) ancestor('Tony','CarolII')          % WHY parent('Tony','CarolII'),trigPos(parent(A,B),rhs([ancestor(A,B)])).
Adding (g) ancestor('Fred','CarolIII')          % WHY parent('Fred','CarolIII'),trigPos(parent(A,B),rhs([ancestor(A,B)])).
Adding (g) ancestor('Grace','Amy')          % WHY parent('Grace','Amy'),trigPos(parent(A,B),rhs([ancestor(A,B)])).
Adding (g) ancestor('Amy','Fred')          % WHY parent('Amy','Fred'),trigPos(parent(A,B),rhs([ancestor(A,B)])).
Adding (g) ancestor('CarolI','CarolII')          % WHY parent('CarolI','CarolII'),trigPos(parent(A,B),rhs([ancestor(A,B)])).
Adding (g) ancestor('CarolII','CarolIII')          % WHY parent('CarolII','CarolIII'),trigPos(parent(A,B),rhs([ancestor(A,B)])).
TML: ancestor(X,Y):-parent(X,Z),ancestor(Z,Y).
Adding (u) parent(A,B),ancestor(B,C)==>ancestor(A,C)
Adding (g) ancestor('Tom','Fred')          % WHY ancestor('Amy','Fred'),trigPos(ancestor('Amy',A),rhs([ancestor('Tom',A)])).
Adding (g) ancestor('Jack','CarolIII')          % WHY ancestor('Fred','CarolIII'),trigPos(ancestor('Fred',A),rhs([ancestor('Jack',A)])).
Adding (g) ancestor('Tony','CarolIII')          % WHY ancestor('CarolII','CarolIII'),trigPos(ancestor('CarolII',A),rhs([ancestor('Tony',A)])).
Adding (g) ancestor('Grace','Fred')          % WHY ancestor('Amy','Fred'),trigPos(ancestor('Amy',A),rhs([ancestor('Grace',A)])).
Adding (g) ancestor('Amy','CarolIII')          % WHY ancestor('Fred','CarolIII'),trigPos(ancestor('Fred',A),rhs([ancestor('Amy',A)])).
Adding (g) ancestor('Tom','CarolIII')          % WHY ancestor('Amy','CarolIII'),trigPos(ancestor('Amy','CarolIII'),rhs([ancestor('Tom','CarolIII')])).
Adding (g) ancestor('Grace','CarolIII')          % WHY ancestor('Amy','CarolIII'),trigPos(ancestor('Amy','CarolIII'),rhs([ancestor('Grace','CarolIII')])).

% ===SUCESSS====================
Adding (g) ancestor('CarolI','CarolIII')          % WHY ancestor('CarolII','CarolIII'),trigPos(ancestor('CarolII',A),rhs([ancestor('CarolI',A)])).

% User added facts:
 father('Fred','CarolIII').
 father('Jack','Fred').
 father('Tom','Amy').
 father('Tony','CarolII').
 mother('Amy','Fred').
 mother('CarolI','CarolII').
 mother('CarolII','CarolIII').
 mother('Grace','Amy').



% LogicMOO infered facts:
% ====
 ancestor('Amy','CarolIII').

%    1.1 ancestor('Fred','CarolIII')
%    1.2 parent('Amy','Fred')
%    1.3 parent(A,B),ancestor(B,C)==>ancestor(A,C)
% ====

% ====
 ancestor('Amy','Fred').

%    1.1 parent('Amy','Fred')
%    1.2 parent(A,B)==>ancestor(A,B)
% ====

% ====
 ancestor('CarolI','CarolII').

%    1.1 parent('CarolI','CarolII')
%    1.2 parent(A,B)==>ancestor(A,B)
% ====

% ====
 ancestor('CarolI','CarolIII').

%    1.1 ancestor('CarolII','CarolIII')
%    1.2 parent('CarolI','CarolII')
%    1.3 parent(A,B),ancestor(B,C)==>ancestor(A,C)
% ====

% ====
 ancestor('CarolII','CarolIII').

%    1.1 parent('CarolII','CarolIII')
%    1.2 parent(A,B)==>ancestor(A,B)
% ====

% ====
 ancestor('Fred','CarolIII').

%    1.1 parent('Fred','CarolIII')
%    1.2 parent(A,B)==>ancestor(A,B)
% ====

% ====
 ancestor('Grace','Amy').

%    1.1 parent('Grace','Amy')
%    1.2 parent(A,B)==>ancestor(A,B)
% ====

% ====
 ancestor('Grace','CarolIII').

%    1.1 ancestor('Amy','CarolIII')
%    1.2 parent('Grace','Amy')
%    1.3 parent(A,B),ancestor(B,C)==>ancestor(A,C)
% ====

% ====
 ancestor('Grace','Fred').

%    1.1 ancestor('Amy','Fred')
%    1.2 parent('Grace','Amy')
%    1.3 parent(A,B),ancestor(B,C)==>ancestor(A,C)
% ====

% ====
 ancestor('Jack','CarolIII').

%    1.1 ancestor('Fred','CarolIII')
%    1.2 parent('Jack','Fred')
%    1.3 parent(A,B),ancestor(B,C)==>ancestor(A,C)
% ====

% ====
 ancestor('Jack','Fred').

%    1.1 parent('Jack','Fred')
%    1.2 parent(A,B)==>ancestor(A,B)
% ====

% ====
 ancestor('Tom','Amy').

%    1.1 parent('Tom','Amy')
%    1.2 parent(A,B)==>ancestor(A,B)
% ====

% ====
 ancestor('Tom','CarolIII').

%    1.1 ancestor('Amy','CarolIII')
%    1.2 parent('Tom','Amy')
%    1.3 parent(A,B),ancestor(B,C)==>ancestor(A,C)
% ====

% ====
 ancestor('Tom','Fred').

%    1.1 ancestor('Amy','Fred')
%    1.2 parent('Tom','Amy')
%    1.3 parent(A,B),ancestor(B,C)==>ancestor(A,C)
% ====

% ====
 ancestor('Tony','CarolII').

%    1.1 parent('Tony','CarolII')
%    1.2 parent(A,B)==>ancestor(A,B)
% ====

% ====
 ancestor('Tony','CarolIII').

%    1.1 ancestor('CarolII','CarolIII')
%    1.2 parent('Tony','CarolII')
%    1.3 parent(A,B),ancestor(B,C)==>ancestor(A,C)
% ====

% ====
 parent('Amy','Fred').

%    1.1 mother('Amy','Fred')
%    1.2 mother(A,B)==>parent(A,B)
% ====

% ====
 parent('CarolI','CarolII').

%    1.1 mother('CarolI','CarolII')
%    1.2 mother(A,B)==>parent(A,B)
% ====

% ====
 parent('CarolII','CarolIII').

%    1.1 mother('CarolII','CarolIII')
%    1.2 mother(A,B)==>parent(A,B)
% ====

% ====
 parent('Fred','CarolIII').

%    1.1 father('Fred','CarolIII')
%    1.2 father(A,B)==>parent(A,B)
% ====

% ====
 parent('Grace','Amy').

%    1.1 mother('Grace','Amy')
%    1.2 mother(A,B)==>parent(A,B)
% ====

% ====
 parent('Jack','Fred').

%    1.1 father('Jack','Fred')
%    1.2 father(A,B)==>parent(A,B)
% ====

% ====
 parent('Tom','Amy').

%    1.1 father('Tom','Amy')
%    1.2 father(A,B)==>parent(A,B)
% ====

% ====
 parent('Tony','CarolII').

%    1.1 father('Tony','CarolII')
%    1.2 father(A,B)==>parent(A,B)
% ====


% Rules...
 father(A,B)==>parent(A,B).
 mother(A,B)==>parent(A,B).
 parent(A,B)==>ancestor(A,B).
 parent(A,B),ancestor(B,C)==>ancestor(A,C).



````

== TEST: ARMAGEDDON
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
% ===PROCESS====================
````
TML: bird('Charlie').
Adding (u) bird('Charlie')
TML: bird('Coco').
Adding (u) bird('Coco')
TML: human('John').
Adding (u) human('John')
TML: human('Jane').
Adding (u) human('Jane')
TML: being(X):-bird(X).
Adding (u) bird(A)==>being(A)
Adding (g) being('Charlie')          % WHY bird('Charlie'),trigPos(bird(A),rhs([being(A)])).
Adding (g) being('Coco')          % WHY bird('Coco'),trigPos(bird(A),rhs([being(A)])).
TML: being(X):-human(X).
Adding (u) human(A)==>being(A)
Adding (g) being('John')          % WHY human('John'),trigPos(human(A),rhs([being(A)])).
Adding (g) being('Jane')          % WHY human('Jane'),trigPos(human(A),rhs([being(A)])).
TML: mortal(X):-being(X).
Adding (u) being(A)==>mortal(A)
Adding (g) mortal('Charlie')          % WHY being('Charlie'),trigPos(being(A),rhs([mortal(A)])).
Adding (g) mortal('Coco')          % WHY being('Coco'),trigPos(being(A),rhs([mortal(A)])).
Adding (g) mortal('John')          % WHY being('John'),trigPos(being(A),rhs([mortal(A)])).
Adding (g) mortal('Jane')          % WHY being('Jane'),trigPos(being(A),rhs([mortal(A)])).
TML: dead(X):-mortal(X),armageddon.
Adding (u) mortal(A),armageddon==>dead(A)
TML: not(bird(X)):-dead(X).
Adding (u) dead(A)==> \+bird(A)
TML: not(human(X)):-dead(X).
Adding (u) dead(A)==> \+human(A)
TML: not(mortal(X)):-dead(X).
Adding (u) dead(A)==> \+mortal(A)
TML: not(being(X)):-dead(X).
Adding (u) dead(A)==> \+being(A)
% ===SUCESSS====================


% User added facts:
 bird('Charlie').
 bird('Coco').
 human('Jane').
 human('John').



% LogicMOO infered facts:
% ====
 being('Charlie').

%    1.1 bird('Charlie')
%    1.2 bird(A)==>being(A)
% ====

% ====
 being('Coco').

%    1.1 bird('Coco')
%    1.2 bird(A)==>being(A)
% ====

% ====
 being('Jane').

%    1.1 human('Jane')
%    1.2 human(A)==>being(A)
% ====

% ====
 being('John').

%    1.1 human('John')
%    1.2 human(A)==>being(A)
% ====

% ====
 mortal('Charlie').

%    1.1 being('Charlie')
%    1.2 being(A)==>mortal(A)
% ====

% ====
 mortal('Coco').

%    1.1 being('Coco')
%    1.2 being(A)==>mortal(A)
% ====

% ====
 mortal('Jane').

%    1.1 being('Jane')
%    1.2 being(A)==>mortal(A)
% ====

% ====
 mortal('John').

%    1.1 being('John')
%    1.2 being(A)==>mortal(A)
% ====


% Rules...
 bird(A)==>being(A).
 human(A)==>being(A).
 being(A)==>mortal(A).
 mortal(A),armageddon==>dead(A).
 dead(A)==> \+bird(A).
 dead(A)==> \+human(A).
 dead(A)==> \+mortal(A).
 dead(A)==> \+being(A).



````

== TEST: EUNSAT
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
% ===PROCESS====================
````
TML: start.
Adding (u) start
TML: running:-start.
Adding (u) start==>running
Adding (g) running          % WHY start,trigPos(start,rhs([running])).
TML: not(start):-running.
Adding (u) running==> \+start

WARNING/Pfc: Couldn't db_retract spft(\+start,pcfUser,pcfUser).
WARNING/Pfc: Couldn't db_retract support2(pcfUser,pcfUser,\+start).
WARNING/Pfc: Couldn't db_retract support3(pcfUser,\+start,pcfUser).
TML: stop:-running.
Adding (u) running==>stop
Adding (g) stop          % WHY running,trigPos(running,rhs([stop])).
TML: not(running):-stop.
Adding (u) stop==> \+running

WARNING/Pfc: Couldn't db_retract spft(\+running,pcfUser,pcfUser).
WARNING/Pfc: Couldn't db_retract support2(pcfUser,pcfUser,\+running).
WARNING/Pfc: Couldn't db_retract support3(pcfUser,\+running,pcfUser).
TML: start:-stop.
Adding (u) stop==>start
TML: not(stop):-start.
Adding (u) start==> \+stop

WARNING/Pfc: Couldn't db_retract spft(\+stop,pcfUser,pcfUser).
WARNING/Pfc: Couldn't db_retract support2(pcfUser,pcfUser,\+stop).

% ===SUCESSS====================
WARNING/Pfc: Couldn't db_retract support3(pcfUser,\+stop,pcfUser).

% User added facts:
 start.



% LogicMOO infered facts:
% ====
 running.

%    1.1 start
%    1.2 start==>running
% ====

% ====
 stop.

%    1.1 running
%    1.2 running==>stop
% ====


% Rules...
 start==>running.
 running==> \+start.
 running==>stop.
 stop==> \+running.
 stop==>start.
 start==> \+stop.



````
% init_why(after('/opt/logicmoo_workspace/packs_sys/tauchain_prolog/prolog/tauchain/tml_interp.pl')).
% init_why(program).
?-

