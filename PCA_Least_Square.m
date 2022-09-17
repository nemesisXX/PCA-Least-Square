%%
x = 10*rand(100,1)-5;
y = 3*x +4*randn(100,1);
A = [x,y];
A = A-mean(A); % make sure data is symmetric around 0
plot(A(:,1),A(:,2),'.')

% PCA line
% data = USV^t
[U_MATLAB,S_MATLAB,V_MATLAB] = svds(A,1);
t = -25:0.1:25;
PCA = (V_MATLAB*t)';
hold all
plot(PCA(:,1),PCA(:,2),'k-')

%least square question
%Ax = b -> QRx = b
A = [x 0*x+1];
b = y;
[Q,R] = qr(A);
coefs = R\(Q'*b);
line = A*coefs;
plot(x,line,'r-')
legend('Data','PCA','LSQ')

%%
theta = 0:0.01:5*pi;
r = 1.5*theta;
evar = 1;
x = r.*cos(theta) + evar*randn(size(r));
y = r.*sin(theta) + evar*randn(size(r));
z = rand(size(r));
data = [x' z' y'];
data = data - mean(data);
plot3(data(:,1),data(:,2),data(:,3),'b.')

% SVD of matrix A
[U,S,V] = svds(data,2);
t = -30:0.1:30;
PCA = U*S;
hold all;
plot(PCA(:,1),PCA(:,2),PCA(:,3),'k-')


