
PImage car;
PImage backPic;
float posX = -130;
float posY = 100;
float vX = 2;
float vY = 1;

void setup (){
  size (548, 548);
  backPic = loadImage ("background.png");
  car = loadImage ("car.png");
}

void draw(){
  image (backPic, 0,0);
  image(car, posX, posY);
  posX = posX + vX;
  posY = posY + vY;
  if (posX > width)
  {
   posX = -130;
   posY= 100;
  }
}

