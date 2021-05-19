function y= MetEuler(F,condInit,time,h)

Tsize=time/h;
x = linspace(0,time,Tsize);
y = zeros(length(condInit),Tsize);
y(:,1) = condInit;

    for i=1:Tsize-1
        y(:,i+1) = y(:,i) + h*F(x(i),y(:,i));
    end
end