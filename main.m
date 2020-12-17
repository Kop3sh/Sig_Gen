sFreq = input('Enter the sampling frequency: ');
startTime = input('Enter the start time: ');
endTime = input('Enter the end time: ');
nPts = input('Enter the number of breakpoints in the signal: ');
nRegions = nPts + 1;
brPts = zeros(1,nPts);
nSamps = sFreq*(endTime-startTime);
signal = zeros(1,nSamps);
t_total = linspace(startTime,endTime,nSamps);


% gets the postitions of each break point
if nPts
    brPts(1) = input('Enter the position of the first breakpoint: ');
    for i = 2:nPts
        brPts(i) = input('Enter the position of the next breakpoint: ');
    end
end

% calculates the time interval of each signal region
for i = 1:nRegions
    if i == 1
        if nPts~=0
            t = linspace(startTime,brPts(i),(brPts(i)-startTime)*sFreq);
        else
            t = t_total;
        end
    elseif i > 1 && i < nRegions
        t = linspace(brPts(i-1),brPts(i),(brPts(i)-brPts(i-1))*sFreq);
    else
        t = linspace(brPts(i-1),endTime,(endTime-brPts(i-1))*sFreq);
    end
    
%   gets the signal type for the current iteration of time interval
    sigNum = input('Enter number of the wanted signal\n 1.DC\n 2.Ramp\n 3.General Order Polynomial\n 4.Exponential\n 5.Sinusoidal\n');
    switch sigNum
        case 1
%           DC
            amp = input('Enter the amplitude: ');
            tempSig = amp*ones(1,length(t));
        case 2
%           Ramp
            slope = input('Enter the slope: ');
            intercept = input('Enter the intercept: ');
            tempSig = slope * t + intercept;
        case 3
%           n degree polynomial
            order = input('Enter order of polynomial: ');
            tempSig = input('Enter the amplitude of the polynomial starting with the lowest order (constant) element: ');
            for n = 1:order
                a = input('Enter the amplitude of the next element: ');
                tempSig = tempSig + a.* ( t.^n );
            end
        case 4
%           exponential
            amp = input('Enter the amplitude: ');
            alpha = input('Enter the exponent: ');
            tempSig = amp*exp(alpha*t);
        case 5
%           sinusoidal
            amp = input('Enter the amplitude: ');
            freq = input('Enter the frequency: ');
            ph = input('Enter the phase in radian: ');
            tempSig = amp*sin(2*pi*freq*t + ph);
    end
    
%   appends the input sig (tempSignal) to the rest of the signal vector
    if i == 1
        signal = tempSig;
    else
        signal = [signal tempSig];
    end
end
length(signal)
length(t_total)
plot(t_total,signal);




   
        