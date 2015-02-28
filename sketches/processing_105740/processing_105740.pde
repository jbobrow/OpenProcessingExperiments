
// http://processing.org/tutorials/objects/
 
// Example: Two Car objects
Car myCar1;
Car myCar2; // Two objects!
Car myCar3;
Car myCar4;
Car myCar5;
 
void setup() {
  size(600, 200);
  // Parameters go inside the parentheses when the object is constructed.
  myCar1 = new Car(color(255, 0, 0), 0, 100, 3);
  myCar2 = new Car(color(0, 0, 255), 0, 30, -3);
  myCar3 = new Car(color(40, 250, 40), 0, 50, -3);
  myCar4 = new Car(color(255,255,0),25, 75, 5);
  myCar5 = new Car(color(0), 0, 75, 5);
}
 
void draw() {
  background(255);
  myCar1.drive();
  myCar1.display();
  myCar2.drive();
  myCar2.display();
  myCar3.drive();
  myCar3.display();
  myCar4.drive();
  myCar4.display();
  myCar5.drive();
  myCar5.display();
}
 
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
    rect(xpos, ypos, 20, 10);
  }
 
  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 5;
    
     
    }
    else if (xpos < 0) {
      xpos = width;
    }
    
  }
}
