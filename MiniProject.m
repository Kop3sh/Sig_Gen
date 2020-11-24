sFreq = input('Enter the sampling frequency: ');
startTime = input('Enter the start time: ');
endTime = input('Enter the end time: ');
nPts = input('Enter the number of breakpoints in the signal: ');
if nPts
    brPts = zeros([1 nPts]);
    brPts(1) = input('Enter the position of the first breakpoint: ');
    for i = 2:nPts
        brPts(i) = input('Enter the position of the next breakpoint: ');
    end
end
nSamps = sFreq*(endTime-startTime);
nRegions = nPts + 1;
t=linspace(startTime,endTime,nSamps);


function [n,f] = ramp(slope, intercept, interval)
    if slope == 0
        error("slope value cannot be 0 in ramp signal");
    end
    n = interval;
    f = slope * n + intercept;
end

