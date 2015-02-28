
int randomShape;
int randomColor;

void setup(){
  frameRate(12);
  size(400, 400);
  noCursor();
}

void draw(){
  background(200);
  
  // four corners shapes
  for(int xPos=0; xPos<2; xPos++){
    for(int yPos=0; yPos<2; yPos++){
      int x= xPos*300+50;
      int y= yPos*300+50;
      randomShape = int(random(0, 3));
      randomColor = int(random(0, 255));
      drawShape(randomShape, x, y, 50, 50, randomColor);
    }
  }
  
  // draw mouse shapes
  randomShape = int(random(0, 3));
  randomColor = int(random(0, 255));
  drawShape(randomShape, mouseX, mouseY, 50, 50, randomColor);
}

void drawShape(int shapeType, float centerX, float centerY, float sizeX, float sizeY, color C){
  fill(C);
  
  if(shapeType == 0){
    line(centerX-sizeX/2, centerY-sizeY/2, centerX+sizeX/2, centerY+sizeY/2);
    line(centerX-sizeX/2, centerY+sizeY/2, centerX+sizeX/2, centerY-sizeY/2);
  }
  if(shapeType == 1){
    triangle(centerX, centerY-sizeY/2, centerX+sizeX/2, centerY+sizeY/2, centerX-sizeX/2, centerY+sizeY/2);
  }
  if(shapeType == 2){
    rectMode(CENTER);
    rect(centerX, centerY, sizeX, sizeY);
  }
  if(shapeType == 3){
    ellipse(centerX, centerY, sizeX, sizeY);
  }
}
