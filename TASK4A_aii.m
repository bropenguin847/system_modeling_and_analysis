
% -----Task 4-----
% open loop (payload angle)

K = 1; %Gain controller

num = [-1 0 0];                       % numerator(-s^2) 
den = [185.7143 1.3693 1748.9827 5.3729 0];% denominator(185.714(s^4)+1.3693(s^3)+1748.9827(s^2)+5.3729s)
F0S  = tf(num,den);                        % open loop transfer function F(s)
F1 = K*F0S;                                % transfer function F0(s) with Gain

[A,B,C,D]=tf2ss(num,den);