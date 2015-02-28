
// Example 09-01 + 09-02 + 10-10 + 10-09
// Random Stuff


JitterBug bug; // Declare object

void setup() {
  size(900, 450);
  smooth();
  // Create object and pass in parameters
  bug = new JitterBug(width/2, height/2, 15);
}

void draw() {
  bug.move();
  bug.display();
}

class JitterBug {
  float x;
  float y;
  int diameter;
  float speed = .5;
  
  JitterBug(float tempX, float tempY, int tempDiameter) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
  }
  
  void move() {
    x += random(-speed, mouseX/250);
    y += random(-speed, 1);
  }
  
  void display() {
    ellipse(x, y, mouseX/7, mouseX/7);
    fill (mouseX/2, mouseY/2, mouseX/3);
    noStroke ();
  }
}


