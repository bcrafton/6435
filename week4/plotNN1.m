
clc;
clear;

############

# M = dlmread("./data/ex1/tek0001ALL.csv");
M = dlmread("./data/neuron_recordings/neuron_spike_Iin_50nA.csv");

x1 = M(:, 1);
y1 = M(:, 2);

len1 = size(x1)(1);
mid1 = floor(len1 / 2);

############

M = dlmread("./data/neuron_recordings/neuron_spike_Iin_0.1nA.csv");

x2 = M(:, 1);
y2 = M(:, 2);

len2 = size(x2)(1);
mid2 = floor(len2 / 2);

############

M = dlmread("./data/neuron_recordings/neuron_spike_Iin_10nA.csv");

x3 = M(:, 1);
y3 = M(:, 2);

len3 = size(x3)(1);
mid3 = floor(len3 / 2);

############

minmid = min( [mid1, mid2, mid3] );

x1 = x1( mid1-minmid+1 : mid1+minmid+1 );
y1 = y1( mid1-minmid+1 : mid1+minmid+1 );

x2 = x2( mid2-minmid+1 : mid2+minmid );
y2 = y2( mid2-minmid+1 : mid2+minmid );

x3 = x3( mid3-minmid+1 : mid3+minmid );
y3 = y3( mid3-minmid+1 : mid3+minmid );

hold on;

plot(x1, y1);
plot(x2, y2);
plot(x3, y3);

hold off;