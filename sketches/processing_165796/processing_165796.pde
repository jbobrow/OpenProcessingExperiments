
Car myCar1;
Car myCar2;
Car myCar3;


void setup() {
  size(600,600);
  myCar1 = new Car(color(255),50,100,random(1,10));
  myCar2 = new Car(color(255),50,200,random(1,10));
  myCar3 = new Car(color(255),50,300,random(1,10));
}

void draw() {
  background(255);
  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();
}

class Car { // Even though there are multiple objects, we still only need one class. No matter how many cookies we make, only one cookie cutter is needed.Isnâ€™t object-oriented programming swell?
  color c;
  float xpos;
  float ypos;
  float xspeed;

  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,20,10);
  }

  void move() {
    xpos = xpos + xspeed;
    if (xpos > width-10 || xpos < 0+10) {
      myCar1.xspeed = myCar1.xspeed * -1;
      myCar2.xspeed = myCar2.xspeed * -1;
      myCar3.xspeed = myCar3.xspeed * -1;
      int R = int(random(0,255));
      int G = int(random(0,255));
      int B = int(random(0,255));
      c = color(R,G,B);
    }
  }
}


