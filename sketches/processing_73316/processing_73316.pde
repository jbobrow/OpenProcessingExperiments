
PImage bg, car;

float x, y;

void setup () {
  size(548, 548);
  smooth();
  //frameRate(5);
  bg = loadImage("background.png");
  car = loadImage("car.png");
  x = 2;
  y = 1;
}

void draw() {
  image(bg, 0, 0);
  pushMatrix();
    translate(-130+x, 100+y);
    image(car, 0, 0);
  popMatrix();
  x+=2;
  y++;
  if( x>width+130 ) {
    x = 0;
    y = 0;
  }
}

