
PImage cuteball;
PImage cuteball02;
float xPos = 100;
float yPos = 100;
int ballRadius=80;
int ballRadius01=80;
boolean isGoingRight = true;
boolean isGoingDown = true;

boolean isGoingRight01 = true;
boolean isGoingDown01 = true;
 
 
void setup(){
  size(800,600);
  background(0);
 
  cuteball = loadImage("ball.png");
  cuteball.resize(ballRadius*2,ballRadius*2);
  
  cuteball02 = loadImage("ball02.png");

  
  
   
  imageMode(CENTER);
}
 
void draw(){
  noStroke();
  background(0);
//  pushMatrix();
//  scale(.3);
  image(cuteball, xPos, yPos);
  image(cuteball02, xPos+80, yPos+80);
  
//  popMatrix();
   

 
//always moving down one pixel at a time
 //
 
 
 
 
 // X POSITION
  if(isGoingRight){
    // xPos = xPos + 9;
    xPos+=3;
  }
  else {
    // xPos = xPos - 3;
    xPos-=1;
  }
   if(isGoingRight01){
    // xPos = xPos + 9;
    xPos+=8;
  }
  else {
    // xPos = xPos - 3;
    xPos-=3;
  }
   
  
  if(xPos + ballRadius01 >= width){
     isGoingRight = false;
  }
   
  if(xPos - ballRadius01 <= 0) {
     isGoingRight = true;
  }
   
   if(isGoingRight01){
    // xPos = xPos + 9;
    xPos+=3;
  }

  
  if(xPos + ballRadius >= width){
     isGoingRight01 = false;
  }
   
  if(xPos - ballRadius <= 0) {
     isGoingRight01 = true;
     xPos+=8;
  }
   else {
    // xPos = xPos - 3;
    xPos-=1;
  }
   
 
//Y POSITION
  if(isGoingDown){
    // yPos = yPos + 5;
    yPos+=10;
  }
  else {
    // yPos = yPos - 3;
    yPos-=3;
  }
    if(isGoingDown01){
    // yPos = yPos + 5;
    yPos+=10;
  }
  else {
    // yPos = yPos - 3;
    yPos-=3;
  }
  
  if(yPos + ballRadius >= height){
     isGoingDown = false;
  }
   
  if(yPos - ballRadius <= 0) {
     isGoingDown = true;
  }
   if(yPos + ballRadius01 >= 200){
     isGoingDown01 = false;
  }
   
  if(yPos - ballRadius01 <= 0) {
     isGoingDown01 = true;
  }
}


