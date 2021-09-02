child(john,sue). child(jane,sue). child(sue,george).
child(john,sam). child(jane,sam). child(sue,gina).

male(john). male(sam). male(george).
female(sue). female(gina). female(jane).


parent(Y,X)  :-  child(X,Y).
father(Y,X)  :-  child(X,Y),  male(Y).
opp_sex(X,Y)  :-  male(X),  female(Y).
opp_sex(Y,X)  :-  male(X),  female(Y).
grand_father(X,Z)  :-  father(X,Y),  parent(Y,Z).


