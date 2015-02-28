
//author: Thomas Fuchs-Martin
//no warranties whatsoever...

float magnify = 200;
float time = 0;
float radiusFlow = 0;
float rotationFlow = 0;
float colorFlow = 0;

float rotation = 0;
float radius = 0;
int elements = 256;

void setup() {
  size(800,600);
  frameRate(25);
  rectMode(CENTER);
  colorMode(HSB);
}
 
void draw() {
  background(0);
  setFlows();
  radius = map(radiusFlow, 0, width, 0, 10);
  rotation = map(rotationFlow, 0, height, 0, 10);
  float spacing = TWO_PI/elements ; 
  translate(width*0.5,height*0.5);
  noFill();
  strokeWeight(2);
  for (int i = 0; i < elements;i++) {
      strokeWeight(i/10);
      stroke((i+colorFlow)%255,255,255,i/10);
      pushMatrix();
      rotate(spacing*i*rotation);
      translate(sin(spacing*i*radius)*magnify, 0);
      ellipse(0,0,20,i);
      popMatrix();
  }
}

void setFlows() {
  time += 0.1;
  radiusFlow = sin(time/77)*888;
  rotationFlow = cos(time/88)*777;
  colorFlow = sin(time/111)*255+256;
}




