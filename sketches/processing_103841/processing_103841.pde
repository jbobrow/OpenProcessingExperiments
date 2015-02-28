
Car myCar1;
Car myCar2;

void setup() {
 size(500, 500);
 myCar1 = new Car(color(255, 100, 0), 0, 100, 2);
 myCar2 = new Car(color(0, 0, 255), 0, 10, 1);
}

void draw() {
 background(255);
 myCar1.move();
 myCar1.display();
 
 myCar2.move();
 myCar2.display(); 
  
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
   rectMode( CENTER);
   rect ( xpos, ypos, 50, 50);
  }
 
  void move() {
   xpos = xpos + xspeed;
   if (xpos > width) {
    xpos = 0; 
   
  } 
  }
}
