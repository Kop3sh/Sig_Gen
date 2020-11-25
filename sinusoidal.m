A5 = input('enter the amplitude: ');
B5 = input('enter the frequency: ');
C = input('enter the phase: ');
t=linspace(0,4,1000);
Sins = A5*sin(2*pi*B5*t + C);
figure;
plot(t,Sins)
for i= 1:inf
    a= 'a. scaling\n';
    b= 'b. Time  reversal\n';
    c= 'c. Time  shift\n';
    d= 'd. Expanding the signal\n';
    e= 'e. Compressing the signal\n';
    f= 'f. None\n';
    fprintf(a);
    fprintf(b);
    fprintf(c);
    fprintf(d);
    fprintf(e);
    fprintf(f);
    chr = input('choose your operation: ');
        switch chr
            case a
                n= input('enter scale value: ');
                t= n*t; 
                figure;
                plot(t,Sins)
            case b
                t = -1*t
                figure;
                plot(t,Sins)
            case e 
                break;
    
            otherwise 
                fprintf('error');
        end
end

        
        
                  
       

