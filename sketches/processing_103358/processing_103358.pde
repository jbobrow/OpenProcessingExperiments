
// Example: Two Car objects
Car myCar1;
Car myCar2;
Car myCar3;// Two objects!

void setup() {
  size(500,150);
  // Parameters go inside the parentheses when the object is constructed.
  myCar1 = new Car(color(255,255,0),0,20,2); 
  myCar2 = new Car(color(0,0,255),500,40,-3);
  myCar3 = new Car(color(0,255,0),500,60,-4);
}

void draw() {
  background(255);
  
  myCar1.drive();
  myCar1.display();
  myCar2.drive();
  myCar2.display();
  myCar3.drive();
  myCar3.display();
  fill(0);
  rect(300,130,200,200);
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
      xpos = 0;}
      if (xpos<0) {
        xpos=500; }
        if (xpos<400&&xpos;>350) {
        xpos=200;}
        if (mousePressed==true) {
          myCar1 = new Car(color(255,0,0),0,20,10); 
  myCar2 = new Car(color(0,0,255),500,40,-20);
  myCar3 = new Car(color(255,255,0),500,60,-30);}     
  }
}
