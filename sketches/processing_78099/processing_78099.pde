
//Matheson Gee Computer Programming 1 Mods:14/15
int x=175;
int y=200;
int compX=200;
int compY=200;
int compDir=int(random(37,40));
int direction=LEFT;
boolean gameover=false;
void setup()
{
  size(400, 400);
  background(0);
  frameRate(45);
  strokeWeight(2);
}
void draw()
{ 
  if (!gameover)
  {
    human();
    if(!gameover)
    comp();
  }
}
void keyPressed()
{
  if (key == 'a')
  {
    direction=LEFT;
  }
  if (key == 'd')
  { 
    direction=RIGHT;
  }
  if (key == 'w')
  {

    direction= UP;
  }
  if (key== 's')
  {
    direction=DOWN;
  }
  if(key=='r')
  {
    x=175;
    y=200;
    compX=200;
    compY=200;
    compDir=int(random(37,40));
    direction=LEFT;
    gameover=false;
    background(0);
  }
}
void human()
{ 
  stroke(2, 101, 227);
  point(x, y);
  if ( direction==RIGHT)
  {
    x=x+2;
  }
  if (direction==LEFT)
  {
    x=x-2;
  }
  if ( direction==DOWN)
  {
    y=y+2;
  }
  if ( direction==UP)
  {
    y=y-2;
  } 
  if ( get(x, y)!=color(0, 0, 0))
  {
    textSize(25);
    textAlign(CENTER);
    text("Game Over Human Loses", 200, 200);
    gameover=true;
  }
}
void comp()
{
  stroke(255, 0, 0);
  point(compX, compY);
  if ( compDir==LEFT)
  {
    compX=compX-2;
    if (get(compX-2, compY)!=color(0, 0, 0))
    {
      compDir=UP;
    }
  }
  if (compDir==RIGHT)
  {
    compX=compX+2;
    if (get(compX+2, compY)!=color(0, 0, 0))
    {
      compDir=DOWN;
    }
  }
  if (compDir==DOWN)
  {
    compY=compY+2;
    if (get(compX, compY+2)!=color(0, 0, 0))
    {
      compDir=LEFT;
    }
  }
  if (compDir==UP)
  {
    compY=compY-2;
    if (get(compX, compY-2)!=color(0, 0, 0))
    {
      compDir=RIGHT;
    }
  }
  if ( get(compX, compY) !=color(0, 0, 0))
  {
    textSize(25);
    textAlign(CENTER);
    text("Game Over Computer Loses", 200, 200);
    gameover=true;
  }
}
