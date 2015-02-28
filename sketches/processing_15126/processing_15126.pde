
import processing.opengl.*;

import saito.objloader.*;

OBJModel model;


void setup()
{

  size(600,480,OPENGL);

  model = new OBJModel(this, "tank.obj", "relative", POLYGON);
  model.enableDebug();

  model.scale(100);
  model.translateToCenter();

}


void draw(){
  background(128);
  lights();
  translate(width/2, height/2, 0);
  //rotateX(radians(frameCount)/2);

  rotateY(radians(frameCount)/2);

  model.draw();

  noFill();
  stroke(255,0,255);

  noStroke();
}


