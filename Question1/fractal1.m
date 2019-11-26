clc
clear
close all

real_lower   = -200 ;                       %sets axis of graph
real_upper   = -real_lower ;
imag_lower   = -200 ;
imag_upper   = -imag_lower ;
N=400;                                      %sets number of steps through graph (make smaller to speed up but decrease resolution)
delta_real  = (real_upper - real_lower) / N ;       
delta_imag  = (imag_upper - imag_lower) / N ; 


threshold = 1e-4 ;                 %threshold

for k=1:4
    array_values = zeros(N,N) ;         %creates an array of zeros
    
    %all roots follow hardcoded
    if k==1
        Root(1) = -0.5000 - 0.8660*1i;
        Root(2) = 1.0000 + 0.0000*1i;
        Root(3) = -0.5000 + 0.8660*1i;
        Rootct = 3;
    end
    if k==2
        Root(1) = -0.8774 - 0.7449*1i;
        Root(2) = 0.7549 + 0.0000*1i;
        Root(3) = -0.8774 + 0.7449*1i;
        Rootct = 3;
    end
    if k==3
        Root(1) = 0.8895 - 0.0000*1i;
        Root(2) = 0.0000 + 1.9471*1i;
        Root(3) = -0.8895 - 0.0000*1i;
        Root(4) = -0.0000 - 1.9471*1i;
        Rootct = 4;
    end
    if k==4
        Root(1) = -0.5649 - 0.9785*1i;
        Root(2) = 0.1962 - 1.1127*1i;
        Root(3) = 0.1962 + 1.1127*1i;
        Root(4) = -1.0617 - 0.3864*1i;
        Root(5) = -1.0617 + 0.3864*1i;
        Root(6) = -0.5649 + 0.9785*1i;
        Root(7) = 1.1298 + 0.0000*1i;
        Root(8) = 0.8655 + 0.7262*1i;
        Root(9) = 0.8655 - 0.7262*1i;
        Rootct = 9;
    end
    %end of roots storage    
        
        

for ct=1:N                                      %For loop for real values
    real_value(ct) = real_lower + (ct-0.5)*delta_real;  %sets the real value (steps from -200 to +200)
for ctj=1:N                                     %For loop for imaginary values
    image_value(ctj) = imag_lower + (ctj-0.5)*delta_imag;%sets the imaginary value (steps from -200 to +200)
    z_old= (real_value(ct)*1 + image_value(ctj)*1i);    %sets the initial value for z
    f_z_old = my_func(z_old, k);                        %sets initial value for f(z)
    f_deriv_z_old = my_func_deriv(z_old, k) ;           %sets initial value for f'(z)
    its = 0;
    while (abs(f_z_old) > threshold && its < 100)       %while f(z) is bigger than threshold (not near 0) and less than 100 iterations
        
        z_new = z_old - (f_z_old/f_deriv_z_old) ;       %gets a new by subtracting (f(z) / df/df(z)) from the old estimate
        z_old = z_new ;                                 %sets new estimate
        f_z_old = my_func(z_old, k) ;                   %sets f(z)
        f_deriv_z_old = my_func_deriv(z_old, k) ;       %sets df/dz(z)
        its = its+1;                                    %imcrements iterations
   
    end
    
    
    %goes through all roots to find matching one
    for i = 1:Rootct
        if abs(real(z_old)-real(Root(i)))<threshold && abs(imag(z_old)-imag(Root(i)))<threshold    %if root is stored
            array_values(ctj,ct)=i;           %sets array value to root index
        end
    end  
end
end

%creates the graphs
figure(k)
surf(real_value, image_value, array_values) 
view(2)
shading interp

end %end of for 1:4