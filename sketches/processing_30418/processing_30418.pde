
// Even though there are multiple objects, we still only need one class. 
// No matter how many cookies we make, only one cookie cutter is needed.
class Cars{ 
  color c;
  float xpos;
  float ypos;
  float xspeed;

  // The Constructor is defined with arguments.
  Cars(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,20,10);
  }

  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  if (xpos < -10) {
      xpos = width;
    }
}
}



// Example: Two Car objects
Cars myCar3;
Cars myCar4; // Two objects!
 
void setup() {
  size(900,450);
  // Parameters go inside the parentheses when the object is constructed.
  myCar3 = new Cars(color(255,0,0),0,100,-2);
  myCar4 = new Cars(color(0,0,255),0,10,1);
}
 
void draw() {
  background(255);
  myCar3.drive();
  myCar3.display();
  myCar4.drive();
  myCar4.display();
}

