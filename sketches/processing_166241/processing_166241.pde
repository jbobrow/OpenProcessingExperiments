
Car car1;
Car car2;
Car car3;

void setup() {
  size(600,600);
  car1 = new Car(color(255) ,50,75, random(1,10));
  car2 = new Car(color(255) ,50,200, random(1,10));
  car3 = new Car(color(255) ,50,300, random(9,10));
}
 
void draw() {
  background(150); 
  car1.display();
  car1.move();
  car2.display();
  car2.move();
  car3.display();
  car3.move();

}


class Car { // Even though there are multiple objects, we still only need one class. No matter how many cookies we make, only one cookie cutter is needed.Isnâ€™t object-oriented programming swell?
  color c;
  float xpos;
  float ypos;
  float xspeed;

  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) { // The Constructor is defined with arguments.
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }
  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,25,15);
  }
   void move() {
    xpos = xpos + xspeed;
    if (xpos > width-10 || xpos < 0+10) {
      car1.xspeed = car1.xspeed * -1;
      car2.xspeed = car2.xspeed * -1;
      car3.xspeed = car3.xspeed * -1;
      int r = int(random(0,255));
      int g = int(random(0,255));
      int b = int(random(0,255));
      c = color(r,g,b);
    }
   }
}
