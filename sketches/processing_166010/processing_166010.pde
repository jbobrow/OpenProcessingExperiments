
Car myCar;
Car myCar2;
Car myCar3;



void setup() {

  size(800, 800);
  myCar = new Car(150, width/2, 40, 20, random(1,5), 255);
  myCar2 = new  Car(150, width/4, 40, 20, random(1,5), 255);
  myCar3 = new  Car(150, width/8, 40, 20, random(1,5), 255);
  
}

void draw() {
  background(50);
  myCar.display();
  myCar.move();
  myCar2.display();
  myCar2.move();
  myCar3.display();
  myCar3.move();
  if (myCar.xpos>width||myCar.xpos<0||myCar2.xpos>width||myCar2.xpos<0||myCar3.xpos>width||myCar3.xpos<0) {
    myCar.dir();
    myCar2.dir();
    myCar3.dir();
  }
}

class Car {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float w;
  float h;
  


  Car(float tempx, float tempy, float tempw, float temph, float tempxspeed, color tempc) {
    c = tempc;
    xpos = tempx;
    ypos = tempy;
    xspeed = tempxspeed;
    w = tempw;
    h = temph;
  }

  void display() {
    rectMode(CENTER);
    fill(c);
    rect(xpos, ypos, w, h);
    if(xpos>width||xpos<0){
    c=color(random(255),random(255),random(255));
    }
  }

  void move() {
    xpos = xpos + xspeed;
  }

  void dir() {
    xspeed=xspeed*-1;
  }
}



