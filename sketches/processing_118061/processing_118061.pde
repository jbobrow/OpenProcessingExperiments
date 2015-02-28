
//Lots of Cars By Dominic Filipek

// total number of cars
int numCar = 174;                 
Car[] cars = new Car[numCar];
Car[] cars2 = new Car[numCar];
Car[] cars3 = new Car[numCar];

void setup() {
  size(700, 700);

  // set random colors, speeds
  // all cars start at x0 and are 3px apart in y
  for (int i = 0; i <cars.length; i++) {
    cars[i] = new Car(color((random(0, 255)), (random(0, 255)), (random(0, 255))), 0, i*4, (random(1, 15)));
    cars2[i] = new Car(color((random(0, 255)), (random(0, 255)), (random(0, 255))), width, i*4, (random(1, 5)));
    cars3[i] = new Car(color((random(0, 255)), (random(0, 255)), (random(0, 255))), width, i*4, (random(1, 22)));
  }
}

void draw() {
  background(#ffffff);
  // i = 1 so that the first car doesn't fall off the top of the window
  for (int i = 2; i <cars.length; i++) {
    cars[i].move();
    cars[i].display();
    cars2[i].move2();
    cars2[i].display();
    cars3[i].move3();
    cars3[i].display3();
  }
}

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
    stroke(0, 0, 0, 0);
    fill(c);
    tint(25, 126);
    rectMode(CENTER);
    rect(xpos, ypos, 60, 10);
  }

  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
  void move2() {
    xpos = xpos - xspeed;
    if (xpos < 0) {
      xpos = width;
    }
  }
  void display3() {
    stroke(0, 0, 0, 0);
    fill(c);
    rectMode(CENTER);
    rect(xpos, ypos, 150, 15, 5);
  }
  void move3() {
    xpos = xpos - xspeed;
    if (xpos < 0) {
      xpos = width;
    }
  }
}



