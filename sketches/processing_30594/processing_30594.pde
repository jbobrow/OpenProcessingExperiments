

Car myCarA;
Car myCarB;
Car myCarC;
Car myCarD;
Car myCarE;

void setup() {
  size(700,500);
  myCarA = new Car(color(255,228,225),400,250,8);
  myCarB = new Car(color(240,255,190),400,90,3);
  myCarC = new Car(color(176,224,230),400,155,2);
  myCarD = new Car(color(0,255,127),400,340,7);
  myCarE = new Car(color(255,105,180),400,460,5);
}

void draw() {
  background(0);
  myCarA.drive();
  myCarA.display();
  myCarB.drive();
  myCarB.display();
  myCarC.drive();
  myCarC.display();
  myCarD.drive();
  myCarD.display();
  myCarE.drive();
  myCarE.display();
}

///////////////////////////////
class Car { 
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
    rect(xpos,ypos,150,50);
  }

  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}






