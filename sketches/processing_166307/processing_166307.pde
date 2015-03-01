
Car myCar1;
Car myCar2;
Car myCar3;

void setup() {
  size(600,600);
  myCar1 = new Car(100);
  myCar2 = new Car(200);
  myCar3 = new Car(300);
}

void draw() {
  background(100);
  
  myCar1.display();
  myCar1.move();
  myCar2.display();
  myCar2.move();
  myCar3.display();
  myCar3.move();
  
 if (myCar1.xpos > width-20 || myCar1.xpos <0 || myCar2.xpos > width-20 || myCar2.xpos <0 || myCar3.xpos > width-20 || myCar3.xpos <0 ) {
      myCar1.xspeed = myCar1.xspeed*-1;
      myCar2.xspeed = myCar2.xspeed*-1;
      myCar3.xspeed = myCar3.xspeed*-1;
 }
}

class Car { 
  float xpos;
  int y;
  float xspeed;
  int r;
  int g;
  int b;

  Car(int ypos) { 
    y = ypos;
    xpos = 100;
    xspeed = random(4,9);
    r = 255;
    g = 255;
    b = 255;
  }

  void display() {
    if (xpos > width-20 || xpos < 0){
    r = int(random(255));
    g = int(random(255));
    b = int(random(255));
    }
    fill(r,g,b);
    rect(xpos,y,30,15);
  }

  void move() {
    xpos = xpos + xspeed;
  }
}


