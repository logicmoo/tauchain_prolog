# Introduction

TML (Tau Meta-Language) is a variant of Datalog. It is intended to serve as
a translator between formal languages (and more uses, see under the Philosophy
section). The main difference between TML and common Datalog implementations is
that TML works under the Partial Fixed-Point (PFP) semantics, unlike common
implementations that follow the Well-Founded Semantics (WFS) or stratified
Datalog. By that TML (like with WFS) imposes no syntactic restrictions on
negation, however unlike WFS or stratified Datalog it is PSPACE complete rather
than P complete.  TML's implementation heavily relies on BDDs (Binary Decision
Diagrams) in its internals. This gives it extraordinary performance in time and
space terms, and allowing negation to be feasible even over large universes. In
fact negated bodies, as below, do not consume more time or space than positive
bodies by any means, thanks to the BDD mechanism.


Specifically:
* Proof extraction needs a rewrite.
* Proof extraction for programs that contain negation.
* Tree extraction is not fully working and is a very preliminary implementation,
specifically:
  * Cycle detection
  * Node omission
  * Testing
* Queries need a rewrite.
* String from trees.
* Strings are encoded in a different style than described here.
* Symbol for length of strings.
* Support binary input files and UTF-8 charset.
* Parsing error messages and bugs.
* First order formulas.
* Comprehensive tests of everything.

# Universe

The size of the universe (or domain of discourse) of a TML program is:
* The number of distinct non-relation symbols in the program, plus
* The maximum nonnegative integer that appears in the program (where the length
of input strings counts as appearing in the program), plus
* 256 if at least one character symbol is used in the program (or at least one
string appears in the program).

# Fixed Points

TML follows the PFP semantics in the following sense. On each step, all rules
are executed once and only once, causing a set of insertions and deletions of
terms. If the same term is inserted and deleted at the same step, the program
halts and evaluates to `unsat`. Otherwise it continues to the next step
performing again a single evaluation of every rule. This process must eventually
halt in either of the following forms:

1. The database obtained from the current step is equal to the database resulted
from the previous step. This is a Fixed-Point. When this happens, the resulted
database is considered as the final result.

2. Or, the database obtained in one step equals to the database state in some
previous, not immediate predecessor, state. In this case the program will loop
forever if we wouldn't detect it and halt the program, and is therefore
evaluated to `unsat`, as no fixed point exists.

Note that only one of the two options can happen because the arity and the
universe size are fixed. Ultimately, for universe size n and maximum arity k,
they will occur in no more than 2^n^k steps.

# Facts and Rules

A TML program consists of initial terms (facts) and rules that instruct the
interpreter which terms to derive or delete at each step, as described in the
previous section.

## Facts

Facts take the form of

    a(b c).
    a(b(c)).
    a(1 2 3).
    rel('t' 1 2).
    b(?x).
    r.

Each term begins with a relation symbol (which is not considered as part of the
universe). It is then possibly followed by parenthesis (or any balanced sequence
of them) containing symbols. A term like `b(b)` is understood as containing two
different symbols, one `b` stands for a relation symbol, and the second one for
a universe element. Symbols may either be alphanumeric literals (not beginning
with a digit), or a nonzero integer, or a character. Additionally a term may
contain variables, prefixed with `?`. A fact that contain variables,
like `b(?x)`, is interpreted where ?x goes over the whole universe. So the
program

    a(1).
    b(?x).

is equivalent to

    a(1).
    b(0).
    b(1).

## Rules

Rules are terms separated by commas and one update operator `:-`. For example:

    e(?x ?y) :- e(?x ?z), e(?z ?y).

what is left to the update operator (which may be several terms separated by
commas) is called the `head` of the rule, while the rhs is called the `body`
of the rule. This latter example therefore instructs to add to the next-step
database all facts of the form e(?x ?y) such that e(?x ?z) and e(?x, ?y) appear
in the current-step database, for some value of ?z. So for example the following
program

    e(1 2).
    e(2 1).
    e(?x ?y) :- e(?x ?z), e(?z ?y).

will result with:

    e(1 2).
    e(2 1).
    e(1 1).
    e(2 2).

Note that the order of facts and rules does not matter. Also note that all
facts and rules must end with a dot.

## Negation and Deletion

Bodies may be negated using the negation symbol `~`, for example:

    e(?x ?y) :- e(?x ?z), e(?z ?y), ~e(?x ?x).

The variable ?x will bind to all values such that e(?x ?x) does not appear in
the current-step database.

Heads may also contain the negation symbol, in which case it is interpreted
as deletion. For example the rule:

    ~e(?x ?x) :- e(?x ?x).

Will make the next-step database to not include all terms of the form e(?x ?x)
included on the current step database.

For performance reasons it is advised to better not have variables appearing
in negated bodies that do not occur in any positive head (in the same rule),
or variables that appear in positive heads and do not appear in bodies (also in
the same rule). However this is only a performance advice. TML should work
correctly either way, where variables (implicitly) range over the whole
universe.

## Sequencing

It is possible to sequence programs one after the other using curly brackets.
For example the program

    {
      e(1 2).
      e(2 3).
      e(3 1).
      e(?x ?y) :- e(?x ?z), e(?z ?y).
    }
    {
      ~e(?x ?x) :- e(?x ?x).
    }

will result with

    e(1 2).
    e(1 3).
    e(2 1).
    e(2 3).
    e(3 1).
    e(3 2).

More generally, the output of one program is considered the input of the other.
It is possible to filter the output before passing it to the next program as in
the section "Queries".

Nested programs are unsupported as they make no difference from flat sequences.

# Trees

