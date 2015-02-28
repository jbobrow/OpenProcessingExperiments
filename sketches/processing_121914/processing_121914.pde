
int colour;
char RG;
int ballX;
int ballY;
int ballSpeedX;
int ballSpeedY;
int enemyY;
int playerScore;
int enemyScore;

void setup()
{
   size(500,500);      
   colour = 255;
   ballX = 250;
   ballY = 250;
   ballSpeedX = 2;
   ballSpeedY = 0;
   RG = 'g';
   playerScore = 0;
   enemyScore = 0;
}

void draw() 
{      
 //Background.
 colour += 10;
 if (RG == 'r')
  background(255, colour, colour);  
 else if (RG == 'g')
  background(colour, 255, colour);     
 
 //Player.
 player();
 
 //Enemy.
 enemy();
 
 //Moves the ball.
 ball();
 
 //Bounce of walls.
 walls();
 
 //Draws the score to the screen.
}

void player()
{
  rect(480, mouseY - 40, 20, 80);
}

void enemy()
{
 if (enemyY < ballY)
 {
  enemyY += 2; 
 }
 else if (enemyY > ballY)
 {
  enemyY -= 2; 
 }
 if (ballX < 30 && ballY < enemyY + 50 && ballY > enemyY - 50)
 {
   //Chagnes the balls direction.
   ballSpeedX *= -1;
   
   //Changes vertical speed.
   ballSpeedY = (ballY - enemyY) / 10; 
 }
 rect(0, enemyY - 40, 20, 80); 
}

void ball()
{
 ballX += ballSpeedX;
 ballY += ballSpeedY;
 if (ballX > 470 && ballY < mouseY + 50 && ballY > mouseY - 50)
 {
   //Chagnes the balls direction.
   ballSpeedX *= -1;
   
   //Changes vertical speed.
   ballSpeedY = (ballY - mouseY) / 10; 
 }
 //Draws the ball.
 rect(ballX - 10, ballY - 10, 20, 20);
}

void walls()
{
 //Checsk if the ball has hit the left or right walls.
 if (ballX < 10 || ballX > 490)
 {
  //If the ball has gone to the left then flash green.
  if (ballX < 10)
  {
   background(0,255,0);
   RG = 'g';
   playerScore++;
  }
  //else flash red.
  else if (ballX > 490)
  {
   background(255,0,0);
   RG = 'r';
   enemyScore++;
  }
  
  ballX = 250;
  ballY = 250;
  ballSpeedY = 0;
  ballSpeedX = 2;
  colour = 0;
 }
 
 if (ballY < 10 || ballY > 490)
 {
  ballSpeedY *= -1; 
 }
}


