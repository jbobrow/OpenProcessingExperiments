
Ball tim;
Paddle human;
Paddle hum2;
int score=0;
void setup()
{
  human= new Paddle();
  hum2= new Paddle();
  tim= new Ball();
  size(700, 400);
  frameRate(100);
  smooth();
  textSize(32);
}

void draw()
{
  background(0);
  human.showw();
  hum2.showw();
  tim.show();
  tim.bounce();
  tim.move();

  if (keyPressed== true && keyCode==UP)
  {
    hum2.moveUp();
  }
  if (keyPressed==true && keyCode==DOWN)
  {
    hum2.moveDown();
  }
  hum2.whereX=685;
  hum2.col1=0;
  human.col2=0;
  if (keyPressed== true && key=='w')
  {
    human.moveUp();
  }
  if (keyPressed==true && key=='s')
  {
    human.moveDown();
  }
  
  text(score,350,50);
}

class Paddle
{
  int whereX;
  int whereY;
  int col1;
  int col2;

  Paddle()
  {
    whereX=10;
    whereY=200;
    col1=255;
    col2=255;
  }

  void showw()
  {

    fill(col1, 0, col2);
    rect(whereX, whereY, 7, 50);
  }
  void moveDown()
  {
    whereY=whereY+2;
  }
  void moveUp()
  {
    whereY=whereY-2;
  }
  void cMove()
  {
    
  }
}

class Ball
{
  int siz;
  int colour;
  int placeX;
  int placeY;
  int x;
  int y;

  Ball()
  {
    placeX=int( random(0, 500));
    placeY=int( random(0, 500));
    siz=10;
    x=y=2;
    colour=255;
  }

  void show()
  {
    fill(colour);
    ellipse(placeX, placeY, siz, siz);
  }

  void move()
  {
    placeX=placeX+x;
    placeY=placeY+y;
  }

  void bounce()
  {
    if (placeX > 695)
    {
      x=-2;
      fill(random(0, 256), random(0, 256), random(0, 256));
      score=0;
    }
    if (placeY > 395)
    {
      y=-2;
      fill(random(100, 256), random(100, 256), random(100, 256));
    }
    if (placeX<5)
    {
      x=2;
      fill(random(100, 256), random(100, 256), random(100, 256));
      score=0;
    }
    if (placeY<5)
    {
      y=2;
      fill(random(100, 256), random(100, 256), random(100, 256));
    }

    if (get(placeX-7, placeY) == color(255, 0, 0))
    {
      x=2;
      score++;

    }
      if (get(placeX+6, placeY) == color(0,0,255))
    {
      x=-2;
      score++;

    }
    
  }
}
