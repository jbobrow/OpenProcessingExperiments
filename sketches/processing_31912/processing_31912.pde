
int xPos = 0;
int yPos = 0;

int xPos2 = 490;
int yPos2 = 0;
int xPos3 = 0;
int yPos3 = 490;
int xPos4 = 490;
int yPos4 = 490;
int xPos5 = 245;
int yPos5 = 245;
int yPos6 = 245;
int xPos7 = 245;
int xPos8 = 245;
int yPos8 = 245;
int xCPos = 250;
int yCPos = 250;
int xCPos2 = 250;
int yCPos2 = 250;

int quadXPos1 = 240;
int quadYPos1 = 240;
int quadXPos2 = 260;
int quadYPos2 = 260;
int quadXPos3 = 260;
int quadYPos3 = 260;
int quadXPos4 = 240;
int quadYPos4 = 240;

int quad2XPos1 = 260;
int quad2YPos1 = 260;
int quad2XPos2 = 240;
int quad2YPos2 = 240;
int quad2XPos3 = 240;
int quad2YPos3 = 240;
int quad2XPos4 = 260;
int quad2YPos4 = 260;

int quad3XPos1 = 260; 
int quad3YPos1 = 240; //225
int quad3XPos2 = 260; //275
int quad3YPos2 = 240;
int quad3XPos3 = 240; 
int quad3YPos3 = 260; //275
int quad3XPos4 = 240; //225
int quad3YPos4 = 260;

int quad4XPos1 = 240;
int quad4YPos1 = 260;
int quad4XPos2 = 240;
int quad4YPos2 = 260;
int quad4XPos3 = 260;
int quad4YPos3 = 240;
int quad4XPos4 = 260;
int quad4YPos4 = 240;

int quad5XPos1 = 250;
int quad5YPos1 = 250;
int quad5XPos2 = 250;
int quad5YPos2 = 250;
int quad5XPos3 = 250;
int quad5YPos3 = 250;
int quad5XPos4 = 250;
int quad5YPos4 = 250;

int shapeSize = 10;
int count = 0;
int trans = 255;
int trans2 = 20;

void setup(){
  size(500, 500);
  background(2);
  fill(0,90,212,2);
  smooth();
  fill(0,90,212,2);
  rectMode(CENTER);
  frameRate(10);
}

void draw(){
  
  while (count<20){
    stroke(77,218,255,trans2);
    ellipse (250,250,shapeSize,shapeSize);
    fill(0,90,212,5);
    rect (250,250,shapeSize,shapeSize);
    noFill();
    quad (quadXPos1,quadYPos1,quadXPos2,quadYPos2,quadXPos3,quadYPos3,quadXPos4,quadYPos4);
    quad (quad2XPos1,quad2YPos1,quad2XPos2,quad2YPos2,quad2XPos3,quad2YPos3,quad2XPos4,quad2YPos4);
    quad (quad3XPos1,quad3YPos1,quad3XPos2,quad3YPos2,quad3XPos3,quad3YPos3,quad3XPos4,quad3YPos4);
    quad (quad4XPos1,quad4YPos1,quad4XPos2,quad4YPos2,quad4XPos3,quad4YPos3,quad4XPos4,quad4YPos4);
    quad (quad5XPos1,quad5YPos1,quad5XPos2,quad5YPos2,quad5XPos3,quad5YPos3,quad5XPos4,quad5YPos4);

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
     
     noFill();
     
    ellipseMode(CORNER);
    ellipse (xPos,yPos,shapeSize,shapeSize);
    ellipse (xPos2,yPos2,shapeSize,shapeSize);
    ellipse (xPos3,yPos3,shapeSize,shapeSize);
    ellipse (xPos4,yPos4,shapeSize,shapeSize);
    ellipseMode(CENTER);
    stroke(77,218,255,trans);
    ellipse (250,250,shapeSize,shapeSize);
    ellipse (xCPos,250,shapeSize,shapeSize);
    ellipse (xCPos2,250,shapeSize,shapeSize);
    ellipse (250,yCPos,shapeSize,shapeSize);
    ellipse (250,yCPos2,shapeSize,shapeSize);
    ellipseMode(CORNER);
    ellipse (xPos5,yPos5,shapeSize,shapeSize);
    ellipse (xPos5,yPos6,shapeSize,shapeSize);
    ellipse (xPos7,yPos5,shapeSize,shapeSize);
    ellipse (xPos8,yPos8,shapeSize,shapeSize);
     
    shapeSize = shapeSize+30;
    trans = trans - 15;
    trans2 = trans2 + 5;
    xPos2 = xPos2 - 30;
    yPos3 = yPos3 - 30;
    xPos4 = xPos4 - 30;
    yPos4 = yPos4 - 30;
    yPos6 = yPos6 - 30;
    xPos7 = xPos7 - 30;
    xPos8 = xPos8 - 30;
    yPos8 = yPos8 - 30;
    xCPos = xCPos + 15;
    yCPos = yCPos + 15;
    xCPos2 = xCPos2 - 15;
    yCPos2 = yCPos2 - 15;
     
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

