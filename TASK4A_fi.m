% STATE SPACE EQUATION FOR DISPLACEMENT

% defining value 
m1=2.1;
m2=1.5;
l=2.5;
g=9.81;
B=0.01;
R=2.6;
Kt=0.007;
Ke=0.007;
p=0.02;
r=0.15;

A1 = (m1 + m2)*R*p / (Kt*r);     % Eq. (11)
B1 = B*R*p / (Kt*r) + Ke*r/p;    % Eq. (12)
C1 = m1*l*R*p / (Kt*r);          % Eq. (13)

A_m = [0 1 0 0;
     0 0 1 0;
     0 0 0 1;
     0 -B1*g /(A1*l-C1) -A1*g /(A1*l-C1) -B1*l /(A1*l-C1)
    ];

B_m= [0;
      0;
      0;
      1/(A1*l-C1)];

C_m= [g 0 l 0];

D_m=0;

sys_displacement= ss(A_m ,B_m ,C_m , D_m);

disp('A matrix:'); disp(A_m)
disp('B matrix:'); disp(B_m)
disp('C matrix:'); disp(C_m)
disp('D matrix:'); disp(D_m)
