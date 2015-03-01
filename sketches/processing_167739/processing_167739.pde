
import processing.pdf.*;

float x, y;
float angle = 0; 
float r = 400;
float diff = 1; 


void setup() {
  size(1000, 1000);
  background(#8FD3EF);
}

void draw() {

  noFill(); 


  x = r * cos(angle); 
  y = r * sin(angle);

  strokeWeight(0.5); 
  stroke(255); 
 

  translate(width/2, height/2); 
  rotate(r); 
    ellipse(0, 0, x*0.2, y*2);

  strokeWeight(0.2); 
  stroke(255); 
 

  translate(width/2, height/2); 
  rotate(r); 

  
  
  ellipse(0,0, x*2,y*2);
  //ellipse(x, 0, x, 50);
  //line( 0, 0, x, y); 

  angle = angle +10;
  r = r - diff;

  if ( r == 0 || r == 400) { 
    diff =  diff * -1;
  }
}

