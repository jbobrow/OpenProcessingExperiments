
import saito.objloader.*;

// declare that we need a OBJModel and we'll be calling it "model"
OBJModel model;
OBJModel tmpmodel;
float rotX=0;
float rotY=-1.51;
float rotZ=0;

void setup()
{
  size(320, 240, P3D);

  // making an object called "model" that is a new instance of OBJModel
  model = new OBJModel(this, "loro-simple.obj");
 // tmpmodel = new OBJModel(this, "loro-simple.obj");

  // turning on the debug output (it's all the stuff that spews out in the black box down the bottom)
  model.enableDebug();

  noStroke();
}

int count = 0;

void draw()
{
  background(128);
  lights();

  pushMatrix();
  translate(width/2, height/2, 0);
  rotateX(rotY);
  rotateY(rotX);
  scale(5);
 rotateZ(rotZ);
  model.draw();
  popMatrix();
  rotZ+=0.05;
//println (rotX + " " +rotY);
}


void mouseDragged()
{
  rotX += (mouseX - pmouseX) * 0.01;
  rotY -= (mouseY - pmouseY) * 0.01;
}



