

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
    rect(xpos,ypos,10,20);
  }
 
  void drive() {
    ypos = ypos + xspeed;
    xpos = xpos + xspeed;
    if (ypos > width) {
      ypos = 0;
    }
    if (xpos > width) {
      xpos = 0;
    }
  }
}
Car bus;
Car taxi;
Car van;
Car racecar;
void setup(){
  size(500,400);
  background(200,10,20);
  bus=new Car(color(20,150,30),100,30.0,10.0);
  taxi=new Car(color(100,120,10),200,100,20);
  van=new Car (color(0,0,200),300,180,5);
  racecar=new Car(250,400,250.0,30.0);
}
void draw(){
  background(150);
  bus.drive();
  bus.display();
  taxi.drive();
  taxi.display();
  van.drive();
  van.display();
  racecar.drive();
  racecar.display();
}
