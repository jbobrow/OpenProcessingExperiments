
class Car {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
 
  // The Constructor is defined with arguments.
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed, float tempYspeed) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
    yspeed = tempYspeed;
  }
 
  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,20,10);
  }
 
  void drive() {
    ypos = ypos - yspeed;
    xpos = xpos - xspeed;
    if (ypos < 0) {
      ypos = 500;
      xpos = 500;
    }
  }
}
Car cool;
Car again;
Car thrice;
Car four;
Car five;
void setup(){
  size(500, 500);
  cool=new Car(255, 250, 6, 5, 5);
  again=new Car(0, 250, 100, 5, 5);
  thrice=new Car(100, 250, 200, 5, 5);
  four=new Car(255, 250, 300, 5, 5);
  five=new Car(0, 250, 400, 5, 5);
}
void draw(){
  background(45,110,233);
  cool.drive();
  cool.display();
  again.drive();
  again.display();
  thrice.drive();
  thrice.display();
  four.drive();
  four.display();
  five.drive();
  five.display();
}

                
                
