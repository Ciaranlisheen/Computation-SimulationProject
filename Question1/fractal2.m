clc
clear all
close all

real_lower   = -200 ;                       %sets axis of graph
real_upper   = -real_lower ;
imag_lower   = -200 ;
imag_upper   = -imag_lower ;
N=600;                                      %sets number of steps through graph (make smaller to speed up but decrease resolution)
delta_real  = (real_upper - real_lower) / N ;       
delta_imag  = (imag_upper - imag_lower) / N ; 
array_values = zeros(N,N) ;         %creates an array of zeros

threshold = 1e-12 ;                 %threshold

for k=1:4                           %just to run it four times with four functions
    rootsct=0;                      %roots counter (how many roots are found
    roots=0;                        %roots variable used to store roots

for ct=1:N                                      %For loop for real values
    real_value(ct) = real_lower + (ct-0.5)*delta_real;  %sets the real value (steps from -200 to +200)
for ctj=1:N                                     %For loop for imaginary values
    image_value(ctj) = imag_lower + (ctj-0.5)*delta_imag;%sets the imaginary value (steps from -200 to +200)
    z_old= (real_value(ct)*1 + image_value(ctj)*1i);    %sets the initial value for z
    f_z_old = my_func(z_old, k);                        %sets initial value for f(z)
    f_deriv_z_old = my_func_deriv(z_old, k) ;           %sets initial value for f'(z)
    its = 0;                   %iterations variable
    while (abs(f_z_old) > threshold && its < 100)       %while f(z) is bigger than threshold (not near 0) and less than 100 iterations (as not all values will go to a root)
        
        z_new = z_old - (f_z_old/f_deriv_z_old) ;       %gets a new by subtracting (f(z) / f'(z)) from the old estimate
        z_old = z_new ;                                 %sets new estimate
        f_z_old = my_func(z_old, k) ;                   %sets f(z)
        f_deriv_z_old = my_func_deriv(z_old, k) ;       %sets f'(z)
        its = its+1;                                    %imcrements iterations
   
    end
    
    
    %setting the array to the root found follows
    if its ~= 100                               %if a root was found
        if rootsct==0                           %sets initial root
            roots(1)= real(z_old) + imag(z_old)*1i;
            rootsct = 1;                        %roots counter
            array_values(ctj,ct)=1;             %initial root value
            fprintf('Function %d Root %d is equal to %0.4f%+0.4fj \n', k, rootsct, real(z_old), imag(z_old));
        end
    
                       
        test = 0;                   %Boolean to say if root was already stored
        for i=1:rootsct             %goes through array of stored roots and sets its array value accordingly
            if abs(real(z_old)-real(roots(i)))<threshold*2 && abs(imag(z_old)-imag(roots(i)))<threshold*2 %threshold*2 incase the root first stored was root-threshold and this root is root+threshold
            array_values(ctj,ct)=i; %sets array value to corresponding root value
            test = 1;               %sets root Boolean true (root was found)
            end
        end
    
        if test == 0              %if root was not already stored it saves it as a new possible root
            roots(i+1) = real(z_old) + imag(z_old)*1i;  %creates new root in roots array
            array_values(ctj,ct)=i;                     %sets array value to root value
            rootsct = rootsct+1;                        %increments root counter
            fprintf('Function %d Root %d is equal to %0.4f%+0.4fj \n', k, rootsct, real(z_old), imag(z_old));  %prints the root 
        end
    end  
end
end

%creates the graphs
figure(k)
surf(real_value, image_value, array_values) 
view(2) 
shading interp
end     %end of for 1:4
