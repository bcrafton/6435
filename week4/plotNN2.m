
clc;
clear;

############

M = dlmread("./data/ex1/tek0001ALL.csv");
# M = dlmread("./data/neuron_recordings/neuron_spike_Iin_50nA.csv");

x1 = M(:, 1);
y1 = M(:, 2);

less = length( x1(x1 < -5) )
great = length( x1(x1 < 5) )
x1 = x1( less + 1 : great - 1 );
y1 = y1( less + 1 : great - 1);

############

M = dlmread("./data/neuron_recordings/neuron_spike_Iin_0.001nA.csv");

x2 = M(:, 1);
y2 = M(:, 2);

less = length( x2(x2 < -5) )
great = length( x2(x2 < 5) )
x2 = x2( less + 1: great - 1 );
y2 = y2( less + 1: great - 1);

############

M = dlmread("./data/neuron_recordings/neuron_spike_Iin_1n.csv");

x3 = M(:, 1);
y3 = M(:, 2);

less = length( x3(x3 < -5) )
great = length( x3(x3 < 5) )
x3 = x3( less + 1: great - 1);
y3 = y3( less + 1: great - 1 );

############

hold on;

plot(x1, y1, 'r');
plot(x2, y2, 'b');
plot(x3, y3, 'g');

hold off;