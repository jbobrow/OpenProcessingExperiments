
//Benjamin Z. Mods 16/17. Computer Programming 1. Bouncing Ball
Ball bob;
Ball bill;
Ball aaa;
Ball ccc;
Ball steve;
Ball qwer;
void setup()
{
  frameRate(500);
  size(600, 600);
  bob=new Ball();
  bill=new Ball();
  ccc=new Ball();
  aaa=new Ball();
  steve=new Ball();
  qwer=new Ball();
}

void draw()
{
  background(0);
  bob.move();
  bob.bounce();
  bob.show();
  bill.move();
  bill.bounce();
  bill.show();
  ccc.move();
  ccc.bounce();
  ccc.show();
  aaa.move();
  aaa.bounce();
  aaa.show();
  steve.move();
  steve.bounce();
  steve.show();
  qwer.move();
  qwer.bounce();
  qwer.show();
}

class Ball
{
  int x, y,a,b,z;
  boolean up, right;
  Ball()
  {
   
    x=int(random(600));
    y=int(random(600));
    up=false;
    right=false;
  }

void move()
{
  if (right==true)
  {
    x=x+3;
  }
  if (right==false)
  {
    x=x-3;
  }
  if (up==true)
  {
    y=y-3;
  }
  if (up==false)
  {
    y=y+3;
  }
}
void bounce()
{
  if (x<0)
  {
    right=true;
  }
  if (x>600)
  {
    right=false;
  }
  if (y<10)
  {
    up=false;
  }
  if (y>600)
  {
    up=true;
  }
}
void show()
{
  noStroke();
  fill((x-random(255)),(y-random(255)),random(255),55);
  ellipse(x,y, 75, 75);
}
}
