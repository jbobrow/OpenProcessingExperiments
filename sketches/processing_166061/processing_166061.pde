
Car myCar1;
Car myCar2;
Car myCar3;
 
void setup() {
  size(500,200);
  myCar1 = new Car(color(255),20,50,random(1,6));
  myCar2 = new Car(color(255),20,100,random(1,6));
  myCar3 = new Car(color(255),20,150,random(1,6));
}
 
void draw(){
  background(174);
  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();
  if (myCar1.xpos > width-10 || myCar1.xpos < 0+10 || myCar2.xpos > width-10 || myCar2.xpos < 0+10 || myCar3.xpos > width-10 || myCar3.xpos < 0+10){
    myCar1.xspeed = -myCar1.speed;
    myCar2.xspeed = -myCar2.speed;
    myCar3.xspeed = -myCar3.speed;
}


class Car {// Even though there are multiple objects, we still only need one class. No matter how many cookies we make, only one cookie cutter is needed.Isnâ€™t object-oriented programming swell?
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
    if (x > width-20 || x < 0)
      c = color(random(255),random(255),random(255));
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,20,10);
  }
 
  void move() {
    xpos = xpos + xspeed;
   }
}

