
/*
 Autor: Joan Soler-Adillon (www.joan.cat)
 Tutorial de Processing: Condicionals
 Modificado por: Daniel Becerra
 */

float posX, posY, velX, velY;
float sz = 20;

void setup(){
  size(400,300);
  posX = random(51, 350);
  posY = random(51, 250);
  velX = 5;
  velY = 5;
}

void draw(){
  background(0);
  
  //actualitzem posicions
  posX = posX+velX;
  posY = posY+velY;
  fill(random(20,60));
  rect(50, 50, 300, 200);
 
  fill(255);
  //dibuixem
  ellipse(posX,posY,sz,sz);


  //comprovem la posiciÃ³ X
  if((posX<50)||(posX>350)){
    velX = -velX;
  } 
    //comprovem la posiciÃ³ Y
  if((posY<50)||(posY>250)){
    velY = -velY;
  } 
}




