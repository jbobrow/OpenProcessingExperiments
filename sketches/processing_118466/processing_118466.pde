
Ball ball1;
Ball ball2;
Ball ball3;

void setup() {
  size(500, 500);
  smooth();
  ball1 = new Ball();
  ball2 = new Ball();
  ball3 = new Ball();
}

void draw() {
  background(255);
  ball1.display();
  ball1.grow();
  ball2.display();
  ball2.grow();
  ball3.display();
  ball3.grow();
  if (ball1.intersect(ball2)) {
    color c = color(random(255), random(255), random(255));
    ball1.resetMe();
    ball2.resetMe();
  }
  if (ball2.intersect(ball3)) {
    color c = color(random(255), random(255), random(255));
    ball2.resetMe();
    ball3.resetMe();
  }
  if (ball1.intersect(ball3)) {
    color c = color(random(255), random(255), random(255));
    ball1.resetMe();
    ball3.resetMe();
  }
  if (mousePressed == true) {
    ball1.pause();
    ball2.pause();
    ball3.pause();
  }
}



//an attempt at making the mouse press pause the function which did not work

class Ball {
  float rad;
  float x = random(500);
  float y = random(500);
  float r = 0;
  float g = 0;
  float b = 0;

  Ball() {
  }
  void display() {
    fill(r, g, b);
    ellipse(x, y, rad*2, rad*2);
  }
  void grow() {
    rad = rad + 1;
  }
  boolean intersect(Ball b) {
    float distance = dist(x, y, b.x, b.y);
    if (distance < rad + b.rad) {
      return true;
    } 
    else {
      return false;
    }
  }
  void resetMe() {
    rad = 0;    
    x = random(500);
    y = random(500);
    r = random(255);
    g = random(255);
    b = random(255);
  }
  void pause() {
    rad = rad - 1;
  }
}



