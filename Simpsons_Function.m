%function to display value of a Definite Integral using Simpson's Rule of Integration

function ans = simpsons(f, a, b, n)   % f is the function to be integrated
  h = (b-a)/n;                        % a is lower bound of the integral and b is the upper bound
  x = [a : h : b];                    % n is the even number of divisions in the function
  ans = f(x(1)) + f(x(n));
  for(k=2:n-1)
    if(rem(k,2)==0)
      ans = ans + 4*f(x(k));
    else
      ans = ans + 2*f(x(k));
  endif
endfor
  ans = h/3*ans;
  ans
end


