


void setup() {
  start = color(255,255,255);
  size(800,600);
  myCar1 = new Car(start,100,50,random(1,10));
  myCar2 = new Car(start,100,200,random(1,10));
  myCar3 = new Car(start,100,350,random(1,10));
  
}

void draw() {
  r = random(255);
  g = random(255);
  b = random(255);
  background(150);
  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();
  if (myCar1.xpos > width-20 || myCar1.xpos <0 || myCar2.xpos > width-20 || myCar2.xpos <0 || myCar3.xpos > width-20 || myCar3.xpos <0){
    myCar1.xspeed = myCar1.xspeed*-1;
    myCar2.xspeed = myCar2.xspeed*-1;
    myCar3.xspeed = myCar3.xspeed*-1;
  }
  if((myCar1.xpos > width-20) || (myCar1.xpos <0)){
    myCar1.c = color(r,g,b);
  }
  if((myCar2.xpos > width-20) || (myCar2.xpos <0)){
    myCar2.c = color(r,g,b);
  }
  if((myCar3.xpos > width-20) || (myCar3.xpos <0)){
    myCar3.c = color(r,g,b);
  }
}
class Car {
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
    rect(xpos,ypos,20,15);
  }

  void move() {
    xpos = xpos + xspeed;
  }
}


