
import processing.opengl.*;
float ang = 0.0;
Pyramid[] pyramids = new Pyramid[100];


void setup()
{
  size(800, 600, OPENGL);
  for (int i = 0; i < pyramids.length; i++) {
    pyramids[i] = new Pyramid(random(-2000, 2000), 0, random(-2000, 2000), random(3,20));
  }
}

void draw()
{
  background(150,150,250);
  translate(width/2, height/2, -200);
  rotateX(-PI/8);
  rotateY(ang);  
  ang+= .01;
  fill(100, 110, 10);
  box(10000, 2, 10000);
  directionalLight(200, 126, 126, 0, 0, -1);
  ambientLight(200, 180, 20);
  for (int i = 0; i < pyramids.length; i++) {
    pyramids[i].display();
  }
}


class Pyramid {

  float x, y, z;
  float size;

  Pyramid(float x, float y, float z, float size) {
    this.x = x;
    this.y = y; 
    this.z = z;
    this.size = size;
  }

  void display() {
    pushMatrix();
    translate(x, y, z);
    scale(size);
    beginShape(TRIANGLE_FAN);
    vertex(0, -20, 0);
    vertex(-10, 0, -10);
    vertex(10,  0, -10);
    vertex(10,  0, 10);
    vertex(-10, 0, 10);
    vertex(-10, 0, -10);
    endShape();
    popMatrix();
  }
}



