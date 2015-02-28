
//Summer Smith
//July 8, 2013
//project: cars
//reference: http://processing.org/tutorials/objects/ amd DMA

Car myCar1;
Car myCar2; 
Car myCar3;
Car myCar4;
Car myCar5;
Car myCar6;

void setup() {
  size(400,400);
  // Parameters go inside the parentheses when the object is constructed.
  myCar1 = new Car(color(255,255,0),0,100,2); 
  myCar2 = new Car(color(0,255,255),0,10,1);
  myCar3 = new Car(color(238, 66, 90),0,200,-1.75);
  myCar4 = new Car(color(100, 60, 230),0,325,2.5);
  myCar5 = new Car(color(200, 100, 255),0,250,0.75);
  myCar6 = new Car(color(50, 175, 150),0, 50, -2.5);
}

void draw() {
  background(255, 0, 236);
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
  myCar6.drive();
  myCar6.display();
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
    if (xpos > width){ 
      xpos = 0;
    }
    if(xpos < 0) {
      xpos = 400;
    }
  }
}
