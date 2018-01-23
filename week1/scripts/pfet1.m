
clc;
clear;

############
### PFET ### 
############

##############
#### UT ######
##############

function [ thermal_voltage, result ] = pFet_thermal_voltage( )
  B = dlmread("pFET_sourcesweep1.txt");
  X = B(:,1);
  Y = B(:,2);

  # this is backwards intentionally
  # has to do with x data being reversed.
  X = X(150:165);
  Y = Y(150:165);
  #disp(X);
  
  result = polyfit(X, log(Y), 1);
  thermal_voltage = 1/result(1);
endfunction

##############
### SIGMA ####
##############

function [ sigma, result ] = pFet_sigma( )
  B = dlmread("pFET_drainsweep1.txt");
  X = B(:,1);
  Y = B(:,2);

  X = X(75:175);
  Y = Y(75:175);

  result = polyfit(X, Y, 1);
  sigma = -1*result(1)*0.025;
endfunction

##############
### K ####
##############

function [ kappa, result ] = pFet_kappa( )
  B = dlmread("pFET_gatesweep1.txt");

  X = B(:,1);
  Y = B(:,2);

  X = X(180:195);
  Y = Y(180:195);

  result = polyfit(X, log(Y), 1);
  kappa = -1*result(1)*.025;
endfunction

##############
### I0 ### 
##############

function [ I0, result ] = pFet_I0( )
  B = dlmread("pFET_gatesweep1.txt");

  X = B(:,1);
  Y = B(:,2);
  
  X = X(241);
  Y = Y(241);
  
  result = polyfit(X, Y, 1);
  I0 = Y(1);
endfunction

##############
### VT ### 
##############

function [ result ] = pFet_subthreshold( voltage )
  B = dlmread("pFET_gatesweep1.txt");

  X = B(:,1);
  Y = B(:,2);
  
  X = X(180:195);
  Y = Y(180:195);
  
  res = polyfit(X, log(Y), 1);
  result = polyval(res, voltage);
endfunction

function [ result ] = pFet_abovethreshold( voltage )
  B = dlmread("pFET_gatesweep1.txt");

  X = B(:,1);
  Y = B(:,2);
    
  X = X(50:170);
  Y = Y(50:170);
    
  res = polyfit(X, log(Y), 2);  
  result = polyval(res, voltage);
endfunction

function [ result ] = threshold( voltage )
  result = [pFet_subthreshold(voltage), pFet_abovethreshold(voltage)];
endfunction

voltage = [0; 2.4];
[x, fval, info] = fsolve (@threshold, voltage);
#fval

################
### get the plot data ###
################

threshold_voltage = fval(1);
[thermal_voltage, thermal_voltage_polyfit] = pFet_thermal_voltage();
[sigma, sigma_polyfit] = pFet_sigma();
[I0, I0_polyfit] = pFet_I0();
[kappa, kappa_polyfit] = pFet_kappa();
theshold_current = I0/exp(-1*kappa*threshold_voltage/thermal_voltage);

disp("threshold voltage: ");disp(threshold_voltage);
disp("thermal voltage: ");disp(thermal_voltage);
disp("sigma: ");disp(sigma);
disp("I0: ");disp(I0);
disp("kappa: ");disp(kappa);
disp("Ith: ");disp(theshold_current);

pfet_source = dlmread("pFET_sourcesweep1.txt");
pfet_drain = dlmread("pFET_drainsweep1.txt");
pfet_gate = dlmread("pFET_gatesweep1.txt");

source_in = pfet_source(:, 1);
source_out = pfet_source(:, 2);

drain_in = pfet_drain(:, 1);
drain_out = pfet_drain(:, 2);

gate_in = pfet_gate(:, 1);
gate_out = pfet_gate(:, 2);

################
### do the plots ###
################

# this is backwards intentionally
# has to do with x data being reversed.
thermal_voltage_range = linspace(0.75, 0.90, 16);
thermal_voltage_out = polyval(thermal_voltage_polyfit, thermal_voltage_range);
subplot (5, 1, 1);
hold on;
semilogy( source_in, source_out, 'b');
semilogy( thermal_voltage_range, exp(thermal_voltage_out), 'r', "linewidth", 5);
hold off;
title ("Thermal Voltage");

sigma_range = linspace(0.75, 1.75, 101);
sigma_out = polyval(sigma_polyfit, sigma_range);
subplot (5, 1, 2);
hold on;
plot( drain_in, drain_out, 'b');
plot( sigma_range, sigma_out, 'r', "linewidth", 5);
hold off;
title ("Sigma");

kappa_range = linspace(1.8, 1.95, 16);
kappa_out = polyval(kappa_polyfit, kappa_range);
subplot (5, 1, 3);
hold on;
semilogy( gate_in, gate_out, 'b');
semilogy( kappa_range, exp(kappa_out), 'r', "linewidth", 5);
hold off;
title ("Kappa");

I0_range = linspace(0.0, 2.4, 241);
I0_out = polyval(I0_polyfit, I0_range);
subplot (5, 1, 4);
hold on;
plot( gate_in, gate_out, 'b');
plot( I0_range, I0_out, 'r', "linewidth", 5);
hold off;
title ("I0");

vt_range = linspace(1.4, 2.4, 101);
subthreshold = pFet_subthreshold(vt_range);
abovethreshold = pFet_abovethreshold(vt_range);
subplot (5, 1, 5);
hold on;
semilogy( vt_range, exp(subthreshold), 'y', "linewidth", 1);
semilogy( vt_range, exp(abovethreshold), 'g', "linewidth", 1);
semilogy( gate_in, gate_out, 'b', "linewidth", 1);
hold off;
title ("Threshold Voltage");
