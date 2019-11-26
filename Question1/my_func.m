function result = my_func(z, input)

switch input
    
    case 1
        result = z^3 - 1;
    case 2
        result = z^3 + z^2 - 1;
    case 3
        result = z^4 + 3*z^2 - 3;
    case 4
        result = z^9 - 3;
end
