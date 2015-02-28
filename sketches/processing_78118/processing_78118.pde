
import peasy.*;

PeasyCam cam;

void setup() {
  size(400,400,P3D);
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
}
void draw() {
  rotateX(-.5);
  rotateY(-.5);
  background(255);
  noFill();
  box(30);
  pushMatrix();
  fill(0);
  popMatrix();
}



