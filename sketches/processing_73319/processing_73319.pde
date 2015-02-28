
PImage background;
PImage car;
int carX;
int carY;

void setup() {
  background(0);
  size(540, 540);
  background = loadImage("background.png");
  car = loadImage("car.png");
  carX = -130;
  carY = 100;
}

void draw() {
  image(background, 0, 0);
  iterateCar();
}

void iterateCar() {
  image(car, carX, carY);
  carX += 2;
  carY += 1;
  if(carX > 580){
    carX = -130;
    carY = 100; 
  }
}

