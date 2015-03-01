
Car myCar1;
Car myCar2; // Two objects!
Car myCar3;
void setup() {
  size(400,400);
  myCar1 = new Car(color(255,255,255),0,150,1.2);
  myCar2 = new Car(color(0,0,255),0,100,2);
  myCar3 = new Car(color(255,255,255),0,50,1.7);
}
void draw() {
  background(100);
  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();
}
class Car {
  color col;
  float xpos;
  float ypos;
  float zspeed;
  float xspeed;
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    col = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }
void randomCol() {
    col = color(random(255), random(255), random(255));
  }
  void display() {
    stroke(0);
    fill(col);
    rectMode(CENTER);
    rect(xpos,ypos,20,10);
  }
  void move() {
    xpos = xpos + xspeed*2;
    if (xpos > width || xpos < 0) {
     xspeed=xspeed*-1;
    }
    else if ( myCar2.xpos > width ||  myCar2.xpos < 0) {
     myCar2.randomCol();
     zspeed=zspeed*-1.5;
    }
    else if (xpos > width || xpos < 0) {
     xspeed=xspeed*-3;
    }
  }
}




