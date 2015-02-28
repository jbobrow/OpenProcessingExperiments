
int posX, posY, velX, velY;
int sz = 20;

void setup(){
  size(200,150);
  posX = width/2;
  posY = height/2;
  velX = 5;
  velY = 5;
}

void draw(){
  background(0);
  
  //actualitzem posicions
  posX = posX+velX;
  posY = posY+velY;
  
  //dibuixem
  ellipse(posX,posY,sz,sz);

  //comprovem la posiciÃ³ X
  if((posX<0)||(posX>width)){
    velX = -velX;
  } 
    //comprovem la posiciÃ³ Y
  if((posY<0)||(posY>height)){
    velY = -velY;
  } 
}
