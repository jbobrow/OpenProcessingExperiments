
// macquarie bank logo
float p,r,P,c,C, 
m,N,n,e,E, 
Ny,ny,Ey,ey, 
nx,Nx,ex,Ex;
                                                    
void setup(){ 
  p=1; 
  P=0; 
  r=1; 
  m=5;  
 
  
  size(400,600); 
  smooth(); 
  noStroke(); 
  noCursor();
} 
 
void draw(){ 
noiseSeed(100);
  n+=0.01;  
  ny+=0.029; 
  nx+=0.0063; 
  N=noise(n)*2; 
  Ny=noise(ny)*2; 
  Nx=noise(nx)*1.7; 
  spiral2(); 
  spiral(); 
   } 
 void spiral(){ 
  P-=r; 
  p+=r; 
  c=9.5*N;
  C=12;
  if(p>=200||p<=0)
  { 
    r=-r; 
  } 
  fill(3,7); 
 rectMode(CORNER); 
rect(0,0,200,200);
ellipseMode(CENTER); 

  fill(#FC2626,150); 
  ellipse(p,100,C,C);  
  ellipse(100,p,C,C); 
  ellipse(P+200,100,C,C); 
  ellipse(100,P+200,C,C); 
  ellipse(p,p,C,C); 
  ellipse(P+200,P+200,C,C); 
  ellipse(p,P+200,C,C); 
  ellipse(P+200,p,C,C); 
 
  fill(#FC2626); 
  ellipse(p,100,c,c);  
  ellipse(100,p,c,c); 
  ellipse(P+200,100,c,c); 
  ellipse(100,P+200,c,c); 
  ellipse(p,p,c,c); 
  ellipse(P+200,P+200,c,c); 
  ellipse(p,P+200,c,c); 
  ellipse(P+200,p,c,c); 
   
  fill(#ffffff); 
  ellipse(p,100,m,m);  
  ellipse(100,p,m,m); 
  ellipse(P+200,100,m,m); 
  ellipse(100,P+200,m,m); 
  ellipse(p,p,m,m); 
  ellipse(P+200,P+200,m,m); 
  ellipse(p,P+200,m,m); 
  ellipse(P+200,p,m,m); 
 
  filter(BLUR);
} 
 
void spiral2(){ 

e=-10*N; 
E=10*N; 
ey=-30*Ny; 
Ey=30*Ny; 
ex=-70*Nx; 
Ex=70*Nx; 
 

  translate(width/2,height/2);
  rotate(p/4);
 ellipse(0,0,2*N,2*N); 
  
   fill(#86FF81); 
  ellipse(E,E,4,4); 
  ellipse(e,e,4,4); 
  ellipse(e,E,4,4); 
  ellipse(E,e,4,4); 
  fill(#E6FFE5); 
  ellipse(E,E,2,2); 
  ellipse(e,e,2,2); 
  ellipse(e,E,2,2); 
  ellipse(E,e,2,2); 
   
  fill(#FFFFFF); 
  ellipse(Ey,Ey,C,C); 
  ellipse(ey,ey,C,C); 
  ellipse(ey,Ey,C,C); 
  ellipse(Ey,ey,C,C); 
  fill(#FFFFFF); 
  ellipse(Ey,Ey,C-7,C-7); 
  ellipse(ey,ey,C-7,C-7); 
  ellipse(ey,Ey,C-7,C-7); 
  ellipse(Ey,ey,C-7,C-7); 
   
  fill(#FFFFFF); 
  ellipse(Ex,Ex,3,3); 
  ellipse(ex,ex,3,3); 
  ellipse(ex*N,Ex*N,3,3); 
  ellipse(Ex*N,ex*N,3,3); 
   

 
} 
 


