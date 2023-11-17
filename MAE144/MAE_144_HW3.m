close all; clear all;
tdel=6

figure(1)
sys=tf([0.1], [1 0.1])
[n,d]=pade(tdel,2)
padesys=tf(n,d)
bode(tf([0.1],[1 0.1],'InputDelay',tdel))
G=tf([0.1],[1 0.1],'InputDelay',tdel)

figure(2)
sysdel=sys*padesys
rlocus(sysdel)

[Gm,Pm]=margin(sysdel)


%% Question 4a
Ku=3.3;
Omega_u=0.32;
Tu=1/Omega_u
abg=[0.6, 0.5, 0.125]
K=abg.*[Ku,Tu,Tu]
Kp=K(1);
TI=K(2);
TD=K(3);
numK=Kp*TD*[1,1/TD,1/(TI*TD)]
denK=[1 0]
figure(3)
D=tf(numK,denK)
DG=D*G
bode(tf(numK,denK))


omegaI=1/TI
omegaD=1/TD

xline(omegaI,'--')
xline(omegaD,'--')

xline(omegaI,'--')
xline(omegaD,'--')

figure(4)
bode(DG)

xline(omegaI,'--')
xline(omegaD,'--')

figure(5)
margin(DG)

%% Question 6

T=sys*D/(1+(sys*D))

overs=tf([1],[1 0])
Govers=sys*overs
c2d(sys,2,'zoh')
