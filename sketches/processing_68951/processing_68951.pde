
/** 
Auteur: Hugo Lachance
Date: 07/09/2012
Projet: Programmer un oeil qui se déplace avec un assouplissement et une pupille qui suit la souris

**/

float xOeil=200, yOeil=200, xPupille=200, yPupille=200, xPupilleCible=200, yPupilleCible=200;
float xCible=200, yCible=200;
float speedX=0, speedY=0;
int oeilDiametre=90;
float radActu=0;

void setup(){
  size(400,400);
  smooth();
}


void mousePressed(){
  xCible = mouseX;
  yCible = mouseY;
}

void draw(){
  background(30);
  
  noStroke();
  fill(100,109,189);
  
  speedX += (xCible - xOeil) * 0.0005;
  speedY += (yCible- yOeil) *0.004671;
  xOeil += (xCible - xOeil) * 0.09 + speedX;
  yOeil += (yCible - yOeil) * 0.09 + speedY;
  ellipse(xOeil, yOeil, oeilDiametre, oeilDiametre);
  
  float pupilleDiametre = oeilDiametre*0.4;
  float distance = dist(mouseX, mouseY, xOeil, yOeil);
  distance = constrain(distance, 0, oeilDiametre/2 - pupilleDiametre/2);
  
  //Extra: fait un assouplissement sur la pupille
  float rad = atan2(mouseY - yOeil, mouseX - xOeil);
  radActu = radActu + (rad-radActu)*0.1;
  
  xPupille = xOeil + cos(radActu) * distance;
  yPupille = yOeil + sin(radActu) * distance;

  
  fill(90,30,30);
  
  ellipse(xPupille, yPupille, pupilleDiametre, pupilleDiametre);
}
