
// Lucky Wen, Bouncing Ball, CP1 mods 16-17


int z=0;

int x = 200;
int y = 380;
thing pad;
ball bob;
boolean gameOver = false;

void setup()
{
  pad= new thing();
  bob= new ball();
  size(400, 400);
   frameRate(150);
 
}

void draw()
{
  if (gameOver ==true)
  {
    smooth();
    textSize(30);
    textAlign(CENTER);
    text("You Got:" + z +" Try Again", 200, 300);
  }
  else

  background (0, 0, 0);
  pad.showup();
  pad.keyPressed();
  bob.move();
  bob.bounce();
  bob.show();
  stroke(250, 0, 0);
  textAlign(CENTER);
  text("You Got:" + z +" point(s).", 200, 300);
}

class ball
{
  int x, y;
  boolean up, right;

  ball()
  {
    x=int (random(400));
    y=int(random(100, 300));
    up=true;
    right=random(1)<.5;
  }

  void move()
  {

    if (up== true)
    {

      y=y-2;
    }
    else
    {

      y=y+2;
    }
    if (right== true)
    {

      x=x+2;
    }
    else
    {

      x=x-2;
    }
  }
  void show()
  {

    smooth();
    fill(255);
    ellipse(x, y, 15, 15);
  }


  void bounce()
  {

    if (x>400)
    {

      right = false;
    }
    if (x<0)
    {

      right = true;
    }

    if (y<0)
    {

      up= false;
    }

    if (y>410)
    {

      gameOver= true;
      background(0);
    }
    if (get(x, y+12) == color(254))
    {
      z++;
      up= true;
    }
  }
}

class thing
{
  int p;
  thing()
  {
    p=200;
  }
  void keyPressed()
  {
    if ( keyPressed== true && key =='a')

    {
      p=p-4;
    }
    if ( keyPressed== true && key =='d')
    {
      p=p+4;
    }
    if (p>350)
    {
      p=350;
    }
    if (p<0)
    {
      p=0;
    }
  }


  void showup()
  {
    fill(254);
    rect(p, 390, 60, 10);
  }
}




