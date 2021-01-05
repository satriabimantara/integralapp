



































function [x,y,length] = data
  A = [0,0.125,0.250,0.375,0.5,0.625,0.750,0.875,1];
  Y = [1,0.888889,0.8,0.7272727,0.666666667,0.61538,0.57143,0.5333333,0.5];
  n = 9; #banyak data
  fprintf("\tDATA YANG DIKETAHUI\n\n");
  fprintf("\tX[i]\tF(X[i])\n");
  for i =1:n
    fprintf("\t%.5f\t%.5f\n",A(i),Y(i));
  endfor
  #return value
  x = A;
  y = Y;
  length = n;
endfunction
