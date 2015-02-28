
class Cubez {
  float x, y, z;
  float s = 100;
  float ang = 0.0;

  Cubez() {
    x = width/2;
    y = height/2;
  }

  void move() {
    ang += 0.05;
  }

  void mousePressed() {
    if (mousePressed == true) {
      s += 10;
    }
    else {
      s = 100;
    }
  }

  void display() {
    fill(100);
    stroke(0);
    strokeWeight(5);
    translate(width/2, height/2);
    rotateX(PI/3);
    rotateZ(ang);
    box(s);
  }
}


