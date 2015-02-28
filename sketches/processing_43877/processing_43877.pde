
/*

 let's build a car with software!!! 
 a class/object example
 
 by bb
 
 */
int num = 500; // number of cars
Car[] myCars; // array for cars

void setup() {
  size(500, 500);
  smooth();
  myCars = new Car[num]; // init array
  // instantiate all cars
  for (int i =0;i<num;i++) {
    myCars[i] = new Car();
  }
}

void draw() {
  background(0);
  // draw and move cars
  for (int i =0;i<num;i++) {
    myCars[i].draw();
    myCars[i].go();
  }
}

class Car {
  // fields
  color col;
  int x;
  int y;
  int speed;

  //constructor
  Car () {
    // assign random values to all fields
    col = color(random(256), random(256), random(256), random(256));
    speed = int(random(1, 10));
    if (random(1)>0.5) {
      speed = -speed;
    }
    x = int(random(width));
    y = int(random(height));
  }

  // methods
  void draw() {
    // draw car as a box
    noStroke();
    fill(col);
    rect(x, y, 20, 10);
    ellipse(x+5, y+10, 5, 5);
    ellipse(x+15, y+10, 5, 5);
  }


  void go() {
    // increase value of x based on speed
    x+= speed;
    // forward cars
    if (x>width && speed>0) {
      x = -20;
    }
    // backward cars
    if (x<0 && speed < 0) {
      x = width+20;
    }
  }
}


