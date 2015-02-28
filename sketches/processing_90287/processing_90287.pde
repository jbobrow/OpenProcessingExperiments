

void setup(){
  size (600, 400);
  xPos=100;
  xSpeed = 3;
  yPos=50;
  ySpeed = 3;
  paddle = 10;
  paddlespeed = 3;

}

void draw(){
  background (0); 
  
  //DEFINES BOUNDARIES OF BALL
     if(xPos>=573 || xPos<=30){    //X-Position
    xSpeed = xSpeed*-1;
  }
  
  if(yPos>=height-17|| yPos<=15){  //Y-Position
    ySpeed = ySpeed*-1;
  }
  
  yPos-=ySpeed;
  xPos+=xSpeed;
  
  ellipse(xPos, yPos, 40, 40);
 
  // paddle
  
  rect(590, paddle, 10, 70);
  
  if (mouseX){
    rect(0, mouseY, 10, 70);
  }
  
  if (keyPressed == true) {
    if (key == 's') {
    paddle = paddle+4;
    }
    else if (key == 'w') {
     paddle = paddle-4;
    }  
   
  }
}


