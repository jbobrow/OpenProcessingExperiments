
PVector position = new PVector(-130,100);
PVector speed = new PVector(2,1);
PImage car;
PImage bkg;

void setup() {
  size(548,548);
  car = loadImage("car.png");
  bkg = loadImage("bkg.jpg");
}

void draw() {
  image(bkg,0,0);
  image(car,position.x, position.y);
  if(position.x > width || position.y > height) {
    position = new PVector(-130,100);
  }
  else {
    position.add(speed);
  }
}

