
A = dlmread('../data/diff2_data/24kHz/1ua_500na.csv');
B = dlmread('../data/diff2_data/24kHz/2ua_500na.csv');
C = dlmread('../data/diff2_data/24kHz/4ua_500na.csv');

num_points = size(A);
num_points = num_points(1);
num_points = num_points / 5;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Ax = A(:,1);
Ax = Ax(1:num_points);

Ay1 = movmin(A(:,2), 25);
Ay1 = Ay1(1:num_points);

Ay2 = movmin(A(:,3), 25);
Ay2 = Ay2(1:num_points);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Bx = B(:,1);
Bx = Bx(1:num_points);

By1 = movmin(B(:,2), 25);
By1 = By1(1:num_points);

By2 = movmin(B(:,3), 25);
By2 = By2(1:num_points);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Cx = C(:,1);
Cx = Cx(1:num_points);

Cy1 = movmin(C(:,2), 25);
Cy1 = Cy1(1:num_points);

Cy2 = movmin(C(:,3), 25);
Cy2 = Cy2(1:num_points);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%hold on;
%plot(Ax, Ay1, 'black');
%plot(Ax, Ay2, 'blue');
%hold off;

%hold on;
%plot(Bx, By1, 'black');
%plot(Bx, By2, 'blue');
%hold off;

hold on;
plot(Cx, Cy1, 'black');
plot(Cx, Cy2, 'blue');
hold off;








