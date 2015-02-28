
/**
 * Rotate. 
 * 
 * Rotating a square around the Z axis. To get the results
 * you expect, send the rotate function angle parameters that are
 * values between 0 and PI*2 (TWO_PI which is roughly 6.28). If you prefer to 
 * think about angles as degrees (0-360), you can use the radians() 
 * method to convert your values. For example: scale(radians(90))
 * is identical to the statement scale(PI/2). 
 
remixed by mar_b
 */

float angle;
float jitter;

void setup() {
  size(500, 500);
  smooth();
  noFill();
  rectMode(CENTER);
  frameRate(20);
}

void draw() {
  background(255);
    
    jitter = mouseX/100;
  
  //angle = angle + jitter;
  float c = cos(angle);
  for(int i=0; i<width; i++)
  {
  translate(width/2+i*0.3, height/2+i*0.3);
  rotate(c);
  stroke(i,40,i);
  rect(0, 0, 50, 50);   
if (mousePressed)
  {rotate(mouseX);
  translate(mouseY,mouseX);
  }  
}
  
}
 

