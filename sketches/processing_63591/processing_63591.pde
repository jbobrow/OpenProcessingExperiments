
// Example 10-10 from "Getting Started with Processing" 
// by Reas & Fry. O'Reilly / Make 2010

JitterBug[] bugs = new JitterBug[73];

void setup() {
  size(920,900);
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
  float speed = 2.5;

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
    ellipse(x, y, diameter, diameter);
  } 

}
//===========SaveImage
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); }
  String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
 
//==============
