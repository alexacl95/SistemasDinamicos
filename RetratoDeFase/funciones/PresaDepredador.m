function [dx] = PresaDepredador(t, x)

    %x1: presa
    %x2: depredador
    P = x(1);
    D = x(2);
    
    alpha = 1;
    beta = 1;
    delta = 1;
    gamma = 1;
    
    dx = [alpha * P - beta * P * D;
        delta * P * D - gamma * D];
end