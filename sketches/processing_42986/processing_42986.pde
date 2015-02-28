
PImage car;
PImage town;

void setup(){
  size(548, 548);
  town = loadImage("background.png"); 
  car = loadImage("car.png"); 
}

float posx=-130;
  float posy=100;
void draw(){
  
  image(town, 0,0,548,548);
  
  image(car, posx, posy, 124,76);
  
  posx+=2;
  posy+=1;
  if (posx>548){
    posx=-130;
  posy=100;
  }
}

