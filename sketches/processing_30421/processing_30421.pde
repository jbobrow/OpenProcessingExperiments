
// Even though there are multiple objects, we still only need one class.
// No matter how many cookies we make, only one cookie cutter is needed.
class Car {
  color c;
  float xpos;
  float ypos;
  float xspeed;
 
  // The Constructor is defined with arguments.
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) {
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
  }
}

// Example: Two Car objects
Car myCar3;
Car myCar4; // Two objects!
 
void setup() {
  size(200,200);
  // Parameters go inside the parentheses when the object is constructed.
  myCar3 = new Car(color(255,100,155),155,100,255);
  myCar4 = new Car(color(114,115,255),111,100,115);
}
 
void draw() {
  background(234,238,155);
  myCar3.drive();
  myCar3.display();
  myCar4.drive();
  myCar4.display();
}

