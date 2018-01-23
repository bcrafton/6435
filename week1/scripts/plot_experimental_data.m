
clear;
clc;

experimenal_data = dlmread("data");

time = experimenal_data(:,1);
input = experimenal_data(:,2);
output1 = experimenal_data(:,3);
output2 = experimenal_data(:,4);

hold on;
plot(input, input, 'b');
plot(input, output1, 'g');
plot(input, output2, 'r');
hold off;