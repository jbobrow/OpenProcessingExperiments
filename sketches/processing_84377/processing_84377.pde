
ArrayList<Ball> balls;

void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  
  balls = new ArrayList<Ball>();
}

void draw() {
  background(0);
  
  for (Ball ball : balls) {
    ball.update();
    ball.draw();
  }
}

void mousePressed() {
  Ball ball = new Ball(mouseX, mouseY);
  balls.add(ball);
}
class Ball {

  private float x, y;
  private float vx, vy;
  private float size;
  private color col;

  Ball(float x, float y) {
    this.x = x;
    this.y = y;
    
    vx = random(-12, 12);
    vy = random(-12, 12);
    size = random(16, 32);
    col = color(random(360), 100, 100);
  }

  void update() {
    x += vx;
    y += vy;

    if (x < size/2 || width-size/2 <= x)
      vx = -vx;
    if (y < size/2 || height-size/2 <= y)
      vy = -vy;
  }

  void draw() {
    fill(col);
    ellipse(x, y, size, size);
  }
}


