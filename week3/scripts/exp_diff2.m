clc;
clear;

M = dlmread("../data/diff2_data/24kHz/1ua_500na.csv");

x = M(:,1);
#y1 = movmin(M(:,2), 100)
#y2 = movmin(M(:,3), 100)
y1 = M(:,2);
y2 = M(:,3);

plot( x, [y1, y2], 'b');

###############
###############
###############

M = dlmread("../data/diff2_data/24kHz/2ua_500na.csv");

x = M(:,1);
#y1 = movmin(M(:,2), 100)
#y2 = movmin(M(:,3), 100)
y1 = M(:,2);
y2 = M(:,3);

#plot( x, [y1, y2], 'b');

###############
###############
###############

M = dlmread("../data/diff2_data/24kHz/4ua_500na.csv");

x = M(:,1);
#y1 = movmin(M(:,2), 100)
#y2 = movmin(M(:,3), 100)
y1 = M(:,2);
y2 = M(:,3);

#plot( x, [y1, y2], 'b');
