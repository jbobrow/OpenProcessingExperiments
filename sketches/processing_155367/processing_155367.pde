
import processing.opengl.*;
float y = 0.1;
float x = 3.14/4;
float z = 3.14/4;
void setup()
  {
size(500, 500, P3D);
background(0);
  }
void draw()
  {
    translate(250, 0, -90);
    stroke(0)
    fill(0)
    box(90)
    y+=.01;
    rotateY(y);
    rotateX(x);
    rotateZ(z);
    fill(127);
    stroke(255);
    translate(250, 0, -90);
    box(90);
    
  }
