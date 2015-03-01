
Polygone P1;
Polygone P2;
Polygone P3;

void setup() {
  size(800, 800);
  background(255);
  //noLoop();
  P1 = new Polygone(6);
  P2 = new Polygone(3);
  P3 = new Polygone(9);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  P1.display();
  P2.display();
  P3.display();
}

void mousePressed() {
  redraw();
}

class Polygone {
  int npoints;
  float r = 0;
  float rr = random(255);
  float vv = random(255);
  float bb = random(255);

  Polygone(int npoints_) {
    npoints = npoints_;
  }

  void display() {
    //fill(random(255), random(255), random(255), random(255));
    rotate(r);
    float angle = TWO_PI / npoints;
    float demiAngle = angle / 2.0;
    beginShape();
    for (float i = 0; i < TWO_PI; i += angle) {

      float a = cos(i) * width/2;
      float b = sin(i) * height/2;
      vertex (a, b);
      println("a : " + a);
      println("b : " + b);
      fill(rr, vv, bb, 127);
      //noFill();

      r = r + random(0.005);
      //ellipse(0, 0, 300, 300);
    }
    endShape(CLOSE);
  }
}
