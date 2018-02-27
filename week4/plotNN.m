
clc;
clear;

############

M = dlmread("./data/ex1/tek0001ALL.csv");

x = M(:, 1);
y = M(:, 2);

plot(x, y);

############

M = dlmread("./data/ex2/tek0001ALL.csv");

x = M(:, 1);
y = M(:, 2);

# plot(x, y);

############