
import processing.opengl.*;

float inc = 0.0;

void setup () {

  noStroke ();

  smooth();

size (1000, 600, OPENGL); //OPENGL allows me to play generate 3D objects

}

void draw () {

  background (4,18,70);

  lights();

  inc+=0.1;

  pushMatrix ();

  translate (mouseX, mouseY);

  rotateX(mouseX*0.01);

  rotateY(mouseY*0.01);

  box (100);

  popMatrix();

}

