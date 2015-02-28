
Circle[] circles = new Circle[20];

void setup() {
  size(200, 200);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();

  for (int i = 0 ; i < circles.length;i++) {
    circles[i] = new Circle();
  }
}

void draw() {
  noStroke();
  fill(360, 100);
  rect(0, 0, width, height);

  for (int i = 0 ; i < circles.length;i++) {
    circles[i].move();
    circles[i].display();
  }
}

class Circle {
  Easing easing = new Easing();
  float x = random(width);
  float y = random(height);
  float hue = random(360);

  int r = 20;

  void move() {
    PVector acceleration = easing.ease(x,y);
    x +=acceleration.x;
    y +=acceleration.y;
  }
  void display() {
    stroke(360, 80);
    fill(hue, 100, 100, 100);
    ellipse(x, y, r, r);
  }
}

class Easing{
  float next_x = random(width);
  float next_y = random(height);

  float easing_x = random(0.01, 0.04);
  float easing_y = random(0.01, 0.04);
 
  PVector ease(float x,float y){
    PVector acceleration = new PVector( (next_x - x) * easing_x,(next_y - y) * easing_y);
    if ((int)next_x == (int)x || (int)next_y == (int)y) {
      next_x = random(width);
      next_y = random(height);
    }
    return acceleration;
  }
}

