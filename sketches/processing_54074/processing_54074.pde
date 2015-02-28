
class Bubbles {
  float x, y; 
  float xMove, yMove;
  float s = random(2,7);

  Bubbles() {
    x = random(width);
    y = random(height);
    yMove = random(2,5);
  }

  void move() {
    y -= yMove;
    x -= xMove;
    xMove = random(-2, 2);
    if (y < -20) {
      y = height + 10;
    }
  }

  void display() {
    stroke(255);
    noFill();
    ellipse(x, y, s, s);
  }
}


