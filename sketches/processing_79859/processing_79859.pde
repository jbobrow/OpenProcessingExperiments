
void setup() {
  size(600,600);
  smooth();
  background(0);
  mouseX=width/2;
  mouseY=height/2;
  frameRate(50);
}
void draw() {
  float r = random(255);
  fill( random (256), random (256), random (256));
  ellipse(mouseX,mouseY,r,r);
}


