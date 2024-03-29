function vectfieldn(func, y1val, y2val, t)

%vectfieldn  vector field for system of 2 first order ODEs,
%            with arrows normalized to the same length
%   vectfield(func,y1val,y2val) plots the vector field for the system of 
%   two first order ODEs given by func, using the grid of y1val and 
%   y2 values given by the vectors y1val and y2val. func is either a 
%   the name of an inline function of two variables, or a string 
%   with the name of an m-file.
%   By default, t=0 is used in func. A t value can be specified as an
%   additional argument: vectfield(func,y1val,y2val,t)
    
    if nargin==3
      t = 0;
    end
    
    n1 = length(y1val);
    n2 = length(y2val);
    yp1 = zeros(n2,n1);
    yp2 = zeros(n2,n1);
    
    for i = 1 : n1
      
      for j = 1 : n2
        ypv = feval(func, t, [y1val(i); y2val(j)]);
        yp1(j, i) = ypv(1);
        yp2(j, i) = ypv(2);
      end
      
    end
    
    len = sqrt(yp1.^2 + yp2.^2);
    quiver(y1val, y2val, yp1./len, yp2./len, .6, 'k');
    axis tight;
end
