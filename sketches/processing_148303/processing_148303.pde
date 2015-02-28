
float ballX = 60;
float ballY = 60;
float dX = 3;
float dY = 2;
float ballR = 20;
float paddleY = height * .5;
float paddleX = 20;
float paddleWidth = 19;
float paddleHeight = 60;

void setup() {

  size(600, 200);
}

void draw() {

//  noCursor(); 

  background(100, 100, 100);

  fill(200);
  noStroke();
//  rectMode(CORNER);
  rect(paddleX, paddleY - paddleHeight * .5, paddleWidth, paddleHeight, 4, 4, 4, 4);
   
  fill(200);
  noStroke();
  ellipse(ballX, ballY, ballR, ballR);
  
  paddleY = lerp(paddleY, mouseY, 0.1);


  if (ballY > height - ballR * .5)
  {  
    dY = -dY;
  }

  if (ballY < 0 + ballR * .5)
  {  
    dY = -dY;
  }  
 
  if (ballX > width - ballR * .5)
  {  
    dX = -dX;
  }
 
  if (ballX <= paddleX + paddleWidth + ballR * .5 && ballY >= paddleY && ballY <= paddleY + paddleHeight) 
  {  
    dX = -dX;
    ballX = paddleX+paddleWidth+ 4 + ballR * .5;
  }
 
  if (ballX < 0 + ballR *.5)
  {
    noLoop();
  }

  ballX = ballX + dX;
  ballY = ballY + dY;
  
}

void keyPressed()

{
  if (key==' ')
  {
    dX = 3;
    ballX = 60;
    loop();
  }
}

