
//Will Slotterback CP1 16/17 Pong 

// holds the width of the screen
int sizx = 500; 
// holds the length of the screen
int sizy = 400;

//holds score of the player
int score = 0;

// holds score of the computer player
int cScore = 0;

//length of the paddle
int paddleLength = 35;

// The Ball
Ball one;
float ballSpeed = 3.4;
int paddleSpeed = 3;

// Human Paddle
Brick paddle; 

// Computer Controlled Paddle
compBrick cPaddle;

// If game is over or not
boolean gameOver = false;

void setup()
{
  size(sizx, sizy);
  background(0);
  one = new Ball();
  paddle = new Brick();
  cPaddle = new compBrick();
}
void draw()
{
  if (gameOver==false)
  {
    ballSpeed=ballSpeed+.0003;
    background(0);
    fill(255);
    textSize(40);
    text(+score, sizx/2-100, 50);
    text(+cScore, sizx/2+80, 50);
    stroke(255);
    line(sizx/2, 0, sizx/2, sizy);
    noFill();
    ellipse(sizx/2, sizy/2, 80, 80);
    one.move();
    one.bounce();
    one.show();
    if (mouseY>paddle.y)
    {
      paddle.moveDown();
    }
    if (mouseY<paddle.y)
    {
      paddle.moveUp();
    }
    paddle.show();
    if (one.right==true)
    {
      if (one.y>cPaddle.y)
      {
        cPaddle.moveDown();
      }
      if (one.y<cPaddle.y)
      {
        cPaddle.moveUp();
      }
    }
    cPaddle.show();
  }
  else
  {
    if (one.x>sizx)
    {
      score++;
    }
    if (one.x<0)
    {
      cScore++;
    }
    one.y = sizy/2;
    one.x = sizx/2;
    int dir = int(random(1, 3));
    if (dir == 1)
    {
      one.right=true;
    }
    if (dir == 2)
    {
      one.right=false;
    }
    ballSpeed=3.4;

    gameOver=false;
  }
  if (score>6 || cScore>6)
  {
    gameOver=true;
    if (score>6)
    {
      textSize(30);
      text("Player 1 wins!", sizx/2-100, sizy/2);
    }
    if (cScore>6)
    {
      textSize(30);
      text("Computer wins!", sizx/2-100, sizy/2);
    }
  }
}

void mousePressed()
{
  if (mousePressed==true && gameOver==true)
  {
    gameOver=false;
    one.y=sizy/2;
    one.x=sizx/2;
    score=0;
    cScore=0;
  }
}
class Ball
{
  float x, y;
  boolean up, right;
  Ball()
  {
    x=sizx/2;
    y=sizy/2;
    up=true;
    right=true;
  }
  void move()
  {
    if (right==true)
    {
      x=x+ballSpeed;
    }
    else
    {
      x=x-ballSpeed;
    }
    if (up==true)
    {
      y=y-ballSpeed;
    }
    else
    {
      y=y+ballSpeed;
    }
  }
  void bounce()
  {
    if (y>sizy)
    {
      up=true;
    }
    if (y<0)
    {
      up=false;
    }
    if (x>sizx)
    {
      right=false;
      gameOver=true;
    }
    if (x<0)
    {
      right=true;
      gameOver=true;
    }
    if (x>5 && x<25 && y<paddle.y+paddleLength && y>paddle.y-paddleLength)
    {
      right=!right;
    }
    if (x>sizx-25 && x<sizx-5 && y<cPaddle.y+paddleLength && y>cPaddle.y-paddleLength)
    {
      right=!right;
    }
  }
  void show()
  {
    fill(255);
    ellipse(x, y, 20, 20);
  }
}
class Brick
{
  int y;
  void Brick()
  {
    y=sizy/2;
  }
  void moveUp()
  {
    y=y-paddleSpeed;
  }
  void moveDown()
  {
    y=y+paddleSpeed;
  }
  void show()
  {
    fill(255, 0, 0);
    beginShape();
    vertex(5, y+paddleLength);
    vertex(25, y+paddleLength);
    vertex(25, y-paddleLength);
    vertex(5, y-paddleLength);
    endShape(CLOSE);
  }
}
class compBrick
{
  int y;
  void compBrick()
  {
    y=sizy/2;
  }
  void moveUp()
  {
    y=y-paddleSpeed;
  }
  void moveDown()
  {
    y=y+paddleSpeed;
  }
  void show()
  {
    fill(255, 0, 0);
    beginShape();
    vertex(sizx-5, y+paddleLength);
    vertex(sizx-25, y+paddleLength);
    vertex(sizx-25, y-paddleLength);
    vertex(sizx-5, y-paddleLength);
    endShape(CLOSE);
  }
}
