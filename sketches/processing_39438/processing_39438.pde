
// Example 10-10 from "Getting Started with Processing" 
// by Reas & Fry. O'Reilly / Make 2010
 
JitterBug[] bugs = new JitterBug[33];
 
void setup() {
  size(500, 500);
  background(255);
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
  float speed = 5.5;
 
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
    smooth();
    colorMode(HSB); 
    for (int i = 0; i < 70; i++) {
      float h = random(400) + (i*6.92); 
      float s = random(315) + (i*1.92); 
      float b = random(315) + (i*1.92) ; 
      fill(h, s, b);
      ellipse(x, y, diameter, diameter);
    } 
  }
}                
                
