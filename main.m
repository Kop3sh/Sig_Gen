sFreq = input('Enter the sampling frequency: ');
startTime = input('Enter the start time: ');
endTime = input('Enter the end time: ');
nPts = input('Enter the number of breakpoints in the signal: ');
nRegions = nPts + 1;
nSamps = sFreq*(endTime-startTime);
signal = zeros(1,nSamps);
t_total = linspace(startTime,endTime,nSamps);



% gets the postitions of each break point
if nPts
    brPts = zeros(1,nPts);
%     handles the checking of most recent brPt > prevBrPt
    prevBrPt = startTime;
    i = 1;
    while i <= nPts
%     for i = 1:nPts
        fprintf('Enter the position of the %dth breakpoint: ', i);
        breakPt = input('');
        if (i > 1);  prevBrPt = brPts(i-1); end
        if breakPt >= endTime || breakPt <= prevBrPt
            fprintf('Invalid Breakpoint\nPlease enter a breakpoint between %d and %d\n',prevBrPt, endTime);
        else
            brPts(i) = breakPt;
            i = i + 1;
        end
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
    
%     gets the signal type for the current iteration of time interval
    sigNum = input('Enter number of the wanted signal\n 1.DC\n 2.Ramp\n 3.General Order Polynomial\n 4.Exponential\n 5.Sinusoidal\n');
    switch sigNum
        case 1
%             DC
            amp = input('Enter the amplitude: ');
            tempSig = amp*ones(1,length(t));
        case 2
%             Ramp
            slope = input('Enter the slope: ');
            intercept = input('Enter the intercept: ');
            tempSig = slope * t + intercept;
        case 3
%             n degree polynomial
            order = input('Enter order of polynomial: ');
            tempSig = input('Enter the amplitude of the polynomial starting with the lowest order (constant) element: ');
            for n = 1:order
                a = input('Enter the amplitude of the next element: ');
                tempSig = tempSig + a.* ( t.^n );
            end
        case 4
%             exponential
            amp = input('Enter the amplitude: ');
            alpha = input('Enter the exponent: ');
            tempSig = amp*exp(alpha*t);
        case 5
%             sinusoidal
            amp = input('Enter the amplitude: ');
            freq = input('Enter the frequency: ');
            ph = input('Enter the phase in radian: ');
            tempSig = amp*sin(2*pi*freq*t + ph);
        otherwise
%             error handling must be handled
            fprintf('Invalid signal' );
    end
    
%    appends the input sig (tempSignal) to the rest of the signal vector
    if i == 1
        signal = tempSig;
    else
        signal = [signal tempSig];
    end
end
length(signal)
length(t_total)
figure(1);
plot(t_total,signal);
title('signal before operations');
xlabel('t');
ylabel('x(t)');

% signal opeartions
while 1
    sigOp = input(' 1.amplitude scaling\n 2.time reversal\n 3.time shift\n 4.expansion\n 5.compression\n 6.none\n   Enter number of the wanted signal operation: ');
    switch sigOp
        case 1 
%            amplitude scaling
%             peter
        case 2
%             time reversal
%             peter
        case 3
%             time shift
            shift = input('Enter shift value: ');
            t_total = t_total + shift;
        case 4
%             expansion
        case 5
%             compression
            val = input('Enter downsampling value: ');
            if val > 1
                startVal = t_total(1) / val;
                endVal = t_total(end) / val;
                t_total = linspace(startVal, endVal, nSamps);
            else
                fprint('Please enter a value bigger than 1 for compression operation\n');
            end
        case 6
%            none
            break
        otherwise
            fprintf('Invalid operation\n To finish select none (6)\n' );
    end
end

figure(2);
plot(t_total, signal);
title('signal after operations');
xlabel('t');
ylabel('x(t)');