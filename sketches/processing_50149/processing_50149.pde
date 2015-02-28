
class BadFish {
  float x, y;
  float s;
  float xMove;

  BadFish() {
    x = random(width+10, width+500);
    y = random(0, height);
    s = random(10, 80);
  }

  void move() {
    x -= xMove;
    xMove = random(1, 3);
    if (x < -50) {
      x = width + 50;
      y = random(height);
    }
  }

  void display() {
    fill(255, 0, 0);
    stroke(0);
    ellipse(x, y, s, s);
  }
}


