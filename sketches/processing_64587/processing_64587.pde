
import saito.objloader.*;
OBJModel model;
float rotX, rotY;

void setup() {
  size(400,400,P3D);
  model = new OBJModel(this);
  model.load("data/20120624.obj");
  model.scale(40);
  model.translateToCenter();
  model.setDrawMode(POLYGON);  
}

void draw() {
  background(255);
  translate(width/2, height/2);
  rotateX(rotX);
  rotateY(rotY);
  model.draw();
}


void mouseDragged()
{
    rotY += (mouseX - pmouseX) * 0.01;
    rotX -= (mouseY - pmouseY) * 0.01;
}


