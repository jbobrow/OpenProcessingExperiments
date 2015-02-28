
int xPos = 0;
int yPos = 0;
int quadXPos1 = 240;
int quadYPos1 = 240;
int quadXPos2 = 260;
int quadYPos2 = 260;
int quadXPos3 = 260;
int quadYPos3 = 260;
int quadXPos4 = 240;
int quadYPos4 = 240;

int quad3XPos1 = 260; 
int quad3YPos1 = 240; //225
int quad3XPos2 = 260; //275
int quad3YPos2 = 240;
int quad3XPos3 = 240; 
int quad3YPos3 = 260; //275
int quad3XPos4 = 240; //225
int quad3YPos4 = 260;

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
    quad (quad3XPos1,quad3YPos1,quad3XPos2,quad3YPos2,quad3XPos3,quad3YPos3,quad3XPos4,quad3YPos4);
    
    
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
     
     
     quad3XPos1 = quad3XPos1;
     quad3YPos1 = quad3YPos1 -15;
     quad3XPos2 = quad3XPos2 +15;
     quad3YPos2 = quad3YPos2;
     quad3XPos3 = quad3XPos3;
     quad3YPos3 = quad3YPos3 +15;
     quad3XPos4 = quad3XPos4 -15;
     quad3YPos4 = quad3YPos4;
     
     
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

