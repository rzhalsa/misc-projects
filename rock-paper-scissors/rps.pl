% rps.pl
%
% Simulates a game of rock paper scissors, best of 5
%
% Authors: Sam Collins, Ryan McHenry
% Date: November 12, 2024

% facts
beats(rock, scissors).
beats(scissors, paper).
beats(paper, rock).

% play the game
play :- reset_lists, repeat, write('Your choice? '), player_move(X), computer_move(Y), result(X, Y), (best_of_five -> !; fail).

% decides the player's move
player_move(X) :- read(X), member(X, [rock, paper, scissors]).

% randomly decides the computer's move
computer_move(Y) :- random_member(Y, [rock, paper, scissors]), write('The computer chose '), writeln(Y).

% gets the result of the current game
result(X, Y) :- beats(X, Y), writeln('#------------#\n| You win :) |\n#------------#'),player_wins(X), print_score, nl.
result(X, Y) :- beats(Y, X), writeln('#-------------#\n| You lose :( |\n#-------------#'),computer_wins(Y), print_score, nl.
result(X, X) :- writeln('#----------------#\n| It\'s a draw :| |\n#----------------#'), print_score, nl.

print_score :- player_list(X), computer_list(Y), length(X, PLength), length(Y, CLength), write('Current score: '), write(PLength), write('-'), writeln(CLength).

% keeps track of the player and computer's wins
:- dynamic(player_list/1).
player_list([]).
player_wins(X) :- retract(player_list(Plist)), append(Plist, [X], Newlist), assert(player_list(Newlist)).

:- dynamic(computer_list/1).
computer_list([]).
computer_wins(Y) :- retract(computer_list(Clist)), append(Clist, [Y], Newlist), assert(computer_list(Newlist)).

% checks if a player has won the entire game
best_of_five :-
    player_list(X), computer_list(Y), length(X, PLength), length(Y, CLength),
    (   PLength =:= 3 -> writeln('You have won the Rock Paper Scissors match!'), !
    ;   CLength =:= 3 -> writeln('You have lost the Rock Paper Scissors match. Better luck next time!'), !).

% resets both the player and computer lists
reset_lists :- retractall(player_list(_)), assert(player_list([])), retractall(computer_list(_)), assert(computer_list([])).
