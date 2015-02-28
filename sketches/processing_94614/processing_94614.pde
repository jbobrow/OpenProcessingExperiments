
import java.util.Random;

Random gen;
float xg;
float yg;
float xr;
float yr;
float xn;
float yn;
float counter;

void setup() {
  size(800, 400);
  gen = new Random();
  
  xr = 1 * width/4;
  xg = 2 * width/4;
  xn = 3 * width/4;
  yg = yr = yn = height/2;
  
  counter = 0;
  
  background(0);
}

void draw() {

  //red - random
  for(int i = 0; i < mouseX/10; i++) {
  stroke(255,
         map(abs(xr - 1 * width/4), 0, width/4, 196, 0), 
         map(abs(yr - height/2), 0, height/2, 196, 0), 
         28);
  point(xr, yr);
  
  xr += random(-1, 1);
  yr += random(-1, 1);
  
  if(xr < 0) xr = width;
  if(xr > width) xr = 0;
  if(yr < 0) yr = height;
  if(yr > height) yr = 0;
  
  //green - gaussian
  stroke(map(abs(xg - 2 * width/4), 0, width/4, 196, 0), 
         255,
         map(abs(yg - height/2), 0, height/2, 196, 0), 
         28);
  point(xg, yg);
  
  xg += (float) gen.nextGaussian();
  yg += (float) gen.nextGaussian();
  
  if(xg < 0) xg = width;
  if(xg > width) xg = 0;
  if(yg < 0) yg = height;
  if(yg > height) yg = 0;
  
  //blue - perlin noise
  stroke(map(abs(xn - 3 * width/4), 0, width/4, 196, 0), 
         map(abs(yn - height/2), 0, height/2, 196, 0), 
         255, 28);
  point(xn, yn);
  
  xn += (noise(counter, -counter, frameCount * 0.01) * 2) - 0.9375;
  yn += (noise(frameCount * 0.01, -counter, counter) * 2) - 0.9375;
  counter += 0.008;
  if(xn < 0) xn = width;
  if(xn > width) xn = 0;
  if(yn < 0) yn = height;
  if(yn > height) yn = 0;
  }
}
