
%For all of these, especially the first two, see the examples in the book
%Ignore the Singleton variable warning, that goes away when you 
% define the rules. 

%europe map coloring problem -- use these colors as the domain
europe_color(Fr,Sw,It,Be,Ho,Ge,Au):- color(Fr), color(Sw), 
color(It), color(Be), color(Ho), color(Ge), color(Au), 
Fr \= Be, Fr \= Ge, Fr \= It, Fr \= Sw, Sw \= It, Sw \= Ge, 
Sw \= Au, It \= Au, Be \= Ge, Be \= Ho, Ho \= Ge, Ge \= Au.


% CROSS + ROADS = DANGER
cryptarithmetic(C,R,O,S,A,D,N,G,E):- 
    dig(S),
    R is (S+S) mod 10, C1 is (S+S) // 10,
    dig(D),
    E is (S+D+C1) mod 10, C10 is (S+D+C1) // 10,
    dig(O), dig(A),
    G is (O+A+C10) mod 10, C100 is (O+A+C10) // 10,
    dig(R),
    N is (R+O+C100) mod 10, C1000 is (R+O+C100) // 10,
    dig(C),
    A is (C+R+C1000) mod 10, D is (C+R+C1000) // 10,
    uniq_digits(C,R,O,S,A,D,N,G,E).

uniq_digits(C,R,O,S,A,D,N,G,E):- 
    dig(C), dig(R), dig(O), dig(S), dig(A), dig(D), dig(N), dig(G), dig(E),
    C \= R, C \= O, C \= S, C \= A, C \= D, C \= N, C \= G, C \= E,
    R \= O, R \= S, R \= A, R \= D, R \= N, R \= G, R \= E,
    O \= S, O \= A, O \= D, O \= N, O \= G, O \= E,
    S \= A, S \= D, S \= N, S \= G, S \= E,
    A \= D, A \= N, A \= G, A \= E,
    D \= N, D \= G, D \= E,
    N \= G, N \= E,
    G \= E.

%Persons are just their names, lower case
who_ordered_pizza(PizzaPerson):- 
    uniq_person(Chicken, Steak, Lasagna, PizzaPerson),
    uniq_person(Coke, Water, Milk, Coffee),
    
    beside(doreen, Steak),
    Chicken = Coke,
    across(Lasagna, Milk),
    david \= Coffee,
    donna = Water,
    danny \= Steak.
    


uniq_person(A,B,C,D) :- person(A), person(B), person(C), person(D),
    A \= B, A \= C, A \= D, B \= C, B \= D, C \= D.

% Define People
person(donna). person(danny). person(david). person(doreen).

% Sitting Positions
beside(donna, danny).
beside(donna, david).
beside(doreen, danny).
beside(doreen, david).
beside(danny, doreen).
beside(david, doreen).
beside(danny, donna).
beside(david, donna).

across(danny, david).
across(david, danny).
across(donna, doreen).
across(doreen, donna).