# Git workflow
To clone code from the cloud to local pc (used only once)
`git clone {link}`
1. Before changing code
`git pull origin`
2. after adding/ changing code and **testing** it
`git add .`
`git commit -am "{descreptive msg of changes}"`
3. to push local changes to the cloud
`git push origin`
and repeat from 1-3


# Sig_Gen
## Checklist

### 1. When the program starts the program asks the user for the following parameters:
1. [ ] Sampling frequency of signal. 
2. [ ] Start and end of time scale 
3. [ ] Number of the break points and their positions (i.e. the points that the signal definition rule changes). Example: The signal is defined from -2:0 as a DC signal and from 0:2 as ramp the user will  enter that the number of break points =1 and the position at t=0. 

### 2. According to the number of break points the program asks the user at each region to enter the specifications of the signal at this region Which are:
1. [ ] DC signal: Amplitude. 
2. [ ] Ramp signal: slope –intercept. 
2. [ ] General order polynomial: Amplitude-power –intercept.
4. [ ] Exponential signal: Amplitude –exponent. 
5. [ ] Sinusoidal signal: Amplitude –frequency –phase.

### 3. Display the resulting signal in time domain.

### 4. the program asks the user if he wants to perform any operation on the signal
1. [ ] Amplitude Scaling:scale value. 
2. [ ] Time  reversal. 
2. [ ] Time  shift: shift value. 
4. [ ] Expanding the signal: expanding value
5. [ ] Compressing the signal: compressing value
6. [ ] None

### 5. Display the new signal in time domain
