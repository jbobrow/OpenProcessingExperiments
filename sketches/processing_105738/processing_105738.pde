
//Lathem Wojno
//Cars: Cars can drive forwards and backwards
//8/6/2013
// http://processing.org/tutorials/objects/
 
// Example: Two Car objects
Car myCar1;
Car myCar2; 
Car myCar3;
Car myCar4;
// Multiple Objects
 
void setup() {
  size(200,200);
  // Parameters go inside the parentheses when the object is constructed.
  myCar1 = new Car(color(255,0,0),0,100,2); 
  myCar2 = new Car(color(0,0,255),0,10,1);
  myCar3 = new Car(color(0,225,0),0,50,7);
  myCar4 = new Car(color(255,0,255),0,140,5);
}
 
void draw() {
  background(255);
  myCar1.drive();
  myCar1.display();
  myCar2.drive();
  myCar2.display();
  myCar3.drive();
  myCar3.display();
  myCar4.driveBack();
  myCar4.display();
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
    rect(xpos,ypos,20,10);
  }
 
  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    } 
  }
  void driveBack() {
    xpos = xpos - xspeed;
    if (xpos < 0) {
      xpos = 200;
    }
     
  }
}
