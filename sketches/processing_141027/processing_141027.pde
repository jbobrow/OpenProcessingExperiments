
void setup()
{
  size(800, 600);
  background(0);
  noSmooth();
  fill(255);
  stroke(0);
  textAlign(CENTER, CENTER);
  textSize(16);
}

int racketWidth=128;
int ballX;
int ballY;
float ballSpeedX;
float ballSpeedY;
int score=-1;
boolean start=false;
int[][] tab=new int[25][10];

void draw()
{
  background(0);

  text("SCORE: "+score, width/2, 16);

  //loop that draws the wall
  for (int i=0; i<25;i++)
  {
    for (int j=0;j<10;j++)
    {
      if (start==false)
      {
        tab[i][j]=1;  //at the beginning of the game, all bricks are filled
        fill(255);
      }
      else if (tab[i][j]==0)
      {
        fill(0);
      }
      else
      {
        fill(255);
      }
      rect(i*32, j*16+32, 32, 16);  //draw bricks
    }
  }

  fill(255);
  rect(mouseX-racketWidth/2, height-16, racketWidth, height);  //draw racket

    if (start==true)
  {
    if ((ballY>=height-32)&&(ballX>mouseX-racketWidth/2)&&(ballX<mouseX+racketWidth/2))  //if ball collides with racket
    {
      ballSpeedY=-ballSpeedY;
      ballSpeedX=ballSpeedX/abs(ballSpeedX)*map(abs(ballX-mouseX), 0, racketWidth/2, 1, 5);  //ballSpeedX depends of where the ball hits the racket (fast on the sides and slow at the middle)
      score++;
    }
    if (ballY<0)  //if ball collides with top of the screen
    {
      ballSpeedY=-ballSpeedY;
    }
    if ((ballX>=width-16)||(ballX<0))  //if ball collides with one of the sides of the screen
    {
      ballSpeedX=-ballSpeedX;
    }
  }
  else  //if the player hasn't clicked yet, the ball is sticked to the racket
  {
    ballSpeedX=0;
    ballSpeedY=0;
    ballX=mouseX-8;
    ballY=height-32;
  }

  if (ballY>height-16)  //if ball misses the racket
  {
    text("GAME OVER", width/2, height/2);
    noLoop();  //freeze the game
  }

  ballX+=ballSpeedX; 
  ballY+=ballSpeedY; 

  fill(255);
  rect(ballX, ballY, 16, 16);  //draw ball

  //loop that checks collisions between the ball and the bricks
  for (int i=0; i<25;i++)
  {
    for (int j=0;j<10;j++)
    {
      if ((tab[i][j]==1)&&(ballX>i*32)&&(ballX<(i+1)*32)&&(ballY<(j+1)*16+32))
      {
        tab[i][j]=0;
        score++;
        ballSpeedY=-ballSpeedY;
      }
    }
  }
}

void mouseClicked()
{
  ballSpeedX=1;
  ballSpeedY=5;
  start=true;
}

