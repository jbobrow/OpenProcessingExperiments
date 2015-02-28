
Car myCar1;
Car myCar2; 
Car myCar3;
Car myCar4;
Car myCar5;
Car myCar6;


void setup() {
  size(300,300);
  // Parameters go inside the parentheses when the object is constructed.
  myCar1 = new Car(color(255,0,0),0,100,2); 
  myCar2 = new Car(color(0,0,255),0,10,1);
  myCar3 = new Car(color(32,214,30),0,150,3);
  myCar4 = new Car(color(170,17,237),0,200,.5);
  myCar5 = new Car(color(255),0,250,4);
  myCar6 = new Car(color(255,124,0),0,280,2);
 }

void draw() {
  background(0);
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
    if (xpos > width) {
      xpos = 0;
    }
  }
}




