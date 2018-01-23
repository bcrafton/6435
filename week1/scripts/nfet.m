
clc;
clear;

############
### NFET ### 
############

##############
#### UT ######
##############

function [ thermal_voltage, result ] = nFet_thermal_voltage( )
  B = dlmread("nFET_sourcesweep1.txt");
  X = B(:,1);
  Y = B(:,2);

  X = X(170:190);
  Y = Y(170:190);
  
  result = polyfit(X, log(Y), 1);
  thermal_voltage = -1/result(1);
endfunction

##############
### SIGMA ####
##############

function [ sigma, result ] = nFet_sigma( )
  B = dlmread("nFET_drainsweep1.txt");
  X = B(:,1);
  Y = B(:,2);

  X = X(120:241);
  Y = Y(120:241);

  result = polyfit(X, Y, 1);
  sigma = result(1)*0.025;
endfunction

##############
### K ####
##############

function [ kappa, result ] = nFet_kappa( )
  B = dlmread("nFET_gatesweep1.txt");

  X = B(:,1);
  Y = B(:,2);

  X = X(24:50);
  Y = Y(24:50);

  result = polyfit(X, log(Y), 1);
  kappa = result(1)*.025;
endfunction

##############
### I0 ### 
##############

function [ I0, result ] = nFet_I0( )
  B = dlmread("nFET_gatesweep1.txt");

  X = B(:,1);
  Y = B(:,2);
  
  X = X(1);
  Y = Y(1);
  
  result = polyfit(X, Y, 1);
  I0 = Y(1);
endfunction

##############
### VT ### 
##############

function [ result ] = nFet_subthreshold( voltage )
  B = dlmread("nFET_gatesweep1.txt");

  X = B(:,1);
  Y = B(:,2);
  
  X = X(24:60);
  Y = Y(24:60);
  
  res = polyfit(X, log(Y), 1);
  result = polyval(res, voltage);
endfunction

function [ result ] = nFet_abovethreshold( voltage )
  B = dlmread("nFET_gatesweep1.txt");

  X = B(:,1);
  Y = B(:,2);
    
  X = X(60:100);
  Y = Y(60:100);
    
  res = polyfit(X, log(Y), 2);  
  result = polyval(res, voltage);
endfunction

function [ result ] = threshold( voltage )
  result = [nFet_subthreshold(voltage), nFet_abovethreshold(voltage)];
endfunction

voltage = [0; 1.0];
[x, fval, info] = fsolve (@threshold, voltage);
#fval

################
### get the plot data ###
################

threshold_voltage = fval(1);
[thermal_voltage, thermal_voltage_polyfit] = nFet_thermal_voltage();
[sigma, sigma_polyfit] = nFet_sigma();
[I0, I0_polyfit] = nFet_I0();
[kappa, kappa_polyfit] = nFet_kappa();
theshold_current = I0/exp(-1*kappa*threshold_voltage/thermal_voltage);

disp("threshold voltage: ");disp(threshold_voltage);
disp("thermal voltage: ");disp(thermal_voltage);
disp("sigma: ");disp(sigma);
disp("I0: ");disp(I0);
disp("kappa: ");disp(kappa);
disp("Ith: ");disp(theshold_current);

nfet_source = dlmread("nFET_sourcesweep1.txt");
nfet_drain = dlmread("nFET_drainsweep1.txt");
nfet_gate = dlmread("nFET_gatesweep1.txt");

source_in = nfet_source(:, 1);
source_out = nfet_source(:, 2);

drain_in = nfet_drain(:, 1);
drain_out = nfet_drain(:, 2);

gate_in = nfet_gate(:, 1);
gate_out = nfet_gate(:, 2);

################
### do the plots ###
################

thermal_voltage_range = linspace(1.7, 1.9, 21);
thermal_voltage_out = polyval(thermal_voltage_polyfit, thermal_voltage_range);
subplot (5, 1, 1);
hold on;
semilogy( source_in, source_out, 'b');
semilogy( thermal_voltage_range, exp(thermal_voltage_out), 'r', "linewidth", 5);
hold off;
title ("Source Sweep : Thermal Voltage");

sigma_range = linspace(1.2, 2.4, 121);
sigma_out = polyval(sigma_polyfit, sigma_range);
subplot (5, 1, 2);
hold on;
plot( drain_in, drain_out, 'b');
plot( sigma_range, sigma_out, 'r', "linewidth", 5);
hold off;
title ("Drain Sweep : Sigma");

kappa_range = linspace(0.24, 0.50, 27);
kappa_out = polyval(kappa_polyfit, kappa_range);
subplot (5, 1, 3);
hold on;
semilogy( gate_in, gate_out, 'b');
semilogy( kappa_range, exp(kappa_out), 'r', "linewidth", 5);
hold off;
title ("Gate Sweep : Kappa");

I0_range = linspace(0.0, 2.4, 241);
I0_out = polyval(I0_polyfit, I0_range);
subplot (5, 1, 4);
hold on;
plot( gate_in, gate_out, 'b');
plot( I0_range, I0_out, 'r', "linewidth", 5);
hold off;
title ("Gate Sweep : I0");

vt_range = linspace(0.0, 1.00, 101);
subthreshold = nFet_subthreshold(vt_range);
abovethreshold = nFet_abovethreshold(vt_range);
subplot (5, 1, 5);
hold on;
semilogy( vt_range, exp(subthreshold), 'y', "linewidth", 1);
semilogy( vt_range, exp(abovethreshold), 'g', "linewidth", 1);
semilogy( gate_in, gate_out, 'b', "linewidth", 1);
hold off;
title ("Gate Sweep : Threshold Voltage");


