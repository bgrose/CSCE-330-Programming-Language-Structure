% Bradley Grose
% Project 3 

great_grand_parent(GGP,GGC):- child(GGC, X), child(X, Y), child(Y, GGP).

%Q1
mother(M,C):- child(C, M), female(M).

grand_parent(GP,GC):- child(X, GP), child(GC, X).

great_grand_mother(GGM,GGC):- female(GGM), child(GGC, X), child(X, Y), child(Y, GGM).

%Q2
sibling(A,B):-child(A, X), child(B, X), A \= B.
brother(B,Sib):-child(B, X), child(Sib, X), male(B), B \= Sib.
sister(S,Sib):-child(S, X), child(Sib, X), female(S), S \= Sib.

%Q3 --
%You have to know both parents for both siblings for half_sibling
half_sibling(S1,S2):-child(S1, Per), child(S1, Per1), child(S2, Per), child(S2, Per2), Per \= Per1, Per1 \= Per2, Per \= Per2, S1\=S2.
full_sibling(S1,S2):-child(S1, M), child(S1, D), child(S2, M), child(S2, D), M \= D, S1\=S2.

%Q4
first_cousin(C1,C2):-child(C1, X), child(C2, Y), sibling(X, Y), X \= Y, C1 \= C2.
second_cousin(C1,C2):- child(C1, X), child(C2, Y), first_cousin(X, Y), X \= Y, C1 \= C2.

%Q5
half_first_cousin(C1,C2):- child(C1, X), child(C2, Y), half_sibling(X, Y), X \= Y, C1 \= C2.
double_first_cousin(C1,C2):-child(C1, X), child(C1, X2), child(C2, Y), child(C2, Y2), sibling(X, Y), sibling(X2, Y2), X \= Y, C1 \= C2, X2 \= Y2, X2 \= X, Y2 \= Y.

%Q6
first_cousin_twice_removed(C1,C2):- (first_cousin(C1,X), grand_parent(X,C2)) ; (first_cousin(C2,X), grand_parent(X,C1)).

%Q7
descendant(D,A):-child(D, A); grand_parent(A, D); great_grand_parent(A,D); (great_grand_parent(A,X), child(D, X)).
ancestor(A,D):-descendant(D, A).

%Q8
%this version of "cousin" does not handle "____ removed",
%read description carefully
cousin(X, Y):- (first_cousin(X,Y)) ; (second_cousin(X, Y)).

%Q9
%do not return anything for closest_common_ancestor(X,X,A).
closest_common_ancestor(R1,R2,A):- ancestor(A,R1), ancestor(A,R2), R1 \= R2, \+ (child(X,A), ancestor(X, R1), ancestor(X,R2)).

% Q10 -- not scored, but will do
%   write_descendant_chain(jim,anna) and
%   write_descendant_chain(louise,gina) and
%   write_descendant_chain(emma,lily) <-this one shold print nothing
%   (make sure this does not fail (read the instructions carefully)).

write_child(X,Y):-
	write(X), write(' is a child of '), write(Y), nl.

write_descendant_chain(X,Y):- child(X,Y), write_child(X,Y).
write_descendant_chain(X,Y) :- child(X, Z), write_child(X,Z), write_descendant_chain(Z,Y).  
