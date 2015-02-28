
PImage car;
PImage street;
int carX = -130;
int carY = 100;

void setup(){
 size(548,548); 
 car = loadImage("car.png");
 street = loadImage("background.png");
}

void draw(){
  image(street,0,0,548,548);
  image(car,carX,carY,124,76);
  carY++;
  carX += 2;
  if (carX > 548){
    carX = -130;
    carY = 100;
  }
}

