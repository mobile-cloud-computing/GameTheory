%Angular Similiarity between A and B with respect to reference point C
function s = similarity(A,B,C)
dotAB = dot(A,B);
dAC = ((A(1) - C(1))^2 + (A(2) - C(2))^2)^0.5;
dBC = ((B(1) - C(1))^2 + (B(2) - C(2))^2)^0.5;
s = dotAB / (dAC * dBC);
end