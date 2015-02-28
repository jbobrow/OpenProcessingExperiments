
Car gordon;
void setup(){
  size(500, 500);
  gordon = new Car(color(150),20,10,40);
}

void draw(){
 background(100, 100, 400);
 gordon.drive();
  gordon.display();
  
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
    ypos = ypos + xspeed;
    xpos = xpos + xspeed;
    if (xpos > width) {
     xpos = 0;
    }
     if (ypos > width) {
    ypos = 0;
    }
  }
}               
