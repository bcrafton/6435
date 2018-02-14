clc;
clear;

M = dlmread("../data/diff2-50-0.1.csv");

x = M(:,1);
#y1 = movmin(M(:,2), 100)
#y2 = movmin(M(:,3), 100)
y1 = M(:,2);
y2 = M(:,3);

#plot( x, [y1, y2], 'b');

###############
###############
###############

M = dlmread("../data/diff2-75-0.08.csv");

x = M(:,1);
#y1 = movmin(M(:,2), 100)
#y2 = movmin(M(:,3), 100)
y1 = M(:,2);
y2 = M(:,3);

#plot( x, [y1, y2], 'b');

###############
###############
###############

M = dlmread("../data/diff2-100-0.05.csv");

x = M(:,1);
#y1 = movmin(M(:,2), 100)
#y2 = movmin(M(:,3), 100)
y1 = M(:,2);
y2 = M(:,3);

plot( x, [y1, y2], 'b');
