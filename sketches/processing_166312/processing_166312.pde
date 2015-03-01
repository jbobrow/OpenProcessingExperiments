
Car myCar; 
Car myCar2;
Car myCar3;

int direction = 1;
float r;
float g;
float b;

void setup() {
  size(800, 200);
  myCar = new Car(color(255, 0, 0), 0, 100, 1.5); 
  myCar2 = new Car(color(0, 0, 255), 0, 10, 2.5);
  myCar3 = new Car(color(0, 255, 0), 0, 190, 4);
}

void draw() {
  r = random(255);
  g = random(255);
  b = random(255);
  background(255);
  myCar.move();
  myCar.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();
  
  if (myCar.xpos > width-20 ||  myCar2.xpos > width-20 || myCar3.xpos > width-20){
    myCar.xspeed = myCar.xspeed*-1;
    myCar2.xspeed = myCar2.xspeed*-1;
    myCar3.xspeed = myCar3.xspeed*-1;
  }
  if((myCar.xpos > width-20) || (myCar.xpos <0)){
    myCar.c = color(r,g,b);
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
  int r;
  int g;
  int b;

  Car (color tempC, float tempXpos, float tempYpos, float tempXspeed) { // A constructor.
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() { 
    rectMode(CENTER);
    stroke(0);
    if (xpos > width-20){
    r = int(random(255));
    g = int(random(255));
    b = int(random(255));
    }
    fill(c);
    rect(xpos,ypos,20,10);
  }

  void move() { // Function.
    xpos = xpos + xspeed;
    if (xpos > width) {
      xspeed = -xspeed;
      c = (int)random(c);
    } else if (xpos < 0){
      xspeed = -xspeed;
      c = (int)random(c);
  if (myCar.xpos>width-10||myCar.xpos<0+10||
      myCar2.xpos>width||myCar2.xpos<0||
      myCar3.xpos>width||myCar3.xpos<0) {
      }
    }}
}



