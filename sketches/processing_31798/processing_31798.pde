
int xPos = 0;
int yPos = 0;
int shapeSize = 10;
int count = 0;
int trans = 100;
int trans2 = 20;

void setup(){
  size(500, 500);
  background(0);
 
  smooth();
  ellipseMode(CORNER);
  frameRate(10);
}

void draw(){
  
  while (count<20){
    fill(random(255),random(255),random(255),20);
     stroke(random(255),random(255),random(255),trans2);
    ellipse (xPos,yPos,shapeSize,shapeSize);
    stroke(77,218,255,trans);
    
    shapeSize = shapeSize+30;
    trans = trans - 7;
    trans2 = trans2 + 5;
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

