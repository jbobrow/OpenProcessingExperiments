
// http://processing.org/tutorials/objects/
//Connor Novak
//Driving Cars
//2013/8/5
 
// Example: Two Car objects
Car myCar1;
Car myCar2; // Two objects!
Car myCar3;
 
void setup() {
  size(200,200);
  // Parameters go inside the parentheses when the object is constructed.
  myCar1 = new Car(color(255,0,0),0,100,2,1); 
  myCar2 = new Car(color(0,0,255),0,10,1,1);
  myCar3 = new Car(color(255,255,0),10,150,3,-1);
}
 
void draw() {
  background(255);
  myCar1.drive();
  myCar1.display();
  myCar2.drive();
  myCar2.display();
  myCar3.drive();
  myCar3.display();
}
 
// Even though there are multiple objects, we still only need one class. 
// No matter how many cookies we make, only one cookie cutter is needed.
class Car { 
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float direction;
 
  // The Constructor is defined with arguments.
  Car(color tempC, float tempXpos, float tempYpos, float tempxspeed, int tempdirection) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempxspeed;
    direction = tempdirection;
  }
 
  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,20,10);
  }
 
  void drive() {
    if (direction > 0) {
    xpos = xpos + xspeed;
    if (xpos > width + 10) {
      xpos = -10;
      }
    }
    else {
      xpos = xpos - xspeed;
      if (xpos < -10) {
        xpos = width + 10;
      }
  }
}
}
