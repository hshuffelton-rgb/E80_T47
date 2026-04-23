function saltvoltplots = saltplotter(A2, A3, lb, ub)

t = 1:length(A2);
A2volts = double(A2) * 0.00322;
A3volts = double(A3) * 0.00322;

figure(1);
plot(t, A2volts, 'r', t, A3volts, 'b');
ylabel('Volts (V)');
xlabel('Sample Number');
legend


croppedA2 = A2volts(lb:ub);
croppedA3 = A3volts(lb:ub);

avgA2 = mean(croppedA2)
avgA3 = mean(croppedA3)

end

