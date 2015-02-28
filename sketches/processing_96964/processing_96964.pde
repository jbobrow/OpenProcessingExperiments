
AirPlane16[] newf16 = new AirPlane16[10];
AirPlane18[] newf18 = new AirPlane18[10];
PImage f16;
PImage f18;


void setup() {
  size(800, 400);
  f16 = loadImage("F16.png");
  f18 = loadImage("F18.png");
  for (int i = 0; i < newf16.length; i++) {
    newf16[i] = new AirPlane16(f16, int(random(0, 350)), int(random(0, 350)), int(random(50, 200)), int(random(50, 150)), int(random(1,4)));
  }
  for (int i = 0; i < newf18.length; i++) {
    newf18[i] = new AirPlane18(f18, int(random(0, 350)), int(random(0, 350)), int(random(50, 200)), int(random(50, 150)), int(random(1,4)));;
  }
}

void draw() {
  background(0);
  for (int i = 0; i < newf16.length; i++) {
    newf16[i].display();
    newf16[i].move();
  }
  for (int i = 0; i < newf18.length; i++) {
    newf18[i].display();
    newf18[i].move();
  }
}

class AirPlane16 {
  PImage f16;
  int x;
  int y;
  int w;
  int h;
  int speed;

  AirPlane16(PImage _f16, int _x, int _y, int _w, int _h, int _speed) {
    speed = _speed;
    f16 = _f16;
    x=_x;
    y=_y;
    w=_w;
    h=_h;
  }  
  void display() {
    image(f16, x, y, w, h);
  }

  void move() {
    x=x + speed;
  }
}

class AirPlane18 {
  PImage f18;
  int x;
  int y;
  int w;
  int h;
  int speed;

  AirPlane18(PImage _f18, int _x, int _y, int _w, int _h, int _speed) {
    speed = _speed;
    f18 = _f18;
    x=_x;
    y=_y;
    w=_w;
    h=_h;
  }  
  void display() {
    image(f18, x, y, w, h);
  }

  void move() {
    x=x + speed;
  }
}


