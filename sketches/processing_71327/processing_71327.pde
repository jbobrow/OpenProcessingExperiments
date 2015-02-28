
// Toby K Mods 4-5 CP1 ,User input 
/**
W S A D moves yellow pacman up down left and right
Q changes pacman red
E changes pacman back to yellow
R shoots a ball
other pacman follows your mouse
Right button to shoot ball
Left button to reload
*/
int x=10;
int y=10;
int ballX=0;
int q=252;
int colorR=25;
int colorG=50;
int colorB=75;
int count=0;
int redBall=0;
void setup()
{
  size (300, 300);
}
void draw()
{
  square();
  ball();
  if (key == 'r')
  {
    redBall=redBall+50;
  }
    else
  {
    redBall=0;
  }
  pac();
  mousePressed();
  counter();
}
void square()
{
  fill(x,y,50, 40);
  rect(0, 0, 300, 300);
}
void pac()
{  
  ellipse(25+x+redBall, 25+y, 15, 15);
  fill(252, q, 10);
  arc(25+x, 25+y, 50, 50, PI/4, 2*PI);
  if (x>300 && y<300)
  {
    x=0;
    y=y+25;
  }
  if (x<0)
  {
    x=275;
    y=y-25;
  }
}
void ball ()
{
  fill(255, 255, 255);
  ellipse(mouseX+ballX, mouseY, 15, 15);
  if (mouseButton==RIGHT)
  {
    ballX=ballX-10;
  }
  else
    if (ballX<300)
    {
      ballX=0;
    }
}
void keyPressed ()
{
  if (key=='d')
  {
    x=x+10;
  }
  if (key == 'a')
  {
    x=x-10;
  }
  if (key == 'w' && y>0)
  {
    y=y-25;
  }
  if (key == 's' && y<250)
  {
    y=y+25;
  }
  if (key == 'q')
  {
    q=q-10;
  }
  if (key == 'e')
  {
    q=q+10;
  }
}
void mousePressed ()
{
  fill(colorR, colorG, colorB);
  colorR=colorR-colorG;
  colorG=colorG-colorB;
  colorB=colorB-colorR;
  if (colorB==0)
  {
    ColorR=25
    ColorG=50
    ColorB=75
    }
  arc(mouseX, mouseY, 50, 50, PI, 11*PI/4);
}
void counter()
{ 
  fill(x, y, 255);
  ellipse(150, 300, 100, 100); 
  fill(0, 0, 0);
  text(count, 140, 300);
  count=count+10;
}
