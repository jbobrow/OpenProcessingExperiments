
Triangulos a;
Elipses b;

float[] puntos = new float[10];

void setup() {
  size(464, 650);
  
  background(238, 239, 225);
  smooth();

  a = new Triangulos(48, 60, 56);

  b = new Elipses(width/2);
}

void draw() {

  frameRate(12);
  b.update();
  b.display();  

  a.update();
  a.display();
}

class Elipses {
  int rojo, verde, azul;
  float xpos;
  float radius = 15;

  Elipses (float x) {
    xpos = x;
  }

  void update() {

    if (mouseButton == LEFT) {
      radius += radius+random(-20, 20);
    }

    if ((radius > 70) || (radius < -70)) {
      radius = 0;
    }
  }

  void display() {

    stroke(48, 60, 56);
    fill(int(random(0, 256)), 0, 0);   
    ellipse(mouseX, mouseY, radius, radius);

    for (int i = 1; i < puntos.length; i++) {
      strokeWeight(1);
      stroke(48, 60, 56, 25);
      fill(int(random(0, 256)), 0, 0, int(random(0, 256)));

      ellipse(width/2+random(-250, 250), height/2+random(-350, 350), 5, 5);
    }
  }
}

class Triangulos {

  float radius;
  int rojo, verde, azul;
  float trazo = 1-0.5;

  Triangulos (int ro, int ve, int az) {
    rojo=ro;
    verde=ve;
    azul=az;
  }

  void update() {

    if ((mouseX >= 232) || (mouseX <= -464)) {
      trazo =+ 1;
    }
  }

  void display() {

    noFill();

    strokeWeight(trazo);
    stroke(rojo, verde, azul, 15);

    beginShape();
    vertex(0, 0);
    vertex(width, height);
    vertex(mouseX, mouseY);
    endShape(CLOSE);


    strokeWeight(trazo-0.2);
    stroke(rojo, verde, azul, 15);

    beginShape();
    vertex(width, 0);
    vertex(0, height);
    vertex(mouseX, mouseY);
    endShape(CLOSE);
  }
}
