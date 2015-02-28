
float angle;

class AT {
  float x;
  float y;
  float angle;

  AT() {
  }

  void draw() {
    strokeWeight(2);
    pushMatrix();
    translate(x, y) ;
    line(0, 0, -20, 40);
    line(0, 0, 20, 40);
    line(-10, 20, 10, 20);
    popMatrix();
    pushMatrix();
    translate(x+20,y+20);
    line(-10, 0, 10, 0);
    line(0, -10, 0, 10);
    popMatrix();
    pushMatrix();
    translate(x+40,y+40);
    line(0,0,20,0);
    line(10,0,10,30);
    popMatrix();
  }
  
  void move() {
    x=random(-400,400);
    y=random(-400,400);
}
}

AT at1;
  void mousePressed() {
    background(200);
    angle=angle+0.5;
  }

  void setup() {
    size(400, 400);
    frameRate(25);
    smooth();
    at1 = new AT();
  }

  void draw() {
    rotate(angle);
    at1.move();
    at1.draw();
    angle=+0.5;
  }
