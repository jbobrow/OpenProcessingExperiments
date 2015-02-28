
float x=250, y=200,t=240,n=300,u=240,i=300; 
void setup() 
{ 
size(600,500); 
} 
void draw() 
{ 
smooth(); 
background(x); 
float ax=random(-8,8); 
float ay=random(-9,9); 
float tx=random(-5,5); 
float ny=random(-5,5); 
float ux=random(-2,2); 
float iy=random(-1,1); 
x=x+ax; 
y=y+ay; 
t=t+tx; 
n=n+ny; 
u=u+ux; 
i=i+iy; 
if(x<0) { 
x=x+5; 
}; 
if(y<0) { 
y=y+5; 
}; 
if(t<0) { 
t=t+5; 
}; 
if(n<0) { 
n=n+5; 
}; 
if(u<0) { 
u=u+5; 
}; 
if(i<0) { 
i=i+5; 
}; 
if(x>500) { 
x=x-5; 
}; 
if(y>500) { 
y=y-5; 
}; 
if(t>500) { 
t=t-5; 
}; 
if(n>500) { 
n=n-5; 
}; 
if(u>500) { 
u=u-5; 
}; 
if(i>500) { 
i=i-5; 
}; 
line(x,y,t,n); 
line(u,i,t,n); 
ellipse(x,y,ny,ny); 
ellipse(t,n,ax,ax); 
ellipse(u,i,ay,ay); 
}
