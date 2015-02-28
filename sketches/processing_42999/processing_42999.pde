
PImage img;
PImage car;
float posX = -130;
float posY = 100;

void setup(){
  smooth();
  size(548,548);
  img = loadImage("background.png");
  car = loadImage("car.png");
}

void draw(){
  
  image(img,0,0);
  image(car,posX,posY);
  
  posX+=2;
  posY+=1;
  
  if(posX > width)
  {
    posX = -130;
    posY = 100;
  }

  
}


