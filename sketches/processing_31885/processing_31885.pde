
int xPos = 0;
int yPos = 0;
int shapeSize = 10;

void setup(){
  size(500, 500);
  background(2);
 
  smooth();
  fill(0,90,212,10);
  rectMode(CENTER);
  frameRate(10);
}

void draw(){
  
  while (shapeSize<101){
     stroke(77,218,255,random(50,110));
    ellipse (xPos+10,yPos,shapeSize,shapeSize);
    ellipse (xPos+30,yPos,shapeSize,shapeSize);
    ellipse (xPos+70,yPos,shapeSize,shapeSize);
    rect (xPos+10,yPos,shapeSize,shapeSize);
    rect (xPos+30,yPos,shapeSize,shapeSize);
    rect (xPos+70,yPos,shapeSize,shapeSize);
    line (xPos,yPos,shapeSize,shapeSize);
    line (xPos+30,yPos,shapeSize,shapeSize);
    line (xPos+70,yPos,shapeSize,shapeSize);
    line (500,yPos,shapeSize,shapeSize);
    line (500-30,yPos,shapeSize,shapeSize);
    line (500-70,yPos,shapeSize,shapeSize);
    shapeSize = shapeSize+30;
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

