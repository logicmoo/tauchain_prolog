````

Adding (u) j(A),k(B)==>bothJK(A,B)
Adding (u) bothJK(A,B),go==>jkGo(A,B)
Adding (u) j(1)
Adding (u) go
Adding (u) k(2)
Adding (g) bothJK(1,2)          % WHY k(2),trigPos(k(2),rhs([bothJK(1,2)])).

% /opt/logicmoo_workspace/packs_sys/tauchain_prolog/prolog/tauchain/tml_fwdchaing.pl:1846
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



% Pfc added facts:
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



?-

?-

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



% Pfc added facts:
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



?-

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

`====== TEST: INTRO ===========`
```
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
% /opt/logicmoo_workspace/packs_sys/tauchain_prolog/prolog/tauchain/tml_testing.pl:579
% ===PROCESS====================
````
% ===SUCESSS====================


% User added facts:


% Pfc added facts:
% Rules...



````

`====== TEST: EFACTS ===========`
```
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



% Pfc added facts:
% Rules...



````

`====== TEST: ERELATIONS ===========`
```
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



% Pfc added facts:
% Rules...



````

`====== TEST: EARITY ===========`
```
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



% Pfc added facts:
% Rules...



````

`====== TEST: ERULES ===========`
```
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



% Pfc added facts:
% ====
 wet.

%    1.1 rain
%    1.2 rain==>wet
% ====


% Rules...
 rain==>wet.
 bellowZero==>freezing.



````

`====== TEST: E1234 ===========`
```

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



% Pfc added facts:
% ====
 holds(2,1).

%    1.1 holds(1,2)
%    1.2 holds(1,2)==>holds(2,1)
% ====


% Rules...
 holds(1,3)==>holds(3,1).
 holds(1,2)==>holds(2,1).



````

`====== TEST: EMADAM ===========`
```
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



% Pfc added facts:
% ====
 salutation('Suzi','Madam').

%    1.1 employee('Suzi',female)
%    1.2 employee('Suzi',female)==>salutation('Suzi','Madam')
% ====


% Rules...
 employee('Suzi',female)==>salutation('Suzi','Madam').



````

`====== TEST: EVARIABLES ===========`
```
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
Adding (u) bird(SOMETHING)==>canFly(SOMETHING)
TML: beeps(SOME):-bird(SOME).
Adding (u) bird(SOME)==>beeps(SOME)
TML: meows(SOME):-cat(SOME).
Adding (u) cat(SOME)==>meows(SOME)
TML: employee('Suzi',female).
Adding (u) employee('Suzi',female)
TML: employee('John',male).
Adding (u) employee('John',male)
TML: employee('Jane',female).
Adding (u) employee('Jane',female)
TML: salutation(PERSON,'Madam'):-employee(PERSON,female).
Adding (u) employee(PERSON,female)==>salutation(PERSON,'Madam')
TML: salutation(PERSON,'Sir'):-employee(PERSON,male).
Adding (u) employee(PERSON,male)==>salutation(PERSON,'Sir')
TML: parent(X,Y):-father(X,Y).
Adding (u) father(X,Y)==>parent(X,Y)
TML: parent(X,Y):-mother(X,Y).
Adding (u) mother(X,Y)==>parent(X,Y)
TML: father('Coco','Charlie').
Adding (u) father('Coco','Charlie')
TML: mother('Suzi','John').
Adding (u) mother('Suzi','John')
TML: bird('John').
Adding (u) bird('John')
% ===SUCESSS====================


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



% Pfc added facts:
% Rules...
 bird(SOMETHING)==>canFly(SOMETHING).
 bird(SOME)==>beeps(SOME).
 cat(SOME)==>meows(SOME).
 employee(PERSON,female)==>salutation(PERSON,'Madam').
 employee(PERSON,male)==>salutation(PERSON,'Sir').
 father(X,Y)==>parent(X,Y).
 mother(X,Y)==>parent(X,Y).



````

`====== TEST: AND/OR ===========`
```
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
Adding (u) child(X),male(X)==>boy(X)
TML: girl(X):-child(X),female(X).
Adding (u) child(X),female(X)==>girl(X)
TML: human(X):-child(X).
Adding (u) child(X)==>human(X)
TML: human(X):-adult(X).
Adding (u) adult(X)==>human(X)
TML: adult('Amy').
Adding (u) adult('Amy')
TML: child('John').
Adding (u) child('John')
TML: child('Jack').
Adding (u) child('Jack')
TML: child('Jane').
Adding (u) child('Jane')
TML: child('Suzi').
Adding (u) child('Suzi')
TML: male('John').
Adding (u) male('John')
TML: male('Jack').
Adding (u) male('Jack')
TML: female('Amy').
Adding (u) female('Amy')
TML: female('Jane').
Adding (u) female('Jane')
TML: female('Suzi').
Adding (u) female('Suzi')
% ===SUCESSS====================


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



% Pfc added facts:
% Rules...
 child(X),male(X)==>boy(X).
 child(X),female(X)==>girl(X).
 child(X)==>human(X).
 adult(X)==>human(X).



````

`====== TEST: ERECURSION ===========`
```
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
Adding (u) parent(ANC,CHILD)==>ancestor(ANC,CHILD)
TML: ancestor(ANC,DESC):-parent(ANC,CHILD),ancestor(CHILD,DESC).
Adding (u) parent(ANC,CHILD),ancestor(CHILD,DESC)==>ancestor(ANC,DESC)
% ===SUCESSS====================


