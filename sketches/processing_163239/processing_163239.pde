
Ball[] balls;

void setup() {
  size(600, 400);
  initBalls();
  ellipseMode(RADIUS);
  noStroke();
}

void draw() {
  background(0);
  for(int i = 0; i<balls.length; i++) {
    balls[i].move();
    balls[i].display();
  }
  if (keyPressed && key == 'n') {
    initBalls();
  }
}
  
void initBalls() {
  balls = new Ball[100];
  for(int i = 0; i<balls.length; i++) {
    balls[i] = new Ball(width/2, height/2, random(5,50), height);
  }
}
class Ball {
  float x, y, radius;
  int maxHeight;
  color c;
  float dx, dy;

  Ball(float x, float y, float r, int maxHeight) {
    this.x = x;
    this.y = y;
    this.radius = r;
    this.maxHeight = maxHeight;
    this.c = color(random(50, 255), random(50, 255), random(50, 255) );
    this.dx = random(-5, 5);
    this.dy = random(-5, -2);
  }
  
  void move() {
    x += dx;
    if ((y+radius+dy+0.1) > maxHeight) {
      dy = -0.90*dy;
    } else {
      dy += 0.1;
    }
    y += dy;
  }
  
  void display() {
    fill(c);
    ellipse(x, y, radius, radius);
  }
}



