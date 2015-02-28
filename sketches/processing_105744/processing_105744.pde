
//Tia Vu
//"cars"

Car myCar1;
Car myCar2; // Two objects!
Car myCar3;
Car myCar4;//passes myCar3
Car myCar5; 


void setup() {
  size(200, 200);
  // Parameters go inside the parentheses when the object is constructed.
  myCar1 = new Car(color(240, 240, 0), 0, 10, 2); //yellow car
  myCar2 = new Car(color(0, 0, 255), 0, 100, 1); //blue car
  myCar3 = new Car(color(255, 0, 255), 0, 150, 3);//magenta car
  myCar4 = new Car(color(100, 230, 0), 0, 170, 5);//green car
  myCar5 = new Car(color(50, 0, 130), 0, 50, 4); //purple car
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

  //shape of each car
  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos, ypos, 30, 15);
  }

  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}
