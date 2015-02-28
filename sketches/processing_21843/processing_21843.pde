
/*
original code by Staross ( http://openprocessing.org/portal/?userID=6146 )

dt = 0.004;
Nt = 1000;
E = 350;
Nx = 1000;
dx = E/Nx;

A = zeros(Nx,Nx); // B = zeros(m,n) or B = zeros([m n]) returns an m-by-n matrix of zeros.

%letter as initial cond
A = initLetter;

i = sqrt(-1);

alpha = 4;
D = 0.4;
beta = 6;

%diffusion
H = [0 1  0;
     1 -4 1;
     0 1  0;];   
  
 H = D*H / dx^2;
 
for t=1:Nt
        
    D2A = imfilter(A,H); // B = imfilter(A, H) filters the multidimensional array A 
         with the multidimensional filter H. The array A can be logical or a nonsparse 
         numeric array of any class and dimension. The result B has the same size and class as A.
         Each element of the output B is computed using double-precision floating point. 
         If A is an integer or logical array, then output elements that exceed the range of 
         the integer type are truncated, and fractional values are rounded.
    
    A = A + dt*(A +(1+i*alpha).*D2A - (1-i*beta)*( abs(A).^2 ).*A );
    
end

imagesc(real(A)); // The imagesc function scales image data to the full range of the current 
     colormap and displays the image

*/

