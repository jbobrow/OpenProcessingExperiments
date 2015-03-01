
Ball[] balls = new Ball[7];

int count = 0;

boolean grow = true;


void setup() {
  size(800, 800);
  background(100);
  smooth();
  count = 0;
  for (int i = 0; i < balls.length; i ++ ) {
    balls[i] = new Ball ();
  }
}
void draw() {
  background(100);
  for (int x=0; x<7; x++) {
    for (int y=0; y<7; y++) {
      if (balls[x].intersect(balls[y])) {
        if (x != y) {
          color c = color(random(255), random(255), random(255));
          balls[x].resetMe(c);
          balls[y].resetMe(c);
          //background(255);
          count ++;
          count ++;
          count ++;
          count ++;
          count ++;
        }
      }
    }
  }
  if (count == 260) {
    count = 0;
  }
  for (int i=0; i<7; i++) {
    if (grow == true) {
      balls[i].sizeIt();
    }
    balls[i].display();
  }
}
void mousePressed() {
  if (grow == true) {
    grow = false;
  } else {
    grow = true;
  }
}
class Ball {
  float r;
  float x, y;
  color c;
  void sizeIt() {
    r+=1;
  }
  void resetMe(color tempC) {
    r = 0;
    x = random(width);
    y = random(height);
    c = tempC;
  }
  void display() {
    noStroke();
    fill(c);
    ellipse(x, y, r*2, r*2);
  }

  boolean intersect(Ball b) {
    float distance = dist(x, y, b.x, b.y);
    if (distance < r + b.r) {
      return true;
    } else {
      return false;
    }
  }
}

