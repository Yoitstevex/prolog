member(X,[X|_]).
member(X,[_|T]):- member(X,T).

len([],0).
len([_|T],N)  :-  len(T,X),  N  is  X+1.

append([],L,L).
append([H|T],L2,[H|L3])  :-  append(T,L2,L3).
