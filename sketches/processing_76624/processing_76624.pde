
// ISTA 301
// Author: Andrew Fortner
// Assignment #3

color c = color(0);
float x = 0;
float x1 = 200;
float y = 0;
float r = 0;
float g = 0;
float b = 0;
float time = 20;
float l = random(height);
float speed = 1;

void setup() {
  size(400,400);
}

void draw() {
  move();
  display();
}

void move() {
  x = x + speed;
  if (x > width) {
    x = 0;
  }
  x1 = x1 + speed+1;
  if (x1 > width) {
    x1 = 0;
  }
}

void display() {
  noStroke();
  if(x % time == 0) {
//    r = random(255);
//    g = random(255);
//    b = random(255);
    r = random(50)+r;
    g = random(50)+g;
    b = random(50)+b;
    l = random(height);
    background(random(255),random(255),random(255));
  }
  if(r > 255 && g > 255 && b > 255) {
    r = 0;
    b = 0;
    g = 0;
  }
  fill(r,g,b);
  rect(x,x1,10,l);

  fill(r+50,g+50,b+50);
  rect(x+10,x1,10,l);
  
  fill(r-50,g-50,b-50);
  rect(x1,x,10,l);
  
  fill(r,g,b);
  rect(x1+10,x,10,l);
}



