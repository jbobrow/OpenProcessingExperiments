
int posX, posY, velX, velY;
int sz = 20;
void setup(){
  size(200,150);
  posX = width/2;
  posY = height/2;
  velX = 2;
  velY = 2;
}
void draw(){
  background(0);
  
  //actualitzem posicions
  posX = posX+velX;
  posY = posY+velY;
  
  //dibuixem
  ellipse(posX,posY,sz,sz);
  //comprovem la posiciÃ³ X
  if((posX<sz/2)||(posX>width-sz/2)){
    velX = -velX;
  } 
    //comprovem la posiciÃ³ Y
  if((posY<sz/2)||(posY>height-sz/2)){
    velY = -velY;
  } 
}
