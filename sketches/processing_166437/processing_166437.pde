
Car myCar1;
Car myCar2; 
Car myCar3;
void setup() {
  size(400,400);
  myCar1 = new Car(color(255, 255, 255),0,150,3.1);
  myCar2 = new Car(color(255, 255, 255),0,100,2);
  myCar3 = new Car(color(255,255,255),0,50,3);
}
void draw() {
  background(150);
  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();
}

  
class Car {
  color c;
  float xpos;
  float ypos;
  float zspeed;
  float xspeed;
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }
void randomC() {
    c = color(random(255), random(255), random(255));
  }
  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,20,10);
  }
  void move() {
    xpos = xpos + xspeed*2;
    if (xpos > width || xpos < 0) {
     xspeed=xspeed*-1;
    }
    else if ( myCar3.xpos > width ||  myCar3.xpos < 0) {
     myCar3.randomC();
     zspeed=zspeed*-2;
    }
    else if (xpos > width || xpos < 0) {
     xspeed=xspeed*-3;
    }
  }
}



