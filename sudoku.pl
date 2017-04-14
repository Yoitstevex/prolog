%% sudoku.pl
:- use_module(library(clpfd)).

sudoku(Puzzle) :-
    flatten(Puzzle, Tmp), Tmp ins 1..9,
    Rows = Puzzle,
    transpose(Rows, Columns),
    blocks(Rows, Blocks),
    maplist(all_distinct, Rows),
    maplist(all_distinct, Columns),
    maplist(all_distinct, Blocks),
    maplist(label, Rows).

blocks([A,B,C,D,E,F,G,H,I], Blocks) :-
    blocks(A,B,C,Block1), blocks(D,E,F,Block2), blocks(G,H,I,Block3),
    append([Block1, Block2, Block3], Blocks).

blocks([], [], [], []).
blocks([A,B,C|Bs1],[D,E,F|Bs2],[G,H,I|Bs3], [Block|Blocks]) :-
    Block = [A,B,C,D,E,F,G,H,I],
    blocks(Bs1, Bs2, Bs3, Blocks).

/*

Puzzle = [
    [2,_,_,_,9,_,_,_,1],
    [3,_,9,_,_,7,_,_,_],
    [_,_,1,_,4,_,_,7,_],
    [_,6,_,_,_,_,_,_,_],
    [_,_,_,_,_,3,_,_,_],
    [_,_,8,6,_,_,7,9,_],
    [6,_,_,7,_,_,8,_,_],
    [1,2,3,_,_,8,_,_,_],
    [_,8,7,_,_,4,3,_,_]], Puzzle = [A,B,C,D,E,F,G,H,I], sudoku(Puzzle).

Puzzle = [
    [_,_,_,_,_,_,_,_,_],
    [_,_,_,_,_,_,_,_,_],
    [_,_,_,_,_,_,_,_,_],
    [_,_,_,_,_,_,_,_,_],
    [_,_,_,_,_,_,_,_,_],
    [_,_,_,_,_,_,_,_,_],
    [_,_,_,_,_,_,_,_,_],
    [_,_,_,_,_,_,_,_,_],
    [_,_,_,_,_,_,_,_,_]], Puzzle = [A,B,C,D,E,F,G,H,I], sudoku(Puzzle).

*/
