/*

The criminal is *one* of A, B, C and D.

A says: "It's not me"
B says: "It's D"
C says: "It's B"
D says: "It's not me"

And we know that *only* one of them tells the truth.

*/








% To find a criminal and the truthteller
% 1. Pick a possible criminal
% 2. Pick a possible truthteller and the remaining liars
% 3. Assert that the truthteller's statement is the truth
% 4. Assert that every liar's statement is not the truth
% If both the assertions succeed
% then we have found a criminal and the truthteller.
criminal_and_truthteller(Criminal, Truthteller) :-
    Group = [a, b, c, d],
    member(Criminal, Group),
    select(Truthteller, Group, Liars),
    statement(Truthteller, Criminal, Truth),
    Truth,
    forall(
        member(Liar, Liars),
        (statement(Liar, Criminal, Lie), \+ Lie)
    ).

% Statements
% Arg 1: Who says
% Arg 2: About whom
% Arg 3: Which statement
% e.g. "a claims that a is not a criminal"
statement(a, C, a \= C).
statement(b, C, d  = C).
statement(c, C, b  = C).
statement(d, C, d \= C).
