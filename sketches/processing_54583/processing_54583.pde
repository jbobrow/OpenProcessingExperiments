
class Brick {
  float x, y;
  color c;

  Brick(float nx, float ny, color nc) {
    x =nx;
    y = ny;
    c = nc;
  }

  void display() {
    fill(c);
   noStroke();
    rect(x, y, 90, 40);
  }
}


