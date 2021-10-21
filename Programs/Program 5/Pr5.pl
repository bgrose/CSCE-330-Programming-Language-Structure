%consider pattern matching and head-tail notation for these

exactly3(L):- L = [_,_,_].

at_least_3(L):- L=[_,_,_|_].

at_most_3(L):- L = [].
at_most_3(L):- L = [_].
at_most_3(L):- L = [_,_].
at_most_3(L):- L = [_,_,_].


intersect(L1,L2):- member(X, L1), member(X, L2).

all_intersect(ListofLists,L):- ListofLists = [X|Y], intersect(X,L), all_intersect(Y, L).
all_intersect(ListofLists, _):- ListofLists = [].


%source removal, see pdf. You'll probably want to define helper predicates
% assume G is set and you need to return list of nodes
% as [a,b,d...], not [ [a|[v,d]], [b| [d] ], [d| [c,x]],... ]
source_removal(G,Toposort):- true.