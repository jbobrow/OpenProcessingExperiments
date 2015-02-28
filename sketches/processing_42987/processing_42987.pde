

//Michael Kling
//17 Oct 11
//Test 2, Ex1
PImage car, neighborhood;

float posX=-130;
float posY=100;

void setup(){
  
  size(500,500);
  smooth();
  car=loadImage("car.png");
  neighborhood=loadImage("background.png");
  
}

void draw(){
  image(neighborhood,0,0);
  image(car,posX,posY);
  posX=posX+2;
  posY=posY+1;
  if(posX>width+50){
    posX=-130;
    posY=100;
  }

  
}

