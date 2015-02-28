
// references http://www.openprocessing.org/visuals/?visualID=162
// http://processing.org/learning/2darray/
//car size 164x74 pixels

int vel = 1;
int carY = 75;
int carX = 0;
PImage yellowCar;
PImage greenCar;
PImage blueCar;
PImage pinkCar;
PImage redCar;
PImage blackCar;
PImage silverCar;


void setup(){
  size(700, 250);
  background(0);
  yellowCar = loadImage("yellow.png");
  greenCar = loadImage("green.png");
  blueCar = loadImage("blue.png");
  pinkCar = loadImage("pink.png");
  redCar = loadImage("red.png");
  blackCar = loadImage("black.png");
  silverCar = loadImage("silver.png");

 frameRate(24);
  }
void draw(){
  background(0);  
  image(yellowCar, carX, carY);
  carX = carX + vel;
  
  image(pinkCar, carX-200, carY);
  carX = carX + vel;
  
  image(blueCar, carX-400, carY);
  carX = carX + vel;
  
  image(silverCar, carX-600, carY);
  carX = carX + vel;
  
  image(greenCar, carX-800, carY);
  carX = carX + vel;
  
  image(blackCar, carX-1000, carY);
  carX = carX + vel;
  
  image(redCar, carX-1200, carY);
  carX = carX + vel;
}

