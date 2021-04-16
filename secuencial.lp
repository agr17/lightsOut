#program dynamic.

h(ce(X,Y), on) :- 'h(ce(X,Y), off), _ad(X,Y,X',Y'), o(tog(X',Y')).
h(ce(X,Y), off) :- 'h(ce(X,Y), on), _ad(X,Y,X',Y'), o(tog(X',Y')).

% Inertia: c(F,V)=value V has changed
h(F,V) :- 'h(F,V), not c(F).
c(F)   :- 'h(F,V), h(F,W), V!=W.  

% Action generation
1 { o(A): _action(A) } 1.
