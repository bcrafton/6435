
clc;
clear;

hold on;

############

M = dlmread("./data/ex1/tek0001ALL.csv");

x = M(:, 1);
y = M(:, 2);

len = size(x)(1);
mid = floor(len / 2);

plot(x, y);

############

M = dlmread("./data/ex2/tek0001ALL.csv");

x = M(:, 1);
y = M(:, 2);

# plot(x, y);

############

M = dlmread("./data/neuron_recordings/neuron_spike_Iin_0.001nA.csv");

x = M(:, 1);
y = M(:, 2);

# plot(x, y);

############

M = dlmread("./data/neuron_recordings/neuron_spike_Iin_0.01nA.csv");

x = M(:, 1);
y = M(:, 2);

plot(x, y);

############

M = dlmread("./data/neuron_recordings/neuron_spike_Iin_0.1nA.csv");

x = M(:, 1);
y = M(:, 2);

# plot(x, y);

############

M = dlmread("./data/neuron_recordings/neuron_spike.csv");

x = M(:, 1);
y = M(:, 2);

# plot(x, y);

############

M = dlmread("./data/neuron_recordings/neuron_spike_Iin_1n.csv");

x = M(:, 1);
y = M(:, 2);

plot(x, y);

############

M = dlmread("./data/neuron_recordings/neuron_spike_Iin_10nA.csv");

x = M(:, 1);
y = M(:, 2);

# plot(x, y);

############

M = dlmread("./data/neuron_recordings/neuron_spike_Iin_18nA.csv");

x = M(:, 1);
y = M(:, 2);

# plot(x, y);

############

M = dlmread("./data/neuron_recordings/neuron_spike_Iin_50nA.csv");

x = M(:, 1);
y = M(:, 2);

plot(x, y);

############
