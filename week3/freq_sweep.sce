
a0 = [1.05];
a1 = repmat(a0, 1, 8);
a2 = repmat(a1, 1, 2);
a3 = repmat(a2, 1, 2);
a4 = repmat(a3, 1, 2);
a5 = repmat(a4, 1, 2);
a6 = repmat(a5, 1, 2);

b0 = [1.15];
b1 = repmat(b0, 1, 8);
b2 = repmat(b1, 1, 2);
b3 = repmat(b2, 1, 2);
b4 = repmat(b3, 1, 2);
b5 = repmat(b4, 1, 2);
b6 = repmat(b5, 1, 2);

x = [a4, b4, a3, b3, a2, b2, a1, b1];

myVariable = x;
