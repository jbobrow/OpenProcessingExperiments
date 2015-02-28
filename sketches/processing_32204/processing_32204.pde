
int xPos = -125;
int yPos = 0;
int quadXPos1 = 115;
int quadYPos1 = 240;
int quadXPos2 = 135;
int quadYPos2 = 260;
int quadXPos3 = 135;
int quadYPos3 = 260;
int quadXPos4 = 115;
int quadYPos4 = 240;

int quad2XPos1 = 135;
int quad2YPos1 = 260;
int quad2XPos2 = 115;
int quad2YPos2 = 240;
int quad2XPos3 = 115;
int quad2YPos3 = 240;
int quad2XPos4 = 135;
int quad2YPos4 = 260;

int quad3XPos1 = 135; 
int quad3YPos1 = 240; //225
int quad3XPos2 = 135; //275
int quad3YPos2 = 240;
int quad3XPos3 = 115; 
int quad3YPos3 = 260; //275
int quad3XPos4 = 115; //225
int quad3YPos4 = 260;

int quad4XPos1 = 115;
int quad4YPos1 = 260;
int quad4XPos2 = 115;
int quad4YPos2 = 260;
int quad4XPos3 = 135;
int quad4YPos3 = 240;
int quad4XPos4 = 135;
int quad4YPos4 = 240;

int quad5XPos1 = 125;
int quad5YPos1 = 250;
int quad5XPos2 = 125;
int quad5YPos2 = 250;
int quad5XPos3 = 125;
int quad5YPos3 = 250;
int quad5XPos4 = 125;
int quad5YPos4 = 250;

int shapeSize = 10;
int count = 0;
int trans = 255;

void setup(){
  size(250, 500);
  background(2);
 
  smooth();
  fill(0,90,212,2);
  rectMode(CENTER);
  frameRate(10);
}

void draw(){
  
  while (count<20){
     stroke(77,218,255,trans);
    ellipse (125,250,shapeSize,shapeSize);
    rect (125,250,shapeSize,shapeSize);
    quad (quadXPos1,quadYPos1,quadXPos2,quadYPos2,quadXPos3,quadYPos3,quadXPos4,quadYPos4);
    quad (quad2XPos1,quad2YPos1,quad2XPos2,quad2YPos2,quad2XPos3,quad2YPos3,quad2XPos4,quad2YPos4);
    quad (quad3XPos1,quad3YPos1,quad3XPos2,quad3YPos2,quad3XPos3,quad3YPos3,quad3XPos4,quad3YPos4);
    quad (quad4XPos1,quad4YPos1,quad4XPos2,quad4YPos2,quad4XPos3,quad4YPos3,quad4XPos4,quad4YPos4);
    quad (quad5XPos1,quad5YPos1,quad5XPos2,quad5YPos2,quad5XPos3,quad5YPos3,quad5XPos4,quad5YPos4);
    
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
     
     quad2XPos1 = quad2XPos1;
     quad2YPos1 = quad2YPos1 -15;
     quad2XPos2 = quad2XPos2 +15;
     quad2YPos2 = quad2YPos2;
     quad2XPos3 = quad2XPos3;
     quad2YPos3 = quad2YPos3 +15;
     quad2XPos4 = quad2XPos4 -15;
     quad2YPos4 = quad2YPos4;
     
     quad3XPos1 = quad3XPos1;
     quad3YPos1 = quad3YPos1 -15;
     quad3XPos2 = quad3XPos2 +15;
     quad3YPos2 = quad3YPos2;
     quad3XPos3 = quad3XPos3;
     quad3YPos3 = quad3YPos3 +15;
     quad3XPos4 = quad3XPos4 -15;
     quad3YPos4 = quad3YPos4;
     
     quad4XPos1 = quad4XPos1;
     quad4YPos1 = quad4YPos1 -15;
     quad4XPos2 = quad4XPos2 +15;
     quad4YPos2 = quad4YPos2;
     quad4XPos3 = quad4XPos3;
     quad4YPos3 = quad4YPos3 +15;
     quad4XPos4 = quad4XPos4 -15;
     quad4YPos4 = quad4YPos4;
     
     quad5XPos1 = quad5XPos1;
     quad5YPos1 = quad5YPos1 -15;
     quad5XPos2 = quad5XPos2 +15;
     quad5YPos2 = quad5YPos2;
     quad5XPos3 = quad5XPos3;
     quad5YPos3 = quad5YPos3 +15;
     quad5XPos4 = quad5XPos4 -15;
     quad5YPos4 = quad5YPos4;
     
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

