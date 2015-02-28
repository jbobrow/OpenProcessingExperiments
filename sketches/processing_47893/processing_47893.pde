
float fillColor;

int ballOneSize = 50;
float ballOneX;
float ballOneY;
float ballOneSpeedX = 2.8;
float ballOneSpeedY = 2.2;
float ballOneDirectionX = 1;
float ballOneDirectionY = 1;

int ballTwoSize = 50;
float ballTwoX;
float ballTwoY;
float ballTwoSpeedX = 2.8;
float ballTwoSpeedY = 2.2;
float ballTwoDirectionX = 1;
float ballTwoDirectionY = 1;

int ballThreeSize = 50;
float ballThreeX;
float ballThreeY;
float ballThreeSpeedX = 2.8;
float ballThreeSpeedY = 2.2;
float ballThreeDirectionX = 1;
float ballThreeDirectionY = 1;

void setup(){
  
  size(800, 800);
  smooth();
  noStroke();
  ballOneX = 200;
  ballOneY = height/2;
  ballTwoX = 400;
  ballTwoY = height/2;
  ballThreeX = 600;
  ballThreeY = height/2;
  
  fillColor = 100;
  colorMode(HSB, 360, 100, 100);
  
}

void draw(){
  
  //background(225);
  
  ballOneX = ballOneX + (ballOneSpeedX * ballOneDirectionX);
  ballOneY = ballOneY + (ballOneSpeedY * ballOneDirectionY);
  
  
  if(ballOneX > width-ballOneSize || ballOneX < 0 ){
   ballOneDirectionX = ballOneDirectionX * -1; 
  }
  
  if(ballOneY > height-ballOneSize || ballOneY < 0 ){
   ballOneDirectionY = ballOneDirectionY * -1; 
  }
  
    fillColor = map(ballOneX, 0,width, 50,100);
     fill(fillColor, 100, 100);
  ellipse(ballOneX + ballOneSize/2, ballOneY + ballOneSize/2, ballOneSize, ballOneSize);
  
  
  
  
  ballTwoX = ballTwoX + (ballTwoSpeedX * ballTwoDirectionX);
  ballTwoY = ballTwoY + (ballTwoSpeedY * ballTwoDirectionY);
  
  
  if(ballTwoX > width-ballTwoSize || ballTwoX < 0 ){
   ballTwoDirectionX = ballTwoDirectionX * -1; 
  }
  
  if(ballTwoY > height-ballTwoSize || ballTwoY < 0 ){
   ballTwoDirectionY = ballTwoDirectionY * -1; 
  }
  
      fillColor = map(ballTwoX, 0,width, 110,150);
     fill(fillColor, 100, 100);
  ellipse(ballTwoX + ballTwoSize/2, ballTwoY + ballTwoSize/2, ballTwoSize, ballTwoSize);
  
  
  
  
  
  
  
  ballThreeX = ballThreeX + (ballThreeSpeedX * ballThreeDirectionX);
  ballThreeY = ballThreeY + (ballThreeSpeedY * ballThreeDirectionY);
  
  
  if(ballThreeX > width-ballThreeSize || ballThreeX < 0 ){
   ballThreeDirectionX = ballThreeDirectionX * -1; 
  }
  
  if(ballThreeY > height-ballThreeSize || ballThreeY < 0 ){
   ballThreeDirectionY = ballThreeDirectionY * -1; 
  }
  
      fillColor = map(ballThreeX, 0,width, 160,200);
     fill(fillColor, 100, 100);
  ellipse(ballThreeX + ballThreeSize/2, ballThreeY + ballThreeSize/2, ballThreeSize, ballThreeSize);
  
  
}

