
% -----Task 4-----
% b close loop (payload angle)

K = 1 ; % Gain controller

num = [-1 0];                       % numerator(-s) 
den = [185.7143 1.3693 1747.9827 5.3729];% denominator(185.714(s^3)+1.3693(s^2)+1748.9827s+5.3729)
F0S  = tf(num,den);                        % close loop transfer function F(s)
F1 = K*F0S;                      % transfer function F0(s) with Gain

p = pole(F1);
z = zero(F1);

disp('Poles:');  disp(p);
disp('Zeros:');  disp(z);

%% Basic stability verdict
if all(real(p) < 0)
    fprintf('→ All poles in the open LHP ⟹ stable.\n');
elseif any(real(p) > 0)
    fprintf('→ At least one pole in the RHP ⟹ unstable.\n');
else
    fprintf(['→ No RHP poles but ≥1 pole on the imaginary axis (or at the origin)\n' ...
             '  ⟹ marginally/critically stable.\n']);
end

% Suppose sys is your state-space system
[y, t] = step(F1);

% Get the final value
y_final = y(end);

% For unit step input, desired final value = 1
ess = abs(1-y_final);

fprintf('Steady-state error = %.2f\n',ess);
%% Pole–zero map
figure;
pzmap(F1), grid on
title('Pole–Zero Map of the Trolley‑Displacement Transfer Function')

% denominator(185.714(s^4)+1.3693(s^3)+1751.4827(s^2)+5.3729s+9.81)
%G0feedback=feedback(G2,1); %Create feedback for G2 (make it as close-loop sys)
%step(G0feedback);



%------NOTE-----
%All poles in left-half (Re < 0)                         ✅ Stable
%At least one on the jω axis (Re = 0, no repeated poles) ⚠️ Critically stable / marginal
%Any pole in right-half (Re > 0)                         ❌ Unstable