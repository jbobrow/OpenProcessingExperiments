
class Linz {
  float x, y;
  float x2, y2;

  Linz() {
    x = random(width);
    y = height+50;
    x2 = random(width);
    y2 = -50;
  }

  void display() {
    strokeWeight(5);
    stroke(255, 50);
    line(x, y, x2, y2);
  }
}


