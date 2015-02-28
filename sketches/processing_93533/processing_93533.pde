
//Valentina Pherson
//Creative Computing
//March 18, 2013
//Class and Objects

//Car cadillac = new Car(100, 50, 30, 100, 100);
//Car ford = new Car(200, 20, 205, 200, 250);
//Car honda = new Car(50, 50, 10, 300, 450);

Car[] traffic = new Car[27];


void setup() {
  size(500, 500);
  fill(100);
  //  ford.xpos = 200;
  //  ford.r = 0;
  //  ford.g = 0;

  //  honda.ypos = 200;
  //  honda.g = 0;
  //  honda.b = 0;

  for (int i=0; i<27; i++) {
    traffic[i]=new Car(int(random(255)), int(random(255)), int(random(255)), i*0, i*50);
  }
}

void draw() {
  background(0);
 // cadillac.drawCar();
 // ford.drawCar();
 // honda.drawCar();
 // honda.move();
 // cadillac.move2();
 // ford.move3();
  for (int i=0; i<27; i++) {
    stroke(230, 234, 28);
    line(0, i*50-45, width, i*50-45);
  }
  for (int i=0; i<27; i++) {
    stroke(0);
    traffic[i].drawCar();
    traffic[i].move();
  }
}

class Car {
  int r;
  int g;
  int b;

  float xpos;
  float ypos;

  Car(int _r, int _g, int _b, float _xpos, float _ypos) {
    r = _r;
    g = _g;
    b = _b;

    xpos = _xpos;
    ypos = _ypos;
  }

  void drawCar() {
    fill(r, g, b);
    rect(xpos, ypos, 100, 30);
    ellipse(xpos + 10, ypos+30, 10, 10);
    ellipse(xpos + 80, ypos + 30, 10, 10);
    rect(xpos + 80, ypos +5, 15,10);
  }

  void move() {
    xpos = mouseX;
  }

  void move2() {
    xpos = mouseX + 50;
  }

  void move3() {
    xpos = mouseX - 50;
  }
}
