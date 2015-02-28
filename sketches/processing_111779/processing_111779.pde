
import processing.pdf.*;

float x, y;
float angle = 0; 
float r = 400;
float diff = 1; 

color c = color(0, 0, 255);


void setup() {
  size(600, 600);
  background(0);
}

void draw() {

  fill(c); 
  
    
  x = r * cos(angle); 
  y = r * sin(angle);


  strokeWeight(0.1); 
  stroke(c); 

  translate(width/2, height/2); 
  rotate(r); 

  
  noStroke();
  fill(145, 230, 78, 50);
  ellipse(x, 0, x, 50);
  
  noStroke();
  fill(255, 230, 78, 50);
  rect(50, y , 50, y);
  
  noStroke();
  fill(200, 17, 97, 50);
  rect(20, y , 20, 50);
  
  
  
  strokeWeight(2);
  stroke(0, 100);
  noFill();
  ellipse(x, 30, 30, 30);



  angle = angle +0.5;
  r = r - diff;

  if ( r == 0 || r == 400) { 
    diff =  diff * -1;
  }
}
