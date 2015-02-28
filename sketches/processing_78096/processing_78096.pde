
//Derek Kwong, Mods 14/15
int x=250;
int y=250;
int compX=300;
int compY=250;
int compDir=DOWN;
int direction= UP;
boolean gameOver=false;

void setup()
{
  size(500, 500);
  background(0);
  fill(255);
  strokeWeight(3);
  frameRate(40);
  direction=UP;
}
void draw()
{ 
  stroke(0, 255, 0);

  if (gameOver==true)
  { 
    stroke(255);
  }
  else
  {
    human();
    if (gameOver==false)
    {
      computer();
    }
  }
}
void human()
{ 
  if (get(x, y)!= color(0))
  {
    gameOver=true;
    textSize(40);
    textAlign(CENTER);
    text("Game Over Computer Wins", 250, 250);
  }

  point(x, y);
  if (direction==DOWN)
  { 
    y=y+3;
  }

  else if ( direction==UP)
  {
    y=y-3;
  }
  else if (direction==LEFT)
  {
    x=x-3;
  }
  else if (direction==RIGHT)
  {
    x=x+3;
  }
}
void keyPressed()
{ 
  if (key=='s')
  {
    direction=DOWN;
  }
  if (key=='w')
  {
    direction=UP;
  }
  if (key=='a')
  {
    direction=LEFT;
  }
  if (key=='d')
  {
    direction=RIGHT;
  }
  if(key=='r')
  { x=250;
 y=250;
 compX=300;
 compY=250;
 compDir=DOWN;
 direction= UP;
 gameOver=false;
 
}
void computer()
{ 
  if (get(compX, compY)!= color(0))
  { 
    gameOver=true;
  }


  stroke(0, 0, 255);
  point(compX, compY);
  if (gameOver==true && compX+3!=color(0))
  {
    stroke(255);
    textSize(40);
    textAlign(CENTER);
    text("Game Over You Win", 250, 250);
  }
  else if (compDir==LEFT)
  { 
    compX=compX-3;
    if (get(compX-3, compY) !=color(0))
    {
      compDir=UP;
    }
  }
  else if (compDir==RIGHT)
  {
    compX=compX+3;
    if (get(compX+3, compY) !=color(0))
    { 
      compDir=DOWN;
    }
  }
  else if (compDir==DOWN)
  { 
    compY=compY+3;
    if (get(compX, compY+3) !=color(0))
    {
      compDir=LEFT;
    }
  }
  else if (compDir==UP)
  {
    compY=compY-3;
    if (get(compX, compY-3)!=color(0))
    {    
      compDir=RIGHT;
    }
  }
}
