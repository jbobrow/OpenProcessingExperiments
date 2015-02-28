
//Montana C, CP1, 4/5
ball bass;
paddle master;
int goal1=0;
int goal2=0;
float x = 360;
float y = 62;
float z = 350;
float xDirection = 1;
float yDirection = 1;
float paddleWidth = 60;
float paddleOffset = 20;
float paddleY;
float paddleTop;
float paddleBottom;

void setup()
{
  size(730, 490);
  textSize(300);
  textAlign(CENTER);
  frameRate(120);
  bass = new ball();
  master = new paddle();
}

void draw()
{
  background(0);
  noStroke();
  paddleY = mouseY;
  paddleTop = mouseY - 100/2;
  paddleBottom = mouseY + 100/2;
  master.paddle();
  master.badpaddle(); 
  master.collision(); 
  master.opponent();
  bass.movement();
  bass.bounce();
  bass.ball();
  text(""+goal1, 540, 340);
  text(""+goal2, 180, 340);

  //The "field"----------
  rect(360, 20, 5, 20);
  rect(360, 60, 5, 20);
  rect(360, 100, 5, 20);
  rect(360, 140, 5, 20);
  rect(360, 180, 5, 20);
  rect(360, 220, 5, 20);
  rect(360, 260, 5, 20);
  rect(360, 300, 5, 20);
  rect(360, 340, 5, 20);
  rect(360, 380, 5, 20);
  rect(360, 420, 5, 20);
  rect(360, 460, 5, 20);
  rect(360, 10, 650, 10);
  rect(360, 470, 650, 10);
  //----------------------

  if (goal1>=5)
  {
    fill (random(255), random(255), random(255));
    text(""+goal1, 540, 340);
    fill(255);
  }
  if (goal2>=5)
  {
    fill (random(255), random(255), random(255));
    text(""+goal2, 540, 340);
    fill(255);
  }
}

class ball
{
  void ball()
  {
    rect(x, y, 20, 20);
  }

  void bounce()
  {
    if (x > width || x < 5 || x> 725) 
    {
      xDirection = xDirection * -1;
    }
    if (y > height || y < 20 || y> 460) 
    {
      yDirection = yDirection * -1;
    }
    if (get((int)x, (int)y)!=color(0))
    {
      xDirection = xDirection * -2;
    }
    if (get((int)x, (int)y) !=color(0))
    {
      yDirection = -1 * 1;
      yDirection = 1 * 1;
      yDirection = random(-2, 2);
    }
    if (x<5)
    {
      goal1= goal1+1;
      x=360;
      xDirection = -2;
    }
    if (x>725)
    {
      goal2= goal2+1;
      x=360;
      xDirection = 2;
    }
  }

  void movement()
  {
    x = x + 3 * xDirection;
    y = y + 3 * yDirection;
  }
}

class paddle
{
  void paddle()
  {
    rectMode(CENTER);
    rect(paddleOffset, paddleY, 20, 100);
  }

  void collision()
  {
    if ((x + 100 - paddleOffset < 100 + paddleOffset)
      && (y + 10 >= paddleTop)
      && (y + 10 <= paddleBottom)) 
    {
      xDirection = 2 * 1;
    }
    if ((x + 100 - paddleOffset < 100 + paddleOffset)
      && (y + 10 >= paddleTop)
      && (y + 10 <= paddleBottom)) 
    {
      yDirection = 1 * 1;
      yDirection = -1 * 1;
      yDirection = random(-2, 2);
    }
  }

  void badpaddle()
  {
    rectMode(CENTER);
    rect(700, z, 20, 100);
  }

  void opponent()
  {
    if (z<=y && x>=480)
    {
      z=z+6;
    }
    if (z>=y && x>=480)
    {
      z=z-6;
    }
    if (z>=510)
    {
      z=510;
    }
  }
}
