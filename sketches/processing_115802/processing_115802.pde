
Car myCar1;
Car myCar2;
Car myCar3;

void setup() {
  size(500,500);
  myCar1=new Car(color(255),random(0,100),100,random(1,8));
  myCar2=new Car(color(255),random(0,100),200,random(1,8));
  myCar3=new Car(color(255),random(0,100),300,random(1,8));
}

void draw() {
  background(255);
  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();
  
  if ((myCar1.xpos > width) || (myCar1.xpos <0)) {
    myCar1.cD();
    myCar2.cD();
    myCar3.cD();

  } else if ((myCar2.xpos > width) || (myCar2.xpos <0)) {
    myCar1.cD();
    myCar2.cD();
    myCar3.cD();

  } else if ((myCar3.xpos > width) || (myCar3.xpos <0)) {
    myCar1.cD();
    myCar2.cD();
    myCar3.cD();
  }
  
    if ((myCar1.xpos > width) || (myCar1.xpos <0)) {
    myCar1.cS();
    myCar2.cS();
    myCar3.cS();

  } else if ((myCar2.xpos > width) || (myCar2.xpos <0)) {
    myCar1.cS();
    myCar2.cS();
    myCar3.cS();

  } else if ((myCar3.xpos > width) || (myCar3.xpos <0)) {
    myCar1.cS();
    myCar2.cS();
    myCar3.cS();
  }
  
}



    
class Car {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) {
    c=tempC;
    xpos=tempXpos;
    ypos=tempYpos;
    xspeed=tempXspeed;
  }
  
  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,20,10);
  }
  void move() {
    xpos=xpos+xspeed;
    if ((xpos>width) || (xpos<0)) {
      c = color(random(100,245),random(100,245),random(100,245));
    }
  }
  void cD() {     // to change direction
  xspeed=-xspeed;
}
   void cS() {
     xspeed=xspeed+.5/xspeed;
}
}


