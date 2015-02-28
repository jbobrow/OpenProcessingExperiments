
Car[] cars = new Car[600];

int r, g, b;
int a=0;
float c = 0.0;

void setup() {
  size(400, 405);
  stroke(110);
  smooth();
  frameRate(100);

  for (int i = 0; i < cars.length; i++) {
    cars[i] = new Car(color(i*2), 10, i*5, i/150.0, 100);
  }
}

void draw() {
  background(r, g, b);
  if (mouseX <width/6) { 
    background(255);
  }  
  else if (mouseX <2*width/6) {
    background(#FFF25A);
  } 
  else if (mouseX <3*width/6) {
    background(#21FF00);
  } 
  else if (mouseX <4*width/6) {
    background(#FFAF00);
  } 
  else if (mouseX <5*width/6) {
    background(#00FFF0);
  } 
  else {
    background(#FF1500);
  }
  if (mouseY > height/2) {
    b = b + 1;
  }
  else {
    b = b - 1;
  }
  for (int i = 0; i < cars.length; i++) {
    cars[i].move();
    cars[i].display();
  }
  a = a+1;
  c = c+1;
  line(a, 0, a, height/2);
  line(c, height/2, c, height);
  if (a>width) {
    a=0;
  }
  if (c>width) {
    c=0;
  }
}

class Car {
  color c;
  float xpos;
  float ypos;
  float xspeed;

  Car(color c_, float xpos_, float ypos_, float xspeed_, float yspeed_) {
    c = c_;
    xpos = xpos_;
    ypos = ypos_;
    xspeed = xspeed_;
  }

  void display() {
    rectMode(CENTER);
    stroke(4, 5, 2);
    fill(20, 50, 200);
    rect(xpos, ypos, 20, 10);
  }

  void move() {
    ypos = ypos + xspeed;
    if (ypos > width) {
      ypos = 0;
    }
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}
