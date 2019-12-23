READER TEST RESULTS

````
TML: e(1,2).
TML: e(2,1).
TML: e(holds(X,Y)):-e(holds(X,Z)),e(holds(Z,Y)).
TML: not('S'(holds(X,X))):-'S'(holds(X,X)).
TML: not(prog(holds(X,X))):-prog(holds(X,X)).
TML: not(alt(holds(X,X))):-alt(holds(X,X)).
TML: not(alts(holds(X,X))):-alts(holds(X,X)).
TML: a(b(c)).
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
TML: a(b(c)).
TML: a(b(c)).
TML: '@finline'([a(1,2,3),rel(t,holds('$VAR'('1'),2)),b(X),r]).
TML: '@treequery'(rel(t,1,2)).
TML: '@ask'(rel(t,1,2)).
TML: '@treequery'(e(holds(X,v1))).
TML: '@ask'(e(holds(X,v1))).
% /opt/logicmoo_workspace/packs_sys/tauchain_prolog/prolog/tauchain/tml_interp.pl:32
% =============== .
% intro.
% =============== .
% sucess(===============).
TML: '@comment'(" Enter your TML logic program here and").
TML: '@comment'(" press RUN to execute.").
TML: '@comment'("").
TML: '@comment'(" Any text following the '#' character is").
TML: '@comment'(" a comment and is ignored by TML.").
TML: '@comment'("").
TML: '@comment'(" Logic programs consist of logic clauses.").
TML: '@comment'(" This program has no logic clause.").
TML: '@comment'("").
TML: '@comment'(" Clauses can be either FACTS or RULES and").
TML: '@comment'(" they are terminated by the '.' character").
TML: '@comment'(" like sentences in English.").
% sucess(===============).
% =============== .
% eFACTS.
% =============== .
% failed(===============).
% # Facts define RELATIONS between entities.
% # Fact clauses are considered to be true.
%
% father Tom Amy.   # Tom is a father of Amy.
% canFly bird.      # Bird can fly.
% edge 6 3.         # Exists an edge from 6 to 3.
% night.            # It's night.
% 1 2.              # Exists a pair 1-2.
% direct London NY. # London has a direct to NY.
% 3 9 12.           # Exists a triple 3-9-12.
% beginsWithJ Joe.  # Joe begins with J.
%
% # Output is padded by '*' character when
% # different ARITIES are used.
% failed(===============).
% =============== .
% eRELATIONS.
% =============== .
% sucess(===============).
TML: '@comment'(" Every FACT begins with a predicate,").
TML: '@comment'(" which is also the name of a relation.").
TML: '@comment'("").
TML: '@comment'(" We can think of:").
TML: '@comment'("     relations as tables,").
TML: '@comment'("     facts as rows and").
TML: '@comment'("     entities as columns.").
TML: '@comment'("").
TML: '@comment'(" Set of relations is called a model, or").
TML: '@comment'(" relational structure.").
TML: '@comment'("                    _____________").
TML: '@comment'(" |_beginsWithJ_|").
TML: beginsWithJ('Jane').
TML: '@comment'(" |    Jane     |").
TML: beginsWithJ('John').
TML: '@comment'(" |    John     |").
TML: beginsWithJ('Jack').
TML: '@comment'(" |____Jack_____|").
TML: '@comment'("  _____________").
TML: '@comment'(" |___uncle_____|").
TML: uncle('Jim'('Joe')).
TML: '@comment'(" |  Jim | Joe  |").
TML: uncle('Joe'('Jill')).
TML: '@comment'(" |  Joe | Jill |").
TML: uncle('Joe'('Jack')).
TML: '@comment'(" |__Joe_|_Jack_|").
TML: employee('John'('Doe'(sales))).
TML: employee('Jane'('Doe'(support))).
TML: '@comment'("  ______________________").
TML: '@comment'(" |______employee________|").
TML: '@comment'(" | John | Doe | sales   |").
TML: '@comment'(" |_Jane_|_Doe_|_support_|").
TML: '@comment'(" FACTS (rows) in a relation (table) are").
TML: '@comment'(" unordered. It means it doesn't matter which").
TML: '@comment'(" fact comes first.").
TML: '@comment'(" Entities (columns) are unnamed and ordered.").
TML: '@comment'(" It's a difference from common relational").
TML: '@comment'(" databases where columns are named.").
TML: '@comment'("").
TML: '@comment'(" Number of columns is also called ARITY.").
% sucess(===============).
% =============== .
% eARITY.
% =============== .
% sucess(===============).
TML: '@comment'(" Every clause has its arity. It's a dimension").
TML: '@comment'(" of the domain in the corresponding Cartesian").
TML: '@comment'(" product.").
TML: '@comment'(" Basically it's a number of RELATION's entities").
TML: '@comment'(" (columns). It can be written as 'n-ary' or").
TML: '@comment'(" latin/greek name is used.").
TML: '@comment'(" Arity (latin/greek):").
TML: '@comment'(" 0-ary (nullary/niladic)").
TML: rain.
TML: night.
TML: '@comment'(" 1-ary (unary/monadic)").
TML: happy('Sue').
TML: barks('Max').
TML: '@comment'(" 2-ary (binary/dyadic)").
TML: mother('Jane'('Jack')).
TML: employee('John'('Doe')).
TML: '@comment'(" 3-ary (ternary/triadic)").
TML: married('Tom'('Jane'(2004))).
TML: employee('Jane'('Doe'(support))).
TML: '@comment'(" ...").
TML: '@comment'(" 6-ary (senary)").
TML: a(1,2,3,4,5,6).
TML: '@comment'(" 2-ary or more are also").
TML: '@comment'(" called multiary/polyadic").
TML: '@comment'(" Output of TML is padded by '*' character").
TML: '@comment'(" up to the highest known arity.").
% sucess(===============).
% =============== .
% eRULES.
% =============== .
% failed(===============).
% # Rules allow creation/inferring of new facts.
% # Every rule has a head and a body separated by
% # ':-' symbol. Head is on the left side and body
% # is on the right side.
% # Rules are also called Horn Clauses.
% # They work the way that head is true if body is
% # true.
% # You can imagine rules like facts (in head)
% # with conditions (in body).
%
% # TML takes all the known facts and tries to
% # match them into bodies of all the known rules.
% # When a fact matches a body of a rule it infers
% # new fact from the head of the rule.
%
% rain.                   # rain.
% wet :- rain.            # wet if rain.
% freezing :- bellowZero. # freezing if bellow 0.
%
% # Here TML infers it's wet because it knows it
% # rains.
% # See there is 'rain' and 'wet' in the output.
% # There is no 'freezing' because there is no
% # 'bellowZero'.
%
% 1 2.        # 1-2 exists.
% 1 4.        # 1-4 exists.
% 3 1 :- 1 3. # 3-1 exists if 1-3 exists.
% 2 1 :- 1 2. # 2-1 exists if 1-2 exists.
%
% # Here TML infers 2 1 because there exist 1 2.
% # You should see 1 2, 1 4 and 2 1 in the output.
% # There is no 3 1 because there is no 1 3.
%
% employee Suzi female.
% salutation Suzi Madam :- employee Suzi female.
%
% # If employee Suzi is female, Suzi's salutation
% # is Madam.
% # TML correctly infers that Suzi's salutation is
% # Madam because employee Suzi is female.
%
% # Rules become more powerful when used with
% # VARIABLES.
% failed(===============).
% =============== .
% eVARIABLES.
% =============== .
% sucess(===============).
TML: '@comment'(" Variables are used for substitution of").
TML: '@comment'(" multiple possible entities in rules.").
TML: '@comment'(" If a variable is substituted by an entity").
TML: '@comment'(" in a body it is substituted by the same entity").
TML: '@comment'(" in body's head.").
TML: '@comment'(" Variables begin with '?' character.").
TML: bird('Charlie').
TML: bird('Coco').
TML: cat('Bella').
TML: canFly(SOMETHING):-bird(SOMETHING).
TML: '@comment'(" If something is a bird, it can fly.").
TML: '@comment'(" TML infers that Charlie and Coco can fly.").
TML: beeps(SOME):-bird(SOME).
TML: '@comment'(" If there is some bird, it beeps.").
TML: '@comment'(" TML infers that Charlie and Coco beeps.").
TML: meows(SOME):-cat(SOME).
TML: '@comment'(" If there is some cat, it meows.").
TML: '@comment'(" TML infers that Bella meows.").
TML: employee('Suzi'(female)).
TML: employee('John'(male)).
TML: employee('Jane'(female)).
TML: salutation(holds(PERSON,'Madam')):-employee(holds(PERSON,female)).
TML: '@comment'(" salutation for any employee female is Madam.").
TML: '@comment'(" TML infers that Suzi's and Jane's salutation").
TML: '@comment'(" is Madam.").
TML: salutation(holds(PERSON,'Sir')):-employee(holds(PERSON,male)).
TML: '@comment'(" salutation for any employee male is Sir").
TML: '@comment'(" TML infers that John's salutation is Sir.").
TML: parent(holds(X,Y)):-father(holds(X,Y)).
TML: parent(holds(X,Y)):-mother(holds(X,Y)).
TML: father('Coco'('Charlie')).
TML: mother('Suzi'('John')).
TML: '@comment'(" TML infers that Coco is Charlie's parent.").
TML: '@comment'(" and that Suzi is John's parent.").
TML: '@comment'(" Just for fun, let's say, John is a bird:").
TML: bird('John').
TML: '@comment'(" TML infers that John beeps and he can fly.").
% sucess(===============).
% =============== .
% 'AND/OR'.
% =============== .
% sucess(===============).
TML: '@comment'(" When you need multiple conditions in a body").
TML: '@comment'(" separate them by a comma. You can read comma").
TML: '@comment'(" as 'and':").
TML: boy(X):-child(X),male(X).
TML: '@comment'(" ?x is a boy if ?x is both child and male.").
TML: girl(X):-child(X),female(X).
TML: '@comment'(" ?x is a girl if ?x is both child and female.").
TML: '@comment'(" When you need multiple bodies for the same").
TML: '@comment'(" head, you can have multiple rules with the").
TML: '@comment'(" same head:").
TML: human(X):-child(X).
TML: human(X):-adult(X).
TML: '@comment'(" ?x is a human if ?x is child or adult.").
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
TML: '@comment'(" TML infers: Jack and John are boys.").
TML: '@comment'(" Jane and Suzi are girls.").
TML: '@comment'(" And Amy, Jack, Jane, John and Suzi are").
TML: '@comment'(" humans.").
% sucess(===============).
% =============== .
% eRECURSION.
% =============== .
% sucess(===============).
TML: '@comment'(" Recursion is used to traverse through").
TML: '@comment'(" all the entities in a relation.").
TML: '@comment'(" It's a logic programs' alternative to loops.").
TML: '@comment'(" We can have a relation of parents.").
TML: parent('Fred'('Sue')).
TML: parent('Jack'('Fred')).
TML: parent('Amy'('Fred')).
TML: parent('Grace'('Amy')).
TML: parent('Tom'('Amy')).
TML: '@comment'(" Let's say we want to know all the ancestor").
TML: '@comment'(" relations of all the known entities.").
TML: '@comment'(" We need to create 2 rules so TML knows,").
TML: '@comment'(" what ancestor means. Ancestor is a parent").
TML: '@comment'(" or a parent of an ancestor.").
TML: '@comment'(" 'parent of a child is an ancestor of the").
TML: '@comment'(" child':").
TML: ancestor(holds(ANC,CHILD)):-parent(holds(ANC,CHILD)).
TML: '@comment'(" 'parent of a child, who is an ancestor of").
TML: '@comment'(" its descendant, is an ancestor of the").
TML: '@comment'(" descendant':").
TML: ancestor(holds(ANC,DESC)):-parent(holds(ANC,CHILD)),ancestor(holds(CHILD,DESC)).
TML: '@comment'(" Notice how ancestor relation is used in both").
TML: '@comment'(" head and body. This is causing the recursion.").
% sucess(===============).
% =============== .
% 'TRANSITIVE CLOSURE'.
% =============== .
% sucess(===============).
TML: '@comment'(" Transitive closure (TC)").
TML: '@comment'("").
TML: '@comment'(" TC of a directed graph is simply another").
TML: '@comment'(" directed graph representing paths").
TML: '@comment'(" in the original graph.").
TML: '@comment'("").
TML: '@comment'(" This is a classical example of recursion.").
TML: '@comment'("").
TML: '@comment'(" Let's have a directed graph represented by").
TML: '@comment'(" following 'e' relation:").
TML: e(1,2).
TML: e(2,3).
TML: e(3,4).
TML: e(4,5).
TML: e(5,1).
TML: e(8,9).
TML: tc(holds(X,Y)):-e(holds(X,Y)).
TML: '@comment'(" Edge from ?x to ?y is a path from ?x to ?y.").
TML: tc(holds(X,Y)):-tc(holds(X,Z)),e(holds(Z,Y)).
TML: '@comment'(" If there is a path from ?x to ?z and there").
TML: '@comment'(" is an edge from ?z to ?y there is path from").
TML: '@comment'(" ?x to ?y").
TML: '@comment'(" TML infers all the possible paths in the").
TML: '@comment'(" 'e' graph into 'tc' graph.").
% sucess(===============).
% =============== .
% eNEGATION.
% =============== .
% sucess(===============).
TML: '@comment'(" Negation").
TML: '@comment'("").
TML: '@comment'(" For negation is used a '~' character.").
TML: '@comment'(" You can read it as 'not'.").
TML: bird('Coco').
TML: bird('Charlie').
TML: wounded('Charlie').
TML: '@comment'(" You can use negation in bodies").
TML: canFly(X):-bird(X),not(wounded(X)).
TML: '@comment'(" ?X can fly if ?X is bird and is not wounded.").
TML: '@comment'(" or simply: Not wounded bird can fly.").
TML: '@comment'(" Coco and Charlie are birds but Charlie is").
TML: '@comment'(" wounded. The only fact TML can infer here").
TML: '@comment'(" is that Coco can fly.").
% sucess(===============).
% =============== .
% eDELETION.
% =============== .
% failed(===============).
% # Negation in heads deletes the fact from
% # the database of facts.
%
% happy.          # happy.
% "# Negation in heads deletes the fact from\n# the database of facts.\n\nhappy.          # happy.\n~happy :- sad.  # not happy if sad.\nsad.            # sad.\n# will result into 'sad'. No 'happy'.\n\n# e relation represents directed graph:\n# 1->2, 2->3, 3->4, 4->5, 5->1\ne 1 2.\ne 2 3.\ne 3 4.\ne 4 5.\ne 5 1.\n\n# Following program should get the first\n# non-direct (transitive) path from each\n# node of the graph 'e'\n\n# state of the program: not done\nnotdone.\n\n# TRANSITIVE CLOSURE to get all\n# possible paths through the graph\n# while notdone\nt ?x ?y :- e ?x ?y, notdone.\nt ?x ?z :- t ?x ?y, e ?y ?z, notdone.\n\n# and we are done (yes, in the 1st step)\ndone :- notdone.\n\n# if done, remove original graph\n# from the resulting graph\n~t ?x ?y :- e ?x ?y, done.\n\n# if done, then remove notdone fact to\n# stop the TC\n~notdone :- done.".
% failed(===============).
% =============== .
% family.
% =============== .
% sucess(===============).
TML: father('Tom'('Amy')).
TML: father('Jack'('Fred')).
TML: father('Tony'('CarolII')).
TML: father('Fred'('CarolIII')).
TML: mother('Grace'('Amy')).
TML: mother('Amy'('Fred')).
TML: mother('CarolI'('CarolII')).
TML: mother('CarolII'('CarolIII')).
TML: parent(holds(X,Y)):-father(holds(X,Y)).
TML: parent(holds(X,Y)):-mother(holds(X,Y)).
TML: ancestor(holds(X,Y)):-parent(holds(X,Y)).
TML: ancestor(holds(X,Y)):-parent(holds(X,Z)),ancestor(holds(Z,Y)).
TML: '@comment'(" This example is taken").
TML: '@comment'(" from Datalog Educational System").
TML: '@comment'(" http://des.sourceforge.net/").
% sucess(===============).
% =============== .
% armageddon.
% =============== .
% sucess(===============).
TML: '@comment'(" There are birds Charlie and Coco").
TML: bird('Charlie').
TML: bird('Coco').
TML: '@comment'(" and there are humans John and Jane,").
TML: human('John').
TML: human('Jane').
TML: '@comment'(" Uncomment the following line to end the world").
TML: '@comment'(" armageddon.").
TML: '@comment'(" bird is a being").
TML: being(X):-bird(X).
TML: '@comment'(" human is a being").
TML: being(X):-human(X).
TML: '@comment'(" beings are mortal").
TML: mortal(X):-being(X).
TML: '@comment'(" if armageddon, then all mortals die").
TML: dead(X):-mortal(X),armageddon.
TML: '@comment'(" what dies isn't bird/human/").
TML: '@comment'(" mortal/being anymore").
TML: not(bird(X)):-dead(X).
TML: not(human(X)):-dead(X).
TML: not(mortal(X)):-dead(X).
TML: not(being(X)):-dead(X).
% sucess(===============).
% =============== .
% eUNSAT.
% =============== .
% failed(===============).
% # Following program does 6 steps and returns
% # to the state where it initially started.
% #
% # TML has to stop and outputs: unsat
% #
% # Not stopping would cause an infinite loop
%
% start.
% running :- start.
% fmt90_x1tart :- running.
% stop :- running.
% "# Following program does 6 steps and returns\n# to the state where it initially started.\n#\n# TML has to stop and outputs: unsat\n#\n# Not stopping would cause an infinite loop\n\nstart.\nrunning :- start.\n~start :- running.\nstop :- running.\n~running :- stop.\nstart :- stop.\n~stop :- start.\n".
% failed(===============).
% init_why(after('/opt/logicmoo_workspace/packs_sys/tauchain_prolog/prolog/tauchain/tml_interp.pl')).
% init_why(program).
?-
````

