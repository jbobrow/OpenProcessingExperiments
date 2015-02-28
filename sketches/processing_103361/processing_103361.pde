
Car myCar1;
Car myCar2; // Two objects!
Car myCar3;
Car myCar4;

void setup() {
  size(400,400);
  // Parameters go inside the parentheses when the object is constructed.
  myCar1 = new Car(color(255,0,0),0,100,2); 
  myCar2 = new Car(color(0,0,255),0,10,3);
  myCar3 = new Car(color(0,255,0),0,50,2);
  myCar4 = new Car(color(50,155,155),0,150,-2);
}

void draw() {
  background(255);
  myCar1.drive();
  myCar1.display();
  myCar2.drive();
  myCar2.display();
  myCar3.display();
  myCar3.drive();
  myCar4.drive();
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
    rect(xpos,ypos,30,20);
  }

  void drive() {
    xpos = xpos + xspeed;

    if (xpos > width) {
      xpos = 0;
    }
    
    else if (xpos < 0) 
      xpos = width;
     
  }
}
