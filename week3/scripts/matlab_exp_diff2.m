
M = dlmread('../data/diff2-50-0.1.csv');

x = M(:,1);
y1 = movmin(M(:,2), 100);
y2 = movmin(M(:,3), 100);

plot(x, [y1, y2], 'b');
