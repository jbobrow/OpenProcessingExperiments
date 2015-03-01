
//declaring my objects
Car myCar1;
Car myCar2;
Car myCar3;
Meteor myMeteor;

void setup() {
  size (400, 300);
  // initializing objects
  myCar1 = new Car(color(255, 100, 0), 0, 100, 2, 0);
  myCar2 = new Car(color (200, 255, 30), 0, 200, 1.5, 0);
  myCar3 = new Car(color(10, 200, 200), 0, 150, 2.3, 0);
  myMeteor = new Meteor();
}

void draw() {
  // background 
  background(100, 200, 155);
  rectMode(CORNER);
 fill(150);
  rect(0, height/4, width, height/2);
// using objects
  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();
  myMeteor.move();
  myMeteor.display();
}

class Meteor {
  color c1;
  color c2;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  int savedTime;
  int totalTime;

  Meteor() {
    c1 = color(255, 255, 0);
    c2 = color (255, 100, 0);
    xpos = random(width - 30, width);
    ypos = 0;
    xspeed = 10;
    yspeed = 10;
    savedTime = millis();
    totalTime = 2000;
  }

  void display() {

    ellipseMode(CENTER);
    noStroke();
    fill(c1);
    ellipse(xpos, ypos, 18, 18);
    fill(c2);
    ellipse(xpos, ypos, 10, 10);
  }
  void move() {
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      xpos = xpos - xspeed;
      ypos = ypos + yspeed;
      savedTime = millis();
    }
    if (ypos > height) {
      ypos = 0;
      xpos = width;
    }
  }
}


class Car {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;


  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed, float tempYspeed) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
    yspeed = tempYspeed;
  }
  void display () {

    rectMode(CENTER);
    fill (c);
    rect (xpos, ypos, 40, 20);
    fill (0);
    // wheels
    rect (xpos - 10, ypos - 10, 15, 10);
    rect (xpos + 10, ypos - 10, 15, 10);
    rect (xpos - 10, ypos + 10, 15, 10);
    rect (xpos + 10, ypos + 10, 15, 10);
  }



  void move () {
    xpos = xpos + xspeed;
    ypos = ypos + yspeed;
    if (xpos > width) {
      xpos = 0;
    }
    if (ypos > height) {
      ypos = 0;
    }
  }
}


