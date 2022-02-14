function y= MetEuler(F,condInit,time,h)

Tsize=time/h;
x = zeros(Tsize, 1);
x(1) = 0;
y = zeros(length(condInit),Tsize);
y(:,1) = condInit;

    for i=1:Tsize-1
        x(i + 1) = x(i) + h;
        y(:,i + 1) = y(:,i) + h*F(x(i),y(:,i));
    end
end