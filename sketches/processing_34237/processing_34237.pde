
  float x=1; 
  float y=1; 
  float r=sqrt(x*x+y*y); 
  float theta=atan(y/x); 
  int a=100; 
  int b=50; 
  int c=250; 

void setup(){
  size(600, 600); 
  background(0); 
  noStroke(); 
  smooth(); 
}



void draw(){
 
  a=(a+1)%255; 
  b=(b+1)%255; 
  c=(c+1)%255; 
  x++; 
  y++; 
  theta++;  
  r=300*sin(theta/100); 
  translate(width/2, height/2); 
  fill(a, 0, 0); 
  ellipse(r*cos(theta), r*sin(theta), 10, 10); 
 
  }
  //print("y =" + y + " x = " + x + " r = " + r + " theta = " +theta + "\n"); 






