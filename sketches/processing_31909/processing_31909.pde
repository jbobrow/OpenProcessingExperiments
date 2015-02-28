
int xPos = 0;
int yPos = 0;
int quadX = xPos/2;
int quadY = yPos/2;
int quadXPos1 = 250;
int quadYPos1 = 250;
int quadXPos2 = 250;
int quadYPos2 = 250;
int quadXPos3 = 250;
int quadYPos3 = 250;
int quadXPos4 = 250;
int quadYPos4 = 250;
int shapeSize = 10;
int count = 0;
int trans = 255;

void setup(){
  size(500, 500);
  background(2);
 
  smooth();
  fill(0,90,212,2);
  rectMode(CENTER);
  frameRate(10);
}

void draw(){
  
  while (count<20){
     stroke(77,218,255,trans);
    ellipse (250,250,shapeSize,shapeSize);
    rect (250,250,shapeSize,shapeSize);
    quad (quadXPos1,quadYPos1,quadXPos2,quadYPos2,quadXPos3,quadYPos3,quadXPos4,quadYPos4);
    
    shapeSize = shapeSize+30;
    trans = trans - 15;
     quadXPos1 = quadXPos1;
     quadYPos1 = quadYPos1 -15;
     quadXPos2 = quadXPos2 +15;
     quadYPos2 = quadYPos2;
     quadXPos3 = quadXPos3;
     quadYPos3 = quadYPos3 +15;
     quadXPos4 = quadXPos4 -15;
     quadYPos4 = quadYPos4;
    count++;
  }
  xPos = xPos + 100;
  shapeSize = 10;

  
  if(xPos>500){
    xPos = xPos + 15;
    yPos = yPos + 70;
    xPos = 0;
    
  }
  if(yPos>500){
    xPos=0;
    yPos=0;
  }

}

