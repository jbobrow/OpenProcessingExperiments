
Car myCar1;
Car myCar2; 
Car myCar3;// Two objects!
Car myCar4;
Car myCar5;
Car myCar6;
Car myCar7;
Car myCar8;


void setup() {
  size(250,125);
  // Parameters go inside the parentheses when the object is constructed.
  myCar1 = new Car(color(255,0,0),0,100,8); 
  myCar2 = new Car(color(0,0,255),0,87.5,7);
  myCar3 = new Car(color(0,255,0),0,75,6);
  myCar4 = new Car(color(155,20,80),0,62.5,5);
  myCar5 = new Car(color(200,20,25),0,50,4);
  myCar6 = new Car(color(100,150,5),0,37.5,3);
  myCar7 = new Car(color(50,50,155),0,25,2);
  myCar8 = new Car(color(100,100,55),0,12.5,1);
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
  myCar6.drive();
  myCar6.display();
  myCar7.drive();
  myCar7.display();
  myCar8.drive();
  myCar8.display();
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


