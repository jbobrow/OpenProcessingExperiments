
import java.util.Random;
Random generator;
float t = 0;
float t2 = 0;
float t3 = 0;
float rot = 0;

void setup() {

  size(600,600);
  generator = new Random();
  background(0);
  strokeWeight(1);
  colorMode(HSB);
  frameRate(60);
  noFill();

}

void draw() {

  float h = (float) generator.nextGaussian();
  h = h * 0.01;
  h = h + 255;
  
  t = t + 0.01;
  t2 = t - 0.01;
  t3 = t + 0.01;
 
  
  float x  = noise(t);
  x = map(x,0,1,0,width);
  float y = noise(t2);
  y = map(y,0,1,0,height);  
  float col = noise(t3);
  col = map(col,0,1,0,255);
  rot = rot + x * h;
  pushMatrix();
  translate(width/2,height/2);
  rotate(radians(45) + x*rot);
  translate(-width/2,-height/2);
  stroke(col,col,255,10);
  //rectMode(CENTER);
  line(x,h,h,x);
  popMatrix();

}
