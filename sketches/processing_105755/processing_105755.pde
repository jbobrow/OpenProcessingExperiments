
Car racecar1;
Car racecar2;
void setup() {
  size(500,200);
  racecar1 = new Car(color(170,0,170),0,150,3);
  racecar2 = new Car(color(0,170,170),500,50,5);
}

void draw() {
  background(255);
  line(10,100,490,100);
  racecar1.drive2();
  racecar1.display();
  racecar2.drive();
  racecar2.display();
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
    rect(xpos,ypos,30,15);
  }
  
  void drive() {
    
    xpos = xpos - xspeed;
    if (xpos<0) {
      xpos = 500;
    }
  }
   void drive2() {
    
    xpos = xpos + xspeed;
    if (xpos>width) {
      xpos = 0;
    }
   }
}
