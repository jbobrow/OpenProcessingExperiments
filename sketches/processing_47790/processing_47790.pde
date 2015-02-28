
Ball myball;

void setup() {
  size(500, 500, P3D);
  myball=new Ball(color(0), 5, 40);
}

void draw() {
  background(0);
  translate(250, 250, -20);
  rotateY(20);
  stroke(255);
  noFill();
  box(250, 250, 250);
 
  myball.move();
  myball.bounce();
  myball.display();
}

class Ball {
  color c;
  float x;
  float y;
  float z;
  float xspeed;
  float yspeed;
  float zspeed;
  float ballSize;
  

  Ball( color tempC, float tempXspeed, float bs) {

    c=tempC;

    xspeed=tempXspeed;

    ballSize=bs;
  }

  void move() {
    x += xspeed;
  }

  void bounce() {
    if ((x >= 125) || (x <= -125)) {
      xspeed=xspeed*-1;
    }
  }

  void display() {

    translate(x, y, z);
    rotateY(0);
    stroke(255);
    fill(c);
    sphere(ballSize);
  }
}


