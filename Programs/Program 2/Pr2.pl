% Bradley Grose
% Project 2
% 9/2/2021

%Did Leonardo DiCaprio act in Babel?
q1 :- acted_in('Leonardo DiCaprio', 'Babel').

%Who directed District 9?
q2(D) :- directed(D, 'District 9').

%Did anyone act in Both Click and The Aviator
q3(A) :- acted_in(A, 'Click'), acted_in(A, 'The Aviator').

%Was there a move released in 2010 that did not star Jennifer Aniston?
q4(M):- released(M, 2010), \+ acted_in('Jennifer Aniston', M).

%Who directed movies released in 2009?
% X = movie
q5(D):- released(X, 2009), directed(D, X).

%Has anyone directed more than one movie?
% X & Y = movie
q6(D) :- directed(D, X), directed(D, Y), X \= Y.

%Does any movie have more than one director?\
% X & Y = director
q7(M) :- directed(X, M), directed(Y, M), X \= Y.

%Has anyone acted in more than one movie released in 2008?
% X & Y = movie
q8(A) :- acted_in(A, X), acted_in(A, Y), released(X, 2008), released(Y, 2008), X \= Y.

%Has anyone acted in more than two movies in the same year?
% X & Y & Z = movie, P = year
q9(A) :- acted_in(A, X), acted_in(A,Y), acted_in(A, Z), released(X, P), released(Y,P), released(Z,P), X \= Y, X \= Z, Y \= Z.

%Who has worked with the same director in different years?
% X & Y & Z = director, P & N = year
q10(A) :- acted_in(A, X), acted_in(A, Y), directed(D, X), directed(D, Y), released(X, P), released(Y, N), P \= N.


