% temperature calibration

function output = tempcal(x)

A0double = double(x);
A0Volts = A0double*0.00322;
ATemp = A0Volts*(-3.73)+21.3;

plot(ATemp)

end