% -----Task 4-----
% b close loop

K = 1 ; % Gain controller

num = [2.5 0 9.81];                      		% numerator(2.5(s^2)+9.81) 
den = [185.7143 1.3693 1751.4827 5.3729 9.81];	% denominator(185.714(s^4)+1.3693(s^3)+1748.9827(s^2)+5.3729s)
F0S  = tf(num,den);                        	% open loop transfer function F(s)
F1 = K*F0S;                      			% transfer function F0(s) with Gain
disp('K = 1');
disp(stepinfo(F1));

[y, t] = step(F1);
% Get the final value
y_final = y(end);
% For unit step input, desired final value = 1
ess = abs(1-y_final);

fprintf('Steady-state error = %.2f\n', ess);	% Display Steady-state error
%------NOTE-----
%All poles in left-half (Re < 0)                         ✅ Stable
%At least one on the jω axis (Re = 0, no repeated poles) ⚠️ Critically stable / marginal
%Any pole in right-half (Re > 0)                         ❌ Unstable