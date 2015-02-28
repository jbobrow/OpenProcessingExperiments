
// http://processing.org/tutorials/objects/

Car myCar1;
Car myCar2; 
Car myCar3;
Car myCar4;

void setup() {
  size(200,200);
  
  myCar1 = new Car(color(255,0,0),0,100,2); 
  myCar2 = new Car(color(0,0,255),0,10,1);
  myCar3 = new Car(color(50, 50, 50), 0, 45, 3);
  myCar4 = new Car(color(115, 75, 30), 75, 115, 1.5);
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

class Car { 
  color c;
  float xpos;
  float ypos;
  float xspeed;

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
