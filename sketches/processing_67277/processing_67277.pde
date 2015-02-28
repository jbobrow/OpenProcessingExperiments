
PFont font;
int p1Score;
int p2Score;
int p1Y;
int p2Y;
int ballPosX;
int ballPosY;
int ballVelocityX;
int ballVelocityY;
boolean upPressed;
boolean downPressed;
boolean wPressed;
boolean sPressed;

//Constants:
int p1X;
int p2X;
int paddleWidth;
int paddleHeight;
int ballSize;
int playerSpeed;
boolean gameOver;

void setup ()
{
  size(800, 600);
  smooth();
  p1Score = 0;
  p2Score = 0;
  p1Y = 300;
  p2Y = 300;
  ballPosX = 400;
  ballPosY = 300;
  ballVelocityY = 4;
  ballVelocityX = 4;
  playerSpeed = 6;
  gameOver = false;
  upPressed = false;
  downPressed = false;
  wPressed = false;
  sPressed = false;

  p1X = 30;
  p2X = width - 60;
  paddleWidth = 30;
  paddleHeight = 60;
  ballSize = 20;
  font = loadFont("AgencyFB-Reg-48.vlw");
  textFont(font, 48);
}

void draw()
{ 
  if (upPressed == true)
  {
    p2Y-=playerSpeed;
  }
  if (downPressed == true)
  {
    p2Y+=playerSpeed;
  }
  if (wPressed == true)
  {
    p1Y-=playerSpeed;
  }
  if (sPressed == true)
  {
    p1Y+=playerSpeed;
  }

  if (gameOver == false)
  {
    background(0);
    text(p1Score, 20, 50);
    text(p2Score, 730, 50);
    rect(p1X, p1Y, paddleWidth, paddleHeight);
    rect(p2X, p2Y, paddleWidth, paddleHeight);  
    ellipse(ballPosX, ballPosY, ballSize, ballSize);
    ballPosX += ballVelocityX;
    ballPosY += ballVelocityY;

    if (p1Y < 0) {
      p1Y = 0;
    }
    if (p2Y < 0) {
      p2Y = 0;
    }
    if (p1Y + paddleHeight > 600) {
      p1Y = height - paddleHeight;
    }
    if (p2Y + paddleHeight > 600) {
      p2Y = height - paddleHeight;
    }

    if (ballPosY < 10 || ballPosY > 590) {
      ballVelocityY *= -1;
    }

    if (ballPosX > p1X && ballPosX < p1X + paddleWidth && ballPosY > p1Y 
      && ballPosY < p1Y + paddleHeight)
    {
      ballVelocityX *= -1;
    } 

    if (ballPosX > p2X && ballPosX < p2X + paddleWidth && ballPosY > p2Y 
      && ballPosY < p2Y + paddleHeight)
    {
      ballVelocityX *= -1;
    } 

    if (ballPosX < 0) {
      p2Score = p2Score + 10;
      ballPosX = 400;
      ballPosY = 300;
      ballVelocityX *= -1;
    }

    if (ballPosX > 800) {
      p1Score = p1Score + 10;
      ballPosX = 400;
      ballPosY = 300;
      ballVelocityX *= -1;
    }

    if (p1Score > 100 || p2Score > 100) {
      gameOver = true;
      background(0);
      p1Score = 0;
      p2Score = 0;
      text ("Game Over", 350, 300);
    }
  }
}


void keyPressed()
{
  if (keyCode == UP)
  {
    upPressed = true;
  }
  if (keyCode == DOWN)
  {
    downPressed = true;
  }
  if (keyCode == 'W')
  {
    wPressed = true;
  }
  if (keyCode == 'S')
  {
    sPressed = true;
  }
  
    if (keyCode == ENTER)
  {
    gameOver = false;
  }
}

void keyReleased()
{
   if (keyCode == UP)
  {
    upPressed = false;
  }
  if (keyCode == DOWN)
  {
    downPressed = false;
  }
  if (keyCode == 'W')
  {
    wPressed = false;
  }
  if (keyCode == 'S')
  {
    sPressed = false;
  } 
}
