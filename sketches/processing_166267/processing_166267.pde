
Car myCar;
Car myCar2;
Car myCar3;
 
 
 
void setup() {
 
  size(800, 600);
  myCar = new Car(150, width/2, 35, 20, random(2,10), 255);
  myCar2 = new  Car(150, width/4, 35, 20, random(5,10), 255);
  myCar3 = new  Car(150, width/9, 35, 20, random(3,10), 255);
   
}
 
void draw() {
  background(150);
  myCar.display();
  myCar.move();
  myCar2.display();
  myCar2.move();
  myCar3.display();
  myCar3.move();

}
 
class Car {// Even though there are multiple objects, we still only need one class. No matter how many cookies we make, only one cookie cutter is needed.Isnâ€™t object-oriented programming swell?
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float n;
  float d;
   
 
 
  Car(float tempx, float tempy, float tempn, float tempd, float tempxspeed, color tempc) {
    c = tempc;
    xpos = tempx;
    ypos = tempy;
    xspeed = tempxspeed;
    n = tempn;
    d = tempd;
  }
 
  void display() {
    stroke(0);
    rectMode(CENTER);
    fill(c);
    rect(xpos, ypos, n, d);
    if(xpos>width||xpos<0){
    c=color(random(255),random(255),random(255));
    }
  }
 
  void move() {
    xpos = xpos + xspeed;
      if (myCar.xpos>width-10||myCar.xpos<0+10||
      myCar2.xpos>width||myCar2.xpos<0||
      myCar3.xpos>width||myCar3.xpos<0) {
    myCar.dir();
    myCar2.dir();
    myCar3.dir();
  }
  }
 
  void dir() {
    xspeed=xspeed*-1;
  }
}

