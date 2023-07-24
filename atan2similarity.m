function as = atan2similarity(A,B,C) % 90 degree 1.57
as = abs(atan2(B(2) - C(2), B(1) - C(1)) - atan2(A(2) - C(2), A(1) - C(1)));
end