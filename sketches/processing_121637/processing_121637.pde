


JitterBug[] bugs = new JitterBug[300];
 
void setup() {
  size(800, 600);
  smooth();
  for (int i = 0; i < bugs.length; i++) {
    float x = random(width);
    float y = random(height);
    int radius = (int)random(5,50);
    color col = color((int)random(255),(int)random(255),(int)random(255),(int)random(100,255));
    bugs[i] = new JitterBug(x, y, radius, col);
  }
}
 
void draw() {
  background(255);
  for (int i = 0; i < bugs.length; i++) {
    bugs[i].move();
    bugs[i].display();
  }
}

class JitterBug {
 
  float x;
  float y;
  color c;
  int diameter;
  float speed = 5;
 
  JitterBug(float tempX, float tempY, int tempDiameter, color c1) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
    c = c1;
  }
 
  void move() {
    x += random(-speed, speed);
    y += random(-speed, speed);
  }
 
  void display() {
    fill(c);
    ellipse(x, y, diameter, diameter);
  }
 
}

