
class Slice {
  int x, y;
  int incr;

  Slice ( int tempX, int tempY, int tempIncr) {
    x = tempX;
    y = tempY;
    incr = tempIncr;
  }

  void display() {
    triangle(x, y, x, y+incr, x+incr, y+incr);
    fill(102,random(0,255),204);
    noStroke();
  }
  void upsideDisplay() {
    triangle(x, y, x+incr, y, x+incr, y+incr);
    fill(102,random(0,255),204);
    noStroke();
  }
}


