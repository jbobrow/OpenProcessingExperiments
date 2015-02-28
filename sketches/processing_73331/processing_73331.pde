
PImage car, street;
float deltaX, deltaY;

void setup() {
  size(550, 550);
  deltaX = -130;
  deltaY = 100;
  car = loadImage("car.png");
  street = loadImage("background.png");
}

void draw() {
  image(street, 0, 0);
  positionCar();
}

void positionCar() {
  pushMatrix();
    if (deltaX > width) {
      deltaX = -130;
      deltaY = 100;
    }
    
    deltaX += 2;
    deltaY += 1;
    image(car, deltaX, deltaY);
  popMatrix();
}

