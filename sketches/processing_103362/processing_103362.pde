
//Amanda Rhee
//July 9, 2013
//Project: Cars
//Reference: http://processing.org/tutorials/objects/ and DMA
Car myCar1;
Car myCar2; 
Car myCar3;
Car myCar4;
Car myCar5;
void setup() {
  size(300,300);
  // Parameters go inside the parentheses when the object is constructed.
  myCar1 = new Car(color(176, 234, 123),0,100,2); 
  myCar2 = new Car(color(255, 0, 159),0,10,1);
  myCar3 = new Car(color(200, 69, 200), 0, 120, -4);
  myCar4 = new Car(color(234, 220, 78), 0, 150, 3);
  myCar5 = new Car(color(64, 198, 241), 0, 230, -1.5);
}

void draw() {
  background(22, 22, 220);
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
    rect(xpos,ypos,20,10);
  }

  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width ) {
      xpos = 0;
    }
    if(xpos < 0) {
      xpos=300;
    }
  }
}
