
class BackColor {
  float r, g, b;
  
  BackColor() {
  }
  
  void update() {
    r = map(ball.x, 0, 600.0, 0, 255.0);
    g = map(paddle.y, 0, 500.0, 0, 255.0);
    b = map(computer.y, 0, 500.0, 0, 255.0);
  }
  
  void display() {
    noStroke();
    fill(r, g, b);
    rect(0, 0, width, height);
  }
}

