
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
  size(600, 200);
  rect(0, 600, 0, 200);
  
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
  size(600, 200);
  stroke(255);
  colorMode(RGB, 255);
  for(int i=0; i<600; i++){
    for(int j=0; j<200; j++){
    stroke(j, 0, i);
    point(i, j);
    }
  } 
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

