
Truck myTruck1;
Truck myTruck2;
Truck myTruck3;

void setup() {
  size(400, 400);
  myTruck1 = new Truck(color(0),7, 50, 50);
  myTruck2 = new Truck(color(0), 1, 180, 80);
  myTruck3 = new Truck(color(0), 5, 270,60);
}
void draw() {
  background(250, 255, 3);
  myTruck1.move();
  myTruck1.bounce();
  myTruck1.display();
  myTruck2.move();
  myTruck2.bounce();
  myTruck2.display();
  myTruck3.move();
  myTruck3.bounce();
  myTruck3.display();
}

class Truck {
  float xspeed;
  float xpos;
  float ypos;
  float truckSize;
  color c;

  Truck(color tempC, float tempXspeed, float tempYpos, float s) {
    c = tempC;
    xpos = 0;
    ypos = tempYpos;
    xspeed = tempXspeed;
    truckSize= s;
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
    fill(0); 
    rect(xpos, ypos, truckSize, truckSize*0.5);
    fill(random(255));
    rect(xpos, ypos-13, 27, 13);
   ellipse(xpos+8, ypos+truckSize*0.5, 10, 10);
 ellipse(xpos+truckSize-10, ypos+truckSize*0.5, 10, 10);
  }
}

