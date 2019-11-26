function [position] = func(y)   
  
    g=9.8;
    l=0.2;
    position = -g/l*sin(y);

end

