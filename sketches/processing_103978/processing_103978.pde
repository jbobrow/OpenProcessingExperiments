
int sizeX = 174;
int sizeY = 200;
int paddlePos = sizeX/2;
int ballX = sizeX/2;
int ballY = 5;
boolean pause = true;
boolean down = true;
int yangle = 0;
int score = 0;
int lastScore = 0;
boolean instructions = true;


void setup()
{
  background(28, 153, 237);
  size(sizeX, sizeY);
}

void draw()
{
  background(28, 153, 237);
  fill(0,200,0);
  textSize(20);
  text("...fucken", 100, 133);
  noStroke();
  fill(255);
  rect(paddlePos - 25, height - 10, 50, 5);
  fill(0, 0, 0);
  ellipse(ballX, ballY, 10, 10);
  if (instructions)
  {
    textSize(8);
    text("Space to Start, ", 65, 130); 
    text("Click to make the paddle move", 40, 150); 
    text("P to Pause, Space to unpause", 41, 170);
  }
  if (pause == false)
  {
    if (mousePressed && paddlePos < (width - 25))
    {
      paddlePos++;
    }
    else if (paddlePos > 25)
    {
      paddlePos--;
    }
    if ((ballY < height) && (down == true))
    {
      ballY++; 
      ballX+=yangle;
    }
    else
    {
      ballY--; 
      ballX+=yangle;
    }
    if ((ballX > paddlePos - 25) && (ballX < paddlePos +25) && 
      (ballY == height - 11))
    {
      down = false; 
      isBetween(-200, 200, 1);
      isBetween(0, 10, 1);
      isBetween(9, 20, 4);
      isBetween(19, 25, 7);
      isBetween(1, -10, -2);
      isBetween(-9, -20, -5);
      isBetween(-19, -25, -8);
      score++;
    }
    if (ballY == 5)
    {
      down = true;
    }
    if (ballY == height)
    {
      ballY = 5; 
      yangle = 0;
      lastScore = score;
      score = 0;
    }
    if (ballX >= width - 5)
    {
      yangle *= -1;
    }
    if (ballX <= 5)
    {
      yangle *= -1 ;
    }
  }
  showScore();
}

void keyPressed()
{
  if (key == ' ')
  {
    pause = false;
    instructions = false;
  } 
  if (key == 'p')
  {
    pause = true;
  }
}



void mouseRelease()
{
  paddlePos--;
}

void isBetween (int A, int B, int C)
{
  if ((ballX < paddlePos + A) && (ballX > paddlePos + B))
  {
    yangle = C;
  }
}

void showScore()
{
  fill(255);
  textSize(12);
  text("Score" + " " + score, 10, 15); 
  text("Last Score" + " " + lastScore, 100, 15);
}
