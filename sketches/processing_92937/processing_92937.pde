
// Krystofer Dongjae Kim
// Creative Computing
//March 13 

Obj myObj1;
Obj myObj2;
Obj myObj3;
Obj myObj4;
Obj myObj5;


void setup() {
  size(800, 400);
  background(255,255,255);
  myObj1 = new Obj(color(random(255)), 0, 300, 1); 
  myObj2 = new Obj(color(random(255)), width, 10, 2);
  myObj3 = new Obj(color(random(255)), width/2, 180, 3);
  myObj4 = new Obj(color(random(255)), width-10, 70, 4);
  myObj5 = new Obj(color(random(255)), 0, 370, 5);
}

void draw() {
  myObj1.move();
  myObj1.display();
  myObj2.move();
  myObj2.display();
  myObj3.move();
  myObj3.display();
  myObj4.move();
  myObj4.display();
  myObj5.move();
  myObj5.display();
}

class Obj { 
  color fill;
  float xpos;
  float ypos;
  float xspeed;

  Obj(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    fill = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {
    noStroke();
    fill(fill);
    rectMode(CENTER);
    rect(xpos, ypos, 10, 500);
  }

  void move() {
    xpos = xpos + xspeed;
    if (xpos > width || xpos < 0) {
      xspeed *= -1;
    }
  }
}
