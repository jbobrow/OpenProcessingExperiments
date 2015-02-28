
int d = 20;
int xPos = 0;
int yPos = 0;
int diametro = 0;
int directionX = 1;
int directionY = 1;

void setup(){
  size(400, 400);
  smooth();
   background(255, 255, 0, 50);
}

void draw(){
  //background(200, 20);
  //noStroke();
  fill(50, 255,0);
  ellipse(xPos, yPos, d, d);
  xPos = xPos + directionX;
  yPos = yPos + directionY;
  
  if(xPos > mouseX+diametro - d/2){
    directionX = -1;
  }
  if(yPos > mouseY+diametro - d/2){
    directionY = -1;
  }
  
  if(xPos < d/2){
    directionX = 1;
  }
  if(yPos < d/2){
    directionY = 1;
  }
  
  fill(0,60,250);
  if (mousePressed){
    ellipse(mouseX, mouseY, diametro, diametro);
    diametro = diametro + 2;
  }
  if (diametro > width){
    diametro = 0;
  }
}

void mouseReleased(){
  diametro = 0;
}
