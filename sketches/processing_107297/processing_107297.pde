
import java.util.Random;
Random generator;
float t = 0;
void setup() {

  size(400, 400);
  generator = new Random();
  background(255);
  strokeWeight(10);
  //noStroke();
  colorMode(HSB);
  frameRate(25);
  noFill();
}

void draw() {

  float h = (float) generator.nextGaussian();
  h = h * 0.05;
  h = h + 255;
 

  
  t = t + 0.01;
  
  float x = noise(t);
  x = map(x,0,1,0,width);
  float y = noise(t);
  y = map(y,0,1,0,255);
  
  
   stroke(y,h,255,1);
   rectMode(CENTER);
  rect(x, height/2, x, x);
  
  
}
