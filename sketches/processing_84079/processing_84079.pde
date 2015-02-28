
boolean left = false;
boolean play = false;
boolean gameOver = false;

class Home
{
  Home()
  {
  }
  void show()
  {
    fill(255);
    textSize(48);
    text("PONG", 180, 200);
    text("Click to Play!", 110, 300);
  }
}

class Ball
{
  int x,y;
  boolean dirup,diright;
  Ball()
  {
    x = 20;
    y = 25;
    dirup = false;
    diright = true;
  }
  //BOUNCING
  void bounce()
  {
    if (x<20)
    {
      diright = true;
    }
    if (y<20)
    {
      dirup = false;
    }
    if (x>480)
    {
      diright = false;
    }
    if (y>480)
    {
      dirup = true;
    }
  }
  //SHOW
  void show()
  {
    fill(255, 255, 255);
    ellipse(x, y, 50, 50);
  }
  void move()
  {
    if (diright ==true)
    {
      x= x + 5;
    }
    else
    {
      x = x - 5;
    }
    if (dirup == true)
    {
      y = y - 4;
    }
    else
    {
      y= y + 4;
    }
  }
}

class Paddle
{
  int px, py;
  Paddle()
  {   
    px = 200;
    py = 450;
  }
  void move()
  {
    if (keyPressed== true && keyCode==LEFT && px>1)
    {
      px=px - 5;
    }
    else if (keyPressed==true && keyCode==RIGHT && px<430)
    {
      px= px +5;
    }
  }
  void show()
  {
    fill(255);
    rect(px, py, 70, 15);
  }
}

class PaddleC
{
  int cx, cy;
  PaddleC()
  {   
    cx = 200;
    cy = 50;
  }
  void move()
  {
    if (cx>1)
    {
      cx=cx - 5;
    }
    else if (cx<430)
    {
      cx= cx +5;
    }
  }
  void show()
  {
    fill(255);
    rect(cx, cy, 70, 15);
  }
}
//GAME BALL
class Ballct
{
boolean dirup1,diright1;
int x1, y1;
  Ballct()
  {
    x1 = 250;
    y1 = 250;
    dirup1 = false;
    diright1 = true;
  }
  //BOUNCING
  void bounce()
  {
    if (x1<20)
    {
      diright1 = true;
    }
    if (y1<20)
    {
      dirup1 = false;
    }
    if (x1>480)
    {
      diright1 = false;
    }
    if (y1>480)
    {
      gameOver = true;
    }
    if (get(x1,y1+15) == color(255))
    {
      dirup1 = true;
    }
  }
  //SHOW
  void show()
  {
    fill(255, 255, 255);
    ellipse(x1, y1, 30, 30);
  }
  void move()
  {
    if (diright1 ==true)
    {
      x1= x1 + 5;
    }
    else
    {
      x1 = x1 - 5;
    }
    if (dirup1 == true)
    {
      y1 = y1 - 4;
    }
    else
    {
      y1= y1 + 3;
    }
  }
}
Home homes;
Ball thing;
Paddle hi;
PaddleC ko;
Ballct game;
void setup()
{
  homes = new Home();
  thing = new Ball();
  hi = new Paddle();
  ko = new PaddleC();
  game = new Ballct();
  size(500, 500);
  frameRate(51);
  background(0);
  noStroke();
  smooth();
}
void draw()
{
  fill(0, 0, 0, 50);
  rect(0, 0, 500, 500);
  noStroke();

  if (play==false)
  {
    homes.show();
    thing.bounce();
    thing.move();
    thing.show();
  }
  else if(gameOver ==false)
  {
    ko.show();
    hi.show();
    game.show();
    ko.move();
    hi.move();
    game.bounce();
    game.move();
  }
  if(gameOver ==true)
{
  noLoop();
  textSize(36);
  text("GAME OVER",150,250);
}
}
void mouseClicked()
{
  if (mouseX >-1 && mouseX <501  && mouseY >-1 && mouseY < 501)
  {
    play = true;
  }
}
