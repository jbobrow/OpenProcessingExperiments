
float x,y,xz,yz,n,N,r,g,b,R,G,B; 
void setup(){ 
  n=0; 
  r=250; 
  g=180; 
  b=20; 
  R=0; 
  G=180; 
  B=255; 
  size(100,100); 
  background(0); 
  smooth(); 
} 
void draw(){ 
  background(0); 
  circles();  

} 
void circles(){ 
  n+=0.029; 
  N=noise(n); 
 
  x=mouseX; 
  y=mouseY; 
  xz=-mouseX; 
  yz=-mouseY; 

  rectMode(CENTER);  
  strokeWeight(5); 
  stroke(#FFFFFF); 
  fill(R,G,B,20*(N*19)); 
  ellipse(x,y,20*(N*3),20*(N*3));  
  ellipse(xz+width,y,20*(N*3),20*(N*3)); 
  ellipse(xz+width,yz+height,20*(N*3),20*(N*3)); 
  ellipse(x,yz+height,20*(N*3),20*(N*3)); 
  ellipse(width/2,y,20*(N*3),20*(N*3)); 
  ellipse(x,height/2,20*(N*3),20*(N*3)); 
  ellipse(xz+width,height/2,20*(N*3),20*(N*3)); 
  ellipse(width/2,yz+height,20*(N*3),20*(N*3)); 
 
  fill(r-29,g-29,b-29); 
  ellipse(x,y,3,3);  
  ellipse(xz+width,y,3,3); 
  ellipse(xz+width,yz+height,4,4); 
  ellipse(x,yz+height,4,4); 
  ellipse(width/2,y,4,4); 
  ellipse(x,height/2,4,4); 
  ellipse(xz+width,height/2,4,4); 
  ellipse(width/2,yz+height,4,4); 
} 
 


