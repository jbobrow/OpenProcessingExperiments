
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
    xpos + xpos + xspeed;
    ypos + ypos + xspeed;
    if (xpos > width) {
      xpos = 0;
      ypos = 0;
    }
  }
}
Car prius;
Car toyota;
Car ford;
void setup(){
  size(500,500);
  prius=new Car(100,100,250,10);
  toyota=new Car(100,130,300,15);
  ford=new Car(100,156,200,5);
}
void draw(){
  background(255);
  prius.drive();
  prius.display();
  toyota.drive();
  toyota.display();
  ford.drive();
  ford.display();
}
