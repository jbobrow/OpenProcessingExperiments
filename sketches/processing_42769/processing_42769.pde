
Car myCar1;
Car myCar2;
Car myCar3;


void setup(){
  size (400,400);
  myCar1 = new Car(color(255,0,0),0,200,2,40);
  myCar2 = new Car(color(0,0,255),0,60,11,60);
  myCar3 = new Car(color(255,255,0),0,300,5,80);
}


void draw(){
  background(255);
  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();



}


class Car {
  color c;
  float x;
  float y;
  float speed;
  float carSize;


  Car(color tempC, float tempX, float tempY,float tempSpeed, float s) {

    c=tempC;
    x=tempX;
    y=tempY;
    speed=tempSpeed;
    carSize=s;
  }


  void display() {
    float offset = carSize/4;
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(x, y, carSize, carSize/2);
    fill(0);
    rect(x-offset, y-offset, offset/1.5, offset/4);
    rect(x+offset, y-offset, offset/1.5, offset/4);
    rect(x-offset, y+offset, offset/1.5, offset/4);
    rect(x+offset, y+offset, offset/1.5, offset/4);
  }

  void move() {
    x=x+speed;
    if (x>=width||x<=0) {
      speed=speed*-1;
    }
  }
}