% User added facts:
 parent('Amy','Fred').
 parent('Fred','Sue').
 parent('Grace','Amy').
 parent('Jack','Fred').
 parent('Tom','Amy').



% Pfc added facts:
% Rules...
 parent(ANC,CHILD)==>ancestor(ANC,CHILD).
 parent(ANC,CHILD),ancestor(CHILD,DESC)==>ancestor(ANC,DESC).



````

`====== TEST: TRANSITIVE CLOSURE ===========`
```
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
Adding (u) e(X,Y)==>tc(X,Y)
TML: tc(X,Y):-tc(X,Z),e(Z,Y).
Adding (u) tc(X,Z),e(Z,Y)==>tc(X,Y)
% ===SUCESSS====================


% User added facts:
 e(1,2).
 e(2,3).
 e(3,4).
 e(4,5).
 e(5,1).
 e(8,9).



% Pfc added facts:
% Rules...
 e(X,Y)==>tc(X,Y).
 tc(X,Z),e(Z,Y)==>tc(X,Y).



````

`====== TEST: ENEGATION ===========`
```
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
TML: bird('Coco').
Adding (u) bird('Coco')
TML: bird('Charlie').
Adding (u) bird('Charlie')
TML: wounded('Charlie').
Adding (u) wounded('Charlie')
TML: canFly(X):-bird(X),not(wounded(X)).
Adding (u) bird(X),\+wounded(X)==>canFly(X)
% ===SUCESSS====================


% User added facts:
 bird('Charlie').
 bird('Coco').
 wounded('Charlie').



% Pfc added facts:
% Rules...
 bird(X),\+wounded(X)==>canFly(X).



````

`====== TEST: EDELETION ===========`
```
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



% Pfc added facts:
% Rules...
 sad==> \+happy.



````

`====== TEST: DIRECTEDGRAPH ===========`
```

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
Adding (u) e(X,Y),notdone==>t(X,Y)
TML: t(X,Z):-t(X,Y),e(Y,Z),notdone.
Adding (u) t(X,Y),e(Y,Z),notdone==>t(X,Z)
TML: done:-notdone.
Adding (u) notdone==>done
Adding (g) done          % WHY notdone,trigPos(notdone,rhs([done])).
TML: not(t(X,Y)):-e(X,Y),done.
Adding (u) e(X,Y),done==> \+t(X,Y)
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



% Pfc added facts:
% ====
 done.

%    1.1 notdone
%    1.2 notdone==>done
% ====


% Rules...
 e(X,Y),notdone==>t(X,Y).
 t(X,Y),e(Y,Z),notdone==>t(X,Z).
 notdone==>done.
 e(X,Y),done==> \+t(X,Y).
 done==> \+notdone.



````

`====== TEST: FAMILY ===========`
```
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
Adding (u) father(X,Y)==>parent(X,Y)
TML: parent(X,Y):-mother(X,Y).
Adding (u) mother(X,Y)==>parent(X,Y)
TML: ancestor(X,Y):-parent(X,Y).
Adding (u) parent(X,Y)==>ancestor(X,Y)
TML: ancestor(X,Y):-parent(X,Z),ancestor(Z,Y).
Adding (u) parent(X,Z),ancestor(Z,Y)==>ancestor(X,Y)
% ===SUCESSS====================


% User added facts:
 father('Fred','CarolIII').
 father('Jack','Fred').
 father('Tom','Amy').
 father('Tony','CarolII').
 mother('Amy','Fred').
 mother('CarolI','CarolII').
 mother('CarolII','CarolIII').
 mother('Grace','Amy').



% Pfc added facts:
% Rules...
 father(X,Y)==>parent(X,Y).
 mother(X,Y)==>parent(X,Y).
 parent(X,Y)==>ancestor(X,Y).
 parent(X,Z),ancestor(Z,Y)==>ancestor(X,Y).



````

`====== TEST: ARMAGEDDON ===========`
```
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
Adding (u) bird(X)==>being(X)
TML: being(X):-human(X).
Adding (u) human(X)==>being(X)
TML: mortal(X):-being(X).
Adding (u) being(X)==>mortal(X)
TML: dead(X):-mortal(X),armageddon.
Adding (u) mortal(X),armageddon==>dead(X)
TML: not(bird(X)):-dead(X).
Adding (u) dead(X)==> \+bird(X)
TML: not(human(X)):-dead(X).
Adding (u) dead(X)==> \+human(X)
TML: not(mortal(X)):-dead(X).
Adding (u) dead(X)==> \+mortal(X)
TML: not(being(X)):-dead(X).
Adding (u) dead(X)==> \+being(X)
% ===SUCESSS====================


% User added facts:
 bird('Charlie').
 bird('Coco').
 human('Jane').
 human('John').



% Pfc added facts:
% Rules...
 bird(X)==>being(X).
 human(X)==>being(X).
 being(X)==>mortal(X).
 mortal(X),armageddon==>dead(X).
 dead(X)==> \+bird(X).
 dead(X)==> \+human(X).
 dead(X)==> \+mortal(X).
 dead(X)==> \+being(X).



````

`====== TEST: EUNSAT ===========`
```
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



% Pfc added facts:
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
|    ^D
% halt
(base) root@gitlab:/opt/logicmoo_workspace/packs_sys/tauchain_prolog/prolog/tauchain#

