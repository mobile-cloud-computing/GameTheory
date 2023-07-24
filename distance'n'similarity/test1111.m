A = [4 5];
B = [4 5];
C = [0 0];
dotAB = dot(A,B);
dAC = ((A(1) - C(1))^2 + (A(2) - C(2))^2)^0.5;
dBC = ((B(1) - C(1))^2 + (B(2) - C(2))^2)^0.5;
simAB = dotAB / (dAC * dBC)