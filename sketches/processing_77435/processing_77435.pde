
import saito.objloader.*;

OBJModel model;

void setup() {
  size (500, 500, P3D);
  model = new OBJModel(this);
  model.load("test.obj");
  noStroke();
}

void draw() {
  background(0);
  lights();
  pushMatrix();
  translate(width/2, height/2, -width);
  rotateY(map(mouseX, 0, width, -PI, PI));
  rotateX(map(mouseY, 0, height, PI, -PI));
  scale(20.0);
  model.draw();
  popMatrix();
}


