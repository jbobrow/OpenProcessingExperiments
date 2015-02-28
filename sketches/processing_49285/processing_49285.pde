
int n = 100;
Ball[] ball = new Ball[n];

void setup() {
  size (600, 400);
  smooth();
  for (int i=0; i<ball.length; i++) {
    ball[i] = new Ball();
  }
}

void draw() {
    background (0);
  for (int i=0; i<ball.length; i++) {
    ball[i].move();
    ball[i].display();
  }
}

class Ball {
  float x = random (600);
  float y = random (400);
  float r = random (10, 20);
  color red = color (234, 50, 50);
  color blue = color (12, 101, 240);
  color yellow = color (251, 255, 50);
  int c = int (random (100));
  float speedx;
  float speedy;
  
  Ball () {
  }
  void move() {
    x += speedx;
    y += speedy;
    speedx += random (-0.1, 0.1);
    speedy += random (-0.1, 0.1);
  }
  void display () {
    if (c%3 == 0) fill (red, random(100, 200));
    if (c%3 == 1) fill (blue, random(100, 200));
    if (c%3 == 2) fill (yellow, random(100, 200));
    if (x>700) x -= 700;
    if (x<-100) x += 700;
    if (y>500) y -= 500;
    if (y<-100) y+= 500;
    ellipse (x, y, r*2, r*2);
  }
}

