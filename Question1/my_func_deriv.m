function result1 = my_func_deriv(z, input)

switch input
    
    case 1
        result1 = 3*z^2;
    case 2
        result1 = 3*z^2 + 2*z;
    case 3
        result1 = 4*z^3 + 6*z;
    case 4
        result1 = 9*z^8;
end