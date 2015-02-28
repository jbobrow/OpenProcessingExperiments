
 int posX = 0;
 int posY = 0;
 int velX = 16;
 int velY = 17;
  
 void setup(){
  size(400,400);
  frameRate(60);
}

void draw(){
  background(50);
  ellipse(posX,posY,50,50);
  posX = posX + velX;
  posY = posY + velY;
  if (posX > width || posX < 0){
    velX = velX * -1;
  }
  if(posY > height || posY < 0){
  velY = velY * -1;
  }
}
