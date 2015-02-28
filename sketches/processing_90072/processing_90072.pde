
int xPos;
int yPos;
int xSpeed;
int ySpeed;

void setup() {
  size(800, 400);
  xPos=100;
  xSpeed = 3;
  yPos=50;
  ySpeed = 3;
}

void draw() {
  background(0, 0, 0);
  
//Paddles 
  if(mouseX<=width/2){        //Left Paddle
    rect(0,mouseY,30,70);
  }
    
  if(mouseX>=width/2){        //Right Paddle
    rect(770,mouseY,30,70);
  }
  
//Speed & Position of Ball
  
  if(xPos>=750 || xPos<=50){    //x-Position
    xSpeed = xSpeed*-1;
  }
  
  if(yPos>=height || yPos<=0){    //y-Position
    ySpeed = ySpeed*-1;
  }
 
 
  yPos-=ySpeed;
  xPos+=xSpeed;
  

  ellipse(xPos, yPos, 40, 40);
}


