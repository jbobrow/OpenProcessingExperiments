
float n = 0.2;
float x = 0;
float z = 0;
float w = 0;
void setup() {
  
  size(500,500);
  background(20);
  smooth();
  noStroke();
}


void draw() {
  translate(250,250);
  
  rotate(n);
 fill(255,0,0);
 ellipse(10+x,10+x,5+z,5+z);
 
 
  
 
 z = z+0.1;
 x=x+1;
 n=n + 0.1;
  
rotate(w);
 fill(255);
 ellipse(10+x,10+x,5+z,5+z);
 
 w=w+0.5;
 
 rotate(w);
 fill(0,0,250);
 ellipse(10+x,10+x,5+z,5+z);
 
 w=w+0.7;
}
 

