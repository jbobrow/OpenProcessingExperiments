
// Example 09-01 + 09-02 + 10-10 + 10-09
// Random Stuff


JitterBug[] bugs = new JitterBug[35];

void setup() {
  size(900, 450);
  smooth();
  for (int i = 0; i < bugs.length; i++) {
    float x = random(width);
    float y = random(height);
    int r = i + 2;
    bugs[i] = new JitterBug(x, y, r);
   }
   }
void draw() {
  for (int i = 0; i < bugs.length; i++) {
  bugs[i].move();
  bugs[i].display();
  }
  }

class JitterBug {
  float x;
  float y;
  int diameter;
  float speed = 7;
  
  JitterBug(float tempX, float tempY, int tempDiameter) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
  }
  
  void move() {
    x += random(-speed, speed);
    y += random(-speed, speed);
  }
  
  void display() {
    ellipse (x, y, mouseX/15, mouseX/15);
    fill (mouseX/2, y/2, x/3);
    noStroke ();
  }
}


