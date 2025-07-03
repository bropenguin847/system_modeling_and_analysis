
% -----Task 4-----
% b closed loop

K = 10 ; %Gain controller

num = [2.5 0 9.81];                       % numerator(2.5(s^2)+9.81) 
den = [185.7143 1.3693 1748.9827 5.3729 0];% denominator(185.714(s^4)+1.3693(s^3)+1748.9827(s^2)+5.3729s)
F0S  = tf(num,den);                        % open loop transfer function F(s)
F1 = K*F0S;                                % transfer function F0(s) with Gain

[A,B,C,D]=tf2ss(num,den);