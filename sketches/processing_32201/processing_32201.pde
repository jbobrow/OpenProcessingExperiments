
int xPos = -125;
int yPos = 0;
int xPos2 = 365;
int yPos2 = 0;
int xPos3 = -125;
int yPos3 = 490;
int xPos4 = 365;
int yPos4 = 490;
int xPos5 = 120;
int yPos5 = 245;
int yPos6 = 245;
int xPos7 = 120;
int xPos8 = 120;
int yPos8 = 245;
int xCPos = 125;
int yCPos = 250;
int xCPos2 = 125;
int yCPos2 = 250;
int shapeSize = 10;
int count = 0;
int trans = 225;
int trans2 = 20;

void setup(){
  size(250, 500);
  background(2);
 
  smooth();
  
  rectMode(CENTER);
  ellipseMode(CORNER);
  frameRate(10);
}

void draw(){
  
  while (count<20){
     stroke(77,218,255,trans2);
     noFill();
     
     ellipseMode(CORNER);
    ellipse (xPos,yPos,shapeSize,shapeSize);
    ellipse (xPos2,yPos2,shapeSize,shapeSize);
    ellipse (xPos3,yPos3,shapeSize,shapeSize);
    ellipse (xPos4,yPos4,shapeSize,shapeSize);
    ellipseMode(CENTER);
    stroke(77,218,255,trans);
    ellipse (125,250,shapeSize,shapeSize);
    ellipse (xCPos,250,shapeSize,shapeSize);
    ellipse (xCPos2,250,shapeSize,shapeSize);
    ellipse (125,yCPos,shapeSize,shapeSize);
    ellipse (125,yCPos2,shapeSize,shapeSize);
    ellipseMode(CORNER);
    ellipse (xPos5,yPos5,shapeSize,shapeSize);
    ellipse (xPos5,yPos6,shapeSize,shapeSize);
    ellipse (xPos7,yPos5,shapeSize,shapeSize);
    ellipse (xPos8,yPos8,shapeSize,shapeSize);
    fill(0,90,212,5);
    rect (125,250,shapeSize,shapeSize);
    
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

