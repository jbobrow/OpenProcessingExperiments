
int xPos = 0;
int yPos = 0;

int shapeSize = 10;
int count = 0;

void setup(){
  size(500, 500);
  background(255);
 
  smooth();
  noFill();
  rectMode(CENTER);
  frameRate(10);
}

void draw(){
  
  while (count<20){
     stroke(0);
    rect (250,250,shapeSize,shapeSize);
    
    shapeSize = shapeSize+30;
     
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

