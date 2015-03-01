

Car myCar;

void setup () {
  size (200, 200);
  myCar = new Car();
}

void draw() {
  background(#B77C7C);
  myCar.drive();
  myCar.display();
}

class Car {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float rwidth;
  float rheight;


  Car() { //konstruktor
    c = color(0);
    xpos = 0;
    ypos = 100;
    xspeed = 1;
    rwidth = 20;
    rheight= 10;
  }

  void display() {
    rectMode(CENTER);
    fill(c);
    rect(xpos, ypos, rwidth, rheight);
  }

  void drive() {
    xpos += xspeed;
    if (xpos+rwidth > width || xpos==0) {
      xspeed *= -1;
    }
  }
}//end class Car

