
void setup(){
  size(700,700);
  background(0);
  colorMode(HSB);
  frameRate(50);
}
void draw(){
  noFill();
  stroke(frameCount%(100)+100,255,255);
  line(700+-1*frameCount%(27), frameCount, -1*frameCount, -1*frameCount);
}
