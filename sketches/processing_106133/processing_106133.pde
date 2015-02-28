
int ballSize;
int ballSize2;
float xPos1;
float yPos1;
float xPos2;
float yPos2;

float  x1;
float  y1;
float x2;
float  y2;

void setup(){
  size(600, 600);
  background(0);
  smooth();
  ballSize=100;
  ballSize2=70;
  xPos1=240;
  yPos1=300;
  xPos2=360;
  yPos2=300;
  

  
  
}

void draw(){
  
//////////draw the eye ball

  fill(255);
  noStroke();

  ellipse(xPos1,yPos1,ballSize,ballSize);
  ellipse(xPos2,yPos2,ballSize,ballSize);
  
  if(mousePressed){
    
  textSize(32);
  text("FIND YOU!", width/2-80, 100); 
  fill(0, 102, 153);
 
  x1=xPos1;
  y1=yPos1;
  x2=xPos2;
  y2=yPos2;
  
  fill(0);
  noStroke();
  ellipse(x1, y1,ballSize2,ballSize2); 
  ellipse(x2, y2,ballSize2,ballSize2);
  }
  
  else{
  
  
///////draw the black eye ball;
   fill(0);
   noStroke();
//////follow the mouse;   
  float  x1 = map(mouseX, 0, width, 240-ballSize/2, 360-ballSize/2-ballSize2/2);
  float  y1 = map(mouseY, 0, height, 300-ballSize/2, 300+ballSize/2);
  ellipse(x1, y1,ballSize2,ballSize2); 
  float x2 = map(mouseX, 0, width,240+ballSize/2+ballSize2/2, 360+ballSize/2);
  float  y2 = map(mouseY, 0, height, 300-ballSize/2, 300+ballSize/2);
  ellipse(x2, y2,ballSize2,ballSize2);
 
  }
   

}

  
  


