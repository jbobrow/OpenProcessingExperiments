
Circle[] circles = new Circle[300];

void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();
  noStroke();

  for (int i = 0 ; i < circles.length;i++) {
    circles[i] = new Circle();
  }
}

void draw() {
  fill(360, 50);
  rect(0, 0, width, height);

  pushMatrix();
  translate(width/2, height/2);
  for (int i = 0 ; i < circles.length;i++) {
    circles[i].move();
    circles[i].display();
  }
  popMatrix();
}

class Circle {
  float rotate_t;
  float r;
  float r_t;
  float hue;

  Circle() {
    rotate_t = random(TWO_PI);
    r = random(80, 150);
    r_t = random(TWO_PI);
    hue = random(360);
  }

  void move() {
    r_t += 0.05;
  }

  void display() {
    pushMatrix();
    translate(r*abs(sin(r_t))*cos(rotate_t), r*abs(sin(r_t))*sin(rotate_t));
    rotate(rotate_t+PI/2);
    fill(hue, 80, 100, 30);
    ellipse(0, 0, 20, 60);  
    popMatrix();
  }
}



