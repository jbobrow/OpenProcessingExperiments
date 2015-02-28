
void setup(){
  size(700,700);
  background(0);
  colorMode(HSB);
  frameRate(50);
}
void draw(){
  noFill();
  stroke(frameCount%(100)+100,255,255);
  curve(700+-1*frameCount, frameCount, 700+-1*frameCount, frameCount, frameCount, frameCount, random(700), random(700));
}
