
import processing.opengl.*;
Pyramid[] piramide;


void setup() {
  piramide = new Pyramid[200];
  size(600, 400, OPENGL);
  for (int i=0; i<piramide.length;i++) {
    piramide[i] = new Pyramid(random(width), random(400), random(50), random(20),(random(10)*0.001));
  }
}

void draw() {
  smooth();
  background(1,21,38);
  for (int i=0; i<piramide.length;i++) {
    piramide[i].rotacion();
    piramide[i].display();
  }
}

class Pyramid {
  float x,y,z, t, s;
  float theta=0.0;

  Pyramid(float tempX, float tempY, float tempZ, float tempT, float tempS) {
    x= tempX;
    y= tempY;
    z= tempZ;
    t= tempT;
    s= tempS;
  }

  void display() {
    pushMatrix();

    translate(x, y);

    beginShape(TRIANGLES);//construcción piramide 3 lados
    noStroke();
    fill(2, 89, 89);
    vertex(0, t, 0); //base
    vertex(-t, -t, 0);
    vertex(t, -t, 0);

    // cara1
    fill(2, 115, 83);
    vertex(0, 0, t*1.5); // apice1 
    vertex(0, t, 0);
    vertex(-t, -t, 0);

    // cara2
    fill(3,166,120);
    vertex(0, 0, t*1.5); //apice2 
    vertex(-t, -t, 0);
    vertex(t, -t, 0);

    // cara3
    fill(3,166,150);
    vertex(0, 0, t*1.5); //apice3
    vertex(0, t, 0);
    vertex(t, -t, 0);
    rotateY(theta);



    endShape();

    popMatrix();
  }

  void rotacion() {


    theta+=0.002+s;
  }
}
