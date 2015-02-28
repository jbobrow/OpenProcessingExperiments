
int xPos = 0;
int yPos = 0;
int shapeSize = 10;

void setup(){
  size(500, 500);
  background(0);
  noStroke();
  smooth();
  fill(0,90,212,10);
  frameRate(10);
}

void draw(){
  
  while (shapeSize<100){
    rect (xPos,yPos,shapeSize,shapeSize);
    ellipse (xPos+10,yPos,shapeSize,shapeSize);
    ellipse (xPos+30,yPos,shapeSize,shapeSize);
    rect (xPos+40,yPos,shapeSize,shapeSize);
    shapeSize = shapeSize+30;
  }
  
  xPos = xPos + 55;
  shapeSize = 10;
  
  if(xPos>500){
    yPos = yPos + 70;
    xPos = 0;
  }
}

