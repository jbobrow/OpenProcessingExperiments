
Ball[] ball = new Ball[10];
boolean globalGrow = true;

void setup() {
  size(525, 525);

  for (int i = 0; i < ball.length; i++) {
    ball[i] = new Ball();
  }
}

void draw() {
  background(255);

  for (int i = 0; i < ball.length; i++) {
    ball[i].sizeIt();
    ball[i].display();
    ball[i].move();

    for (int f = 0; f < ball.length; f++) {
      if (ball[i].intersect(ball[f])) {
        if (i != f) {
          color c = color(random(25), random(40), random(90));
          ball[i].resetMe(c);
          ball[f].resetMe(c);
        }
      }
    }
  }
}

void mousePressed() {
  if (globalGrow == true) {
    globalGrow = false;
  } else {
    globalGrow = true;
  }
}

class Ball {
  float r; // radius
  float x, y;
  color c;
  float xspeed, yspeed;

  Ball() {
    resetMe(color(random(25), random(40), random(90)));
  }

  void sizeIt() {
    if (globalGrow == true)
    {
      r+=1;
    }
  }
  void resetMe(color tempC) {
    r = 0;
    x = random(width);
    y = random(height);
    xspeed = random( -5, 5);
    yspeed = random( -5, 5);
    c = tempC;
  }
  void move() {
    x += xspeed;
    y += yspeed; 
    if (x > width || x < 0) {
      xspeed *= - 1;
    }
    if (y > height || y < 0) {
      yspeed *= - 1;
    }
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

