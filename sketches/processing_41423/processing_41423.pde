
Car myCar1;
Car myCar2;
Car myCar3;
void setup() {
  size(700, 250);
  myCar1 = new Car(color(242, 147, 226), 2, 50, 50);
  myCar2 = new Car(color(59, 181, 255), 1, 100, 80);
  myCar3 = new Car(color(160, 255, 59), 5, 200, 60);
}
void draw() {
  background(200);
  myCar1.move();
  myCar1.bounce();
  myCar1.display();
  myCar2.move();
  myCar2.bounce();
  myCar2.display();
  myCar3.move();
  myCar3.bounce();
  myCar3.display();
}

class Car {
  float xspeed;
  float xpos;
  float ypos;
  float carSize;
  color c;

  Car(color tempC, float tempXspeed, float tempYpos, float s) {
    c = tempC;
    xpos = 0;
    ypos = tempYpos;
    xspeed = tempXspeed;
    carSize= s;
  }

  void move() {
    xpos += xspeed;
  }

  void bounce() {
    if ((xpos>= width) || (xpos<= 0)) {
      xspeed *= -1;
    }
  }

  void display() {
    stroke(0);
    fill(c);
    rect(xpos, ypos, carSize, carSize*0.5);
    fill(0);
    rect(xpos+3, ypos-4, 7, 4);
    rect(xpos+3, ypos+carSize*0.5, 7, 4);
    rect(xpos+carSize-10, ypos-4, 7, 4);
    rect(xpos+carSize-10, ypos+carSize*0.5, 7, 4);
  }
}
 