Terms of certain form are interpreted as trees. This does not affect the rules
at all, but only as means of inputting and outputting facts, as below. Trees are
expressed by constructing a directed graph of terms. For example the following
term

    b((a(1 2)) (a(2 2)) (c(2 3)))

indicates two edges in a graph named `b`, where a vertex labelled `a(1 2)` has
two [ordered] outgoing edges, one to the term `a(2 2)` and one to the term
`c(2 3)`. Terms as labels of vertices need not be proper terms in the sense
that we could also have

    b((a 1 2) (a 2 2) (c 2 3))

Either way, `a` and `c` are interpreted as universe elements rather relation
symbols. In general having a relation symbols and then parenthesized sequences
of elements is interpreted as denoting ordered outgoing edges.

We can construct trees in the normal way using rules. For example, a proof
tree of a program consisting of the rule

    e(?x ?y) :- e(?x ?z), e(?y ?z).

may be constructed by adding the rule

    proof((e(?x ?y)) (e(?x ?z)) (e(?y ?z))) :- e(?x ?y), e(?x ?z), e(?y ?z).

We can then extract the proof tree by querying, as in the section "Queries".
However as in that section there's a shortcut syntax for extracting proofs.

Note that as we indeed construct a directed graph rather a tree, it is
interpreted as a packed representation of a forest. Further this graph may
contain loops. They are avoided during the traversal by simply skipping
previously visited nodes.

Terms that appear in double parenthesis, like `a 2 2` in:

    b((a 1 2) ((a 2 2)) (c 2 3))

will be omitted when converting a tree to a string, as in the next section.

# Strings

It is possible to input strings to the database. The line

    @string mystr "abc".

will add the following fact to the database:

    mystr(((0))('a')((1))).
    mystr(((1))('b')((2))).
    mystr(((2))('c')((3))).

More generally, `@string relname "str"` will use the relation symbol relname
to declare a tree where each string position has first successor to the
character on that position, and a second successor to the next position.
Observe that the positions appear in double parenthesis. This is because of the
following:

It is possible to construct a string by specifying a root of a tree. The backend
will then traverse the tree depth-first left-first (Pre-Order) and stringify its
content. It will omit from the output string nodes that appear in double
parenthesis. For example the program

    @string str T((1 2)).
    T((1 2) (2 3) (a b)).
    T((a b) (c d)).
    T((2 3) (4 5)).

will result in having the relation symbol `str` represent the string:

    "122345abcd"

while if we had:

    @string str T((1 2)).
    T((1 2) ((2 3)) (a b)).
    T((a b) ((c d))).
    T(((2 3)) (4 5)).

the string `str` would be:

    "1245ab"
    
This relation `str` is then transferred to the next sequenced program, or
emitted as the output of the program if no sequenced program is present.

Note that the double-parenthesis omission is denoted on the successor nodes.

Now we can see why strings create trees with double parenthesis: the following

    @string str1 "abc".
    @string str2 str1(((0))).

will result with `str2="abc"`.

It is also possible to output a string to `stdout` by using it as a relation
symbol:

    @stdout str1(((0))).

or arbitrary tree:

    @stdout T((1 2)).

In addition a string can refer to command line arguments:

    @string str $1.

or to be taken from `stdin`:

    @string str stdin.

or from a file:

    @string str <filename>.

Finally it is possible to refer to the length of the string by the symbol
`len:str`.

# Queries

TML features three kinds of queries: filtering, proving, and tree extraction.
Filtering and tree extraction replace the resulted database with their result,
namely deleting everything unrelated to them. Their result is then outputed
or passed to the next sequenced program.

Filtering is done by:

    ! e(1 ?x).

which will leave on the database only the results that match the term `e(1 ?x).`
Tree extraction is done by supplying the root (which may possibly contain
variables) after `!!`:

    !! T((?x ?y)).

Proof extraction is done by adding a single directive specifying a relation
name:

    @trace relname.

which will construct a forest with relation symbol `relname` that contains
all possible witnesses to all derived facts, in a fashion that was described
above: if we have a rule

    e(?x ?y) :- e(?x ?z), e(?y ?z).
    @trace P.

then the trace tree will have the form

    P((e(?x ?y)) (e(?x ?z)) (e(?y ?z))).

# Grammars

It is possible to supply a context free grammar as a syntactic shortcut for
definite clause grammars. For example Dyck's language may be written as:

    S => null.
    S => '(' S ')' S.

and will be converted to the rules:

    S(?v1 ?v1) :- str(((?v1)) (?v2) ((?v3))).
    S(?v3 ?v3) :- str(((?v1)) (?v2) ((?v3))).
    S(?v1 ?v5) :- str(((?v1)) ('(') ((?v2))), S(?v2 ?v3),
        str(((?v3)) (')') ((?v4))), S(?v4 ?v5).

where `str` is some string defined in the program. Grammars are allowed in
programs that contain only one string. If multiple strings require parsing it
is possible to define them in sequenced programs.

Extracting the parse forest can be done by extracting a proof of the start
symbol:

    !! parseForest S(0, len:str).

which also defines the start symbol.

The grammar supports fow now the builtins `alpha`, `alnum`, `digit`, `printable`
, and `space`. For example a sequence of one or more whitespaces can be defined
by the productions

    ws => space ws1.
    ws1 => space ws1.
    ws1 => null.

# First Order Formulas

It is possible to supply a first order formula which is then transformed into
a TML program. TBD

# Misc

Comments are either C-style /* \*/ multiline comments, or # to comment till
the end of the line.

# Philosophy

TBD

# Future Work

* Support !=, <, >, min, max.
* Support finitary arithmetic.
* Backward chaining and focused goal resolution.
* More grammar and string builtins.
* BDD level garbage collection.
* Improved syntax.
* TBD

# Further Examples

TBD
