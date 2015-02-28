
//Toby K Mods 4-5 CP1, Animation
int x=10;
int y=0;
int change=10;
int count=0;
int ballx=0;
int bally=0;
int yellow=252;
void setup ()
{
  size(300, 300);
  frameRate(12);
}

void draw ()
{ 
  square();
  pacman();
  ball();
  counter(); 
}
void square()
{
  fill(0,0,0,30);
  rect(0,0,300,300);
}
void pacman()
{ 
  fill(yellow, 255, 10);
  arc(25+x, 25+y, 50, 50, PI/4, 2*PI);
  fill(x,y,x);
  ellipse(30+x, 15+y, 10, 10);
  x=x+15;
  if (x>300)
  {
    x=0;
    y=y+50;
  }
  if (y==250)
  { 
    yellow=0;
    y=0;
  }
}
void counter()
{ 
  fill(x, y, 255);
  ellipse(150,300,100,100); 
  fill(0,0,0);
  text(count,140,300);
  count=count+10;
}
void ball ()
{
  fill(255,255,255);
  ellipse(ballx,30+bally,15,15);
  ellipse(ballx,80+bally,15,15);
  ellipse(ballx,130+bally,15,15);
  ballx=ballx+75;
if (ballx>300)
  {
    ballx=0;
    bally=y+50;
  }
  if (bally==250)
  {
    bally=0;
  }
}
