
% -----Task 4E-----
% a open loop

K = 0.0013 ; %Gain controller

num = [2.5 0 9.81];                       % numerator(2.5(s^2)+9.81) 
den = [185.7143 1.3693 1748.9827 5.3729 0];% denominator(185.714(s^4)+1.3693(s^3)+1748.9827(s^2)+5.3729s)
F0S  = tf(num,den);                        % open loop transfer function F(s)
F1 = K*F0S;                                % transfer function F0(s) with Gain

figure;
rlocus(F0S);
sgrid(0.5912, []); % Add damping ratio line for zeta = 0.5912
title('Root Locus with \zeta = 0.5912 (PO < 10%)');

%------NOTE-----
%All poles in left-half (Re < 0)                         ✅ Stable
%At least one on the jω axis (Re = 0, no repeated poles) ⚠️ Critically stable / marginal
%Any pole in right-half (Re > 0)                         ❌ Unstable