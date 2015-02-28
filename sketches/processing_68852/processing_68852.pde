
/*
 S A N T I A G O - BOUNCING TETRIS
*/
 
//---------------------------------------------------------------------------// 
 
PImage FIG1;
PImage BACKG;



float xPosP=0;
float yPosP;
float xPos = 200;
float yPos = 200;
int FIG1Radius=80;

boolean isGoingRight = true;
boolean isGoingDown = true;


 
//-------------------------------- S E T U P--------------------------------//

void setup(){
  
  size(800,600);
 
  FIG1 = loadImage("FIG1.png");
    FIG1.resize(FIG1Radius*2,FIG1Radius*2);
  BACKG = loadImage("BACKG.png");
   
  imageMode(CENTER);
}
 
 
 //-------------------------------- D R A W ---------------------------------//

void draw(){
  
  noStroke();
  background(BACKG);
  
  image(FIG1, xPos, yPos);
 
 //----------------------------- X POSITION BLUE----------------------//
 
  if(isGoingRight){
    xPos+=3;
  }
  else {
    xPos-=3;
  }
   
  if(xPos + FIG1Radius >= width){
     isGoingRight = false;
  }
   
  if(xPos - FIG1Radius <= 0) {
     isGoingRight = true;
  }
   
 //----------------------------- Y POSITION BLUE-----------------------//
 
  if(isGoingDown){
    yPos+=3;
  }
  else {
    yPos-=3;
  }
  
  if(yPos + FIG1Radius >= height){
     isGoingDown = false;
  }
   
  if(yPos - FIG1Radius <= 0) {
     isGoingDown = true;
  }
}

