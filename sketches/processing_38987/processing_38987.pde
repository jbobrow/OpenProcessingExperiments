
void setup() {
  size(500, 500);
  rectMode(CENTER);
  mycar1 = new Car(20, 20, 1, color(225, 225, 0));
  mycar2 = new Car(20, 50, 3, color(255, 0, 225));
  mycar3 = new Car(20, 75, 5, color(0, 225, 225));
  mycar4 = new Car(20, 80, 6, color(0, 5, 5));
  mycar5 = new Car(20, 125, 4, color(0, 225, 5));
}

Car mycar1;
Car mycar2;
Car mycar3;
Car mycar4;
Car mycar5;

void draw() {
  background(255);
  noStroke();
  fill(255);

  if (mousePressed) {
    mycar1.display();
    mycar2.display();
    mycar3.display();
    mycar4.display();
    mycar5.display();
    mycar5.display();
    mycar5.mouseFollow();
  }
  else {
    mycar1.display();
    mycar1.drive();

    mycar2.display();
    mycar2.drive();

    mycar3.display();
    mycar3.driveback();

    mycar4.display();
    mycar4.driveback();

    mycar5.display();
    mycar5.erratic();
  }
}

class Car {
  int xpos;
  int ypos;
  int speed;
  color carcolor;

  Car(int tempXpos, int tempYpos, int tempSpeed, color tempColor) {
    xpos = tempXpos;
    ypos = tempYpos;
    speed = tempSpeed;
    carcolor = tempColor;
  }

  void display() {
    fill(carcolor);
    rect(xpos, ypos, 20, 10);
  }

  void drive() {
    xpos = xpos + speed;
    if (xpos>width) {
      xpos=0;
    }
  }

  void driveback() {
    xpos = xpos + (speed * -1);
    if (xpos<0) {
      xpos = screen.width;
    }
  }

  void erratic() {
    drive();
    ypos = ypos + int(random(-3, 3));
    if (ypos>height) {
      ypos = 0;
    }
    if (ypos<0) {
      ypos = height;
    }
  }

  void mouseFollow() {
    xpos = mouseX;
    ypos = mouseY;
  }
}

//mouseFollow, driveback, and erratic are written by 
//Heather, everything else was written by 
//Karen Tanenbaum.

