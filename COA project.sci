clc;
clear;

// Days
days = 1:30;

// Simulated workload (1–10)
workload = grand(1,30,"uin",3,10);

// Rest hours per day
rest = grand(1,30,"uin",2,9);

// Stress array
stress = zeros(1,30);
stress(1) = 30;

// Model factors
work_factor = 6;
rest_factor = 5;

for i = 2:30
    stress(i) = stress(i-1) + workload(i)*work_factor - rest(i)*rest_factor;
    
    // Bound limits
    stress(i) = min(stress(i),100);
    stress(i) = max(stress(i),0);
end

// High stress detection
high_stress_days = find(stress > 70);

// Graphs
figure(1);
plot(days, workload);
title("Daily Workload");

figure(2);
plot(days, rest);
title("Daily Rest Hours");

figure(3);
plot(days, stress);
title("Stress Level Curve");

// Display results
disp("High Stress Days:");
disp(high_stress_days);
