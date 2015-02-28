
JitterBug bug; 

void setup() {
  size(600, 600);
  background (0);
  smooth();
  // Create object and pass in parameters
  bug = new JitterBug(width/2, height/2, 20);
}

void draw() {
  bug.move();
  bug.display();
  fill(0,0,0,5);
  rect(0,0,width, height);
}

class JitterBug {
  float x;
  float y;
  int diameter;
  float speed = 5;
  
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
    noStroke();
    fill(random(255), random(255), random(255), 25); 
    ellipse(x, y, mouseX/4, mouseY/4);
  }
}

