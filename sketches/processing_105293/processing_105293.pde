
/*int posX = 0;

void setup(){
size(400, 400);
frameRate(24);
}

void draw(){
  background(0);
  //float r1 = random(0, width);
ellipse(posX, height/2, 40, 40);
posX=posX+1;

} */

float posX = random(400);
float posY = random(400);
float velX = random(-10,10);
float velY = random(-10,10);

void setup(){
size(400, 400);
frameRate(30);
}

void draw(){
background(0);
ellipse (posX, posY, 20, 20);
posX = posX + velX;
posY = posY + velY;

if (posX > width-10 || posX <10 ){
  velY += random(-1,1);
  velX =  - velX;
  
}

if (posY> height-10 || posY < 10) {
  velX += random(-1,1);
  velY = - velY;
}

if (mousePressed)
{
  posX = mouseX;
  posY = mouseY;
  velX = random(-10,10);
  velY = random(-10,10);
}
  
//  posX =rX;
//  posY=rY;
  
// posX = rX;
// posY = rY;
}





