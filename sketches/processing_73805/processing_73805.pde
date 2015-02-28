
Car myCar1;
Car myCar2; 
Car myCar3;
Car myCar4;
Car myCar5;
Car myCar6;
Car myCar7;
Car myCar8;
Car myCar9;
Car myCar10;
Car myCar11;
Car myCar12;
Car myCar13;
Car myCar14;
Car myCar15;
//  objects!

void setup() {
  size(760,576);
  
  // Parameters 
  myCar1 = new Car(color(225,225,225),0,100,2); 
  myCar2 = new Car(color(225,225,225),0,550,1);
  myCar3 = new Car(color(225,225,225),0,300,1.3);
  myCar4 = new Car(color(209,209,209),0,60,3);
  myCar5 = new Car(color(225,225,225),0,120,0.8);
  myCar6 = new Car(color(225,225,225),0,200,1.5);
  myCar7 = new Car(color(225,225,225),0,500,2.5);
  myCar8 = new Car(color(160,160,160),0,400,4);
  myCar9 = new Car(color(225,225,225),0,20,3.5);
  myCar10 = new Car(color(225,225,225),0,180,0.8);
  myCar11 = new Car(color(225,225,225),0,78,1.5);
  myCar12 = new Car(color(225,225,225),0,370,2.5);
  myCar13 = new Car(color(225,225,225),0,460,4);
  myCar14 = new Car(color(225,225,225),0,230,3.5);
  myCar15 = new Car(color(225,225,225),0,480,0.8);
  
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
  myCar7.drive();
  myCar7.display();
  myCar8.drive();
  myCar8.display();
  myCar9.drive();
  myCar9.display();
}


class Car { 
  color c;
  float xpos;
  float ypos;
  float xspeed;

  //  defined.
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


