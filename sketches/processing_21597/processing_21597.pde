
/**
 * Rotate. 
 * 
 * Rotating a square around the Z axis. To get the results
 * you expect, send the rotate function angle parameters that are
 * values between 0 and PI*2 (TWO_PI which is roughly 6.28). If you prefer to 
 * think about angles as degrees (0-360), you can use the radians() 
 * method to convert your values. For example: scale(radians(90))
 * is identical to the statement scale(PI/2). 
 */

float angle;
float swish;
float a = 0.0;
float s = 0.0;

void setup() {
  size(200, 200);
  smooth();
  noStroke();
  fill(255,0);
  rectMode(CENTER);
  frameRate(random(16));
}

void draw() {
  background(0);

  // during even-numbered seconds (0, 2, 4, 6...)
  if (second() % 2 == 0) {  
    swish = noise(5); /*implemented instead of random for a full twist*/
    
     
  }
  angle = angle + swish;
  float c = cos(angle);
  translate(width/2, height/2);
  rotate(c);
  fill(0,0,255);
  rect(0, 0, 142, 142);   
  
a = a + 0.4;
  s = cos(a)*2;
  
  translate(width/2, height/2);
  scale(s); 
  fill(0,255,0);
  rect(0, 0, 50, 50); 
  
  translate(width/2, height/2);
  fill(255,0,0);
  scale(s);
  rect(0, 0, 50, 50);    
  }
  /*Processing>File>Examples>Basics*/
  
  
  
  /*Processing.org/learning*/
  
 



