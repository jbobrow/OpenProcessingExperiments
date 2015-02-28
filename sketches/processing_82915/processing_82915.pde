
import processing.pdf.*;

Cuad h, i, j, k, l, m;


void setup() {

  size(536, 750);
  background(255);
  beginRecord(PDF, "everything.pdf");

  h = new Cuad (0, 0, 30, 255, 0);
  i = new Cuad (40, 50, 0, 255, 0);
  j = new Cuad (200, 200, 0, 0, 255);
  k = new Cuad (0, 0, 200, 0, 100);
  l = new Cuad (0, 0, 0, 100, 100);
  m = new Cuad (20, 20, 255, 0, 0);
}

void draw() {
  frameRate(100);
  h.update();
  h.display();

  frameRate(50);
  i.update();
  i.display();

  frameRate(20);
  j.update();
  j.display();

  frameRate(100);
  k.update();
  k.display();

  frameRate(50);
  l.update();
  l.display();

  frameRate(20);
  m.update();
  m.display();
}

//Clase


class Cuad {
  float xpos;
  float ypos;
  float xoff;
  float c1;
  float c2;
  float c3;
  float rota;

  Cuad (float x, float y, int ca, int cb, int cd) {
    xpos = x;
    ypos = y;
    c1 = ca;
    c2 = cb;
    c3 = cd;
  }


  void update() {
    xpos = xpos+15;
    ypos = ypos+7;
    rota = rota+0.1;

    if (ypos > height) {
      ypos*= -1;
      xpos*=-1;
    }
  }

  void display() {
    pushMatrix();
    translate (width/2, height/2);
    scale(0.2);
    rotate (rota);
    stroke(c1, c2, c3);
    fill(255, 0, 30);
    beginShape();
    vertex(3+xpos, 1+ypos);
    vertex(60+xpos, 20+ypos);
    vertex(10+xpos, 50+ypos);
    vertex(180+xpos, 610+ypos);
    endShape(CLOSE);
    popMatrix();
  }
}
void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}
