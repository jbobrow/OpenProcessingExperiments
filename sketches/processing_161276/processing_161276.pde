
Car myCar1;
Car myCar2; // Two objects!
Car myCar3;
car myCar4;

void setup() {
  size(400,200);
  // Parameters go inside the parentheses when the object is constructed.
  myCar1 = new Car(color(255,0,0),0,170,2); 
  myCar2 = new Car(color(100,23,255),1,140,1);
  myCar3 = new Car(color(400,0,280),0,150,2.5);  //  ((color)(0,0,0,)don'tknow,position,speed)
  myCar4 = new Car(color(400,0,280),0,160,2.8);
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
}
