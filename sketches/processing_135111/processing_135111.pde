
import peasy.*;

PeasyCam cam;
float rotx;
float rotz= PI/2;

float inc = .05;
void setup() {
  size(180,180,P3D);
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
}
void draw() {
rotateX(rotx+radians(-mouseY));
rotateZ(rotz+radians(mouseX));
  background(0);
  fill(255,0,0);
  sphere(30);
  


}


