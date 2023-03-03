function vectfieldn3(func, y1val, y2val, y3val, t)

%vectfieldn  vector field for system of 2 first order ODEs,
%            with arrows normalized to the same length
%   vectfield(func,y1val,y2val) plots the vector field for the system of 
%   two first order ODEs given by func, using the grid of y1val and 
%   y2 values given by the vectors y1val and y2val. func is either a 
%   the name of an inline function of two variables, or a string 
%   with the name of an m-file.
%   By default, t=0 is used in func. A t value can be specified as an
%   additional argument: vectfield(func,y1val,y2val,t)
    
    if nargin==4
      t = 0;
    end
    
    n1 = length(y1val);
    n2 = length(y2val);
    n3 = length(y3val);
    
    yp1 = zeros(n3, n2, n1);
    yp2 = zeros(n3, n2, n1);
    yp3 = zeros(n3, n2, n1);
    
    for i = 1 : n1
      for j = 1 : n2
          for k = 1 : n3            
            ypv = feval(func, t, [y1val(i); y2val(j); y3val(k)]);
            yp1(k, j, i) = ypv(1);
            yp2(k, j, i) = ypv(2);            
            yp3(k, j, i) = ypv(3);
          end
      end      
    end
    [x,y,z] = meshgrid(y1val, y2val, y3val);
    len = sqrt(yp1.^2 + yp2.^2 + yp3.^2);
    quiver3(x, y, z, yp1./len, yp2./len, yp3./len, .8, 'k');
    axis tight;
    hold on
    xlabel("X_1")
    ylabel("X_2")    
    zlabel("X_3")
end
