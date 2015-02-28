
//Julie O, CP1 Mods 4/5, Pong

int pYdirection = RIGHT;
int pOdirection = LEFT;
boolean right = true;
boolean down = true;
Ball ballA = new Ball();
Paddle paddleYou = new Paddle();
Paddle paddleOpponent = new Paddle();

void setup()
{
  size(300, 300);
  smooth();
  frameRate(250);
  keyCode = RIGHT;
}

void draw()
{
  background(67, 0, 67);
  paddleYou.move();
  paddleYou.show();
  paddleOpponent.move();
  paddleOpponent.show();
  ballA.move();
  ballA.bounce();
  ballA.show();
}

class Ball
{
  int bx;
  int by;
  Ball()
  {
    bx = 20;
    by = 50;
  }
  void move()
  {
    if (right == true)
    {
      bx++;
    }
    else
    {
      bx--;
    }
    if (down == true)
    {
      by++;
    }
    else
    {
      by--;
    }
  }
  void bounce()
  {
    if (bx>295) //boolean
    {
      right = false;
    }
    if (bx<5)
    {
      right = true;
    }
    if (get(bx, by + 10) == color(6, 206, 209))
    {
      down = false;
    }
    if (get(bx, by - 10) == color(0, 201, 87))
    {
      down = true;
    }
    if (by>300)
    {
      fill(0, 201, 87); //green happy face, green wins
      ellipse(50, 125, 50, 50);
      fill(0, 0, 0);
      ellipse(40, 115, 5, 15);
      ellipse(60, 115, 5, 15);
      arc(50,130,25,20,0,PI);
      fill(6, 206, 209); //blue sad face, blue loses
      ellipse(250, 175, 50, 50);
      fill(0, 0, 0);
      ellipse(260, 165, 5, 15);
      ellipse(240, 165, 5, 15);
      rect(235, 185, 30, 2);
    }
    if (by<0)
    {
      fill(0, 201, 87); //green sad face, green loses
      ellipse(50, 125, 50, 50);
      fill(0, 0, 0);
      ellipse(40, 115, 5, 15);
      ellipse(60, 115, 5, 15);
      rect(35, 135, 30, 2);

      fill(6, 206, 209); //blue happy face, blue wins
      ellipse(250, 175, 50, 50);
      fill(0, 0, 0);
      ellipse(260, 165, 5, 15);
      ellipse(240, 165, 5, 15);
      arc(250,180,25,20,0,PI);
    }
  }
  void show()
  {
    fill(255, 255, 255);
    ellipse(bx, by, 20, 20);
  }
}

class Paddle
{
  int pYx = 150;
  int pOx = 50;
  void move()
  {
    if (keyCode == RIGHT)
    {
      pYdirection = RIGHT;
      pYx++;
      if (pYx>250)
      {
        pYx = 250;
      }
    }
    else if (keyCode == LEFT)
    {
      pYdirection = LEFT;
      pYx--;
      if (pYx<0)
      {
        pYx = 0;
      }
    }
    if (keyPressed == true && key == '1') 
    {
      pOdirection = LEFT;
      pOx--;
      if (pOx<0)
      {
        pOx = 0;
      }
    }
    else if (keyPressed == true && key =='2')
    {
      pOdirection = RIGHT;
      pOx++;
      if (pOx>250)
      {
        pOx = 250;
      }
    }
  }
  void show()
  {
    fill(6, 206, 209); //blue, you
    rect(pYx, 284, 50, 15);
    fill(0, 201, 87); //green, opponent
    rect(pOx, 0, 50, 15);
  }
}
