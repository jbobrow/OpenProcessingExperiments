
//Maddy C CPI 14/15 tron game 
int direction=UP; 
int x=int(random(50,350));
int y=int(random(50,350));
int cx=int(random(50,350));
int cy=int(random(50,350));
int cdirection=DOWN;
boolean gameOver=false; 
boolean hum=false;
void setup()
{
  size(400,400); 
  background(0); 
  noFill(); 
  stroke(255);
  strokeWeight(10);
  rect(0,0,400,400);
}
void draw() 
{
  smooth();
  frameRate(20);
  if(gameOver==false)
  {
    human(); 
    comp();
  }
  else if(hum==true)
  {
    textSize(25);
    text("You lost?",140,150);
    text("DISHONOR ON YOUR FAMILY",30,200);
    text("DISHONOR ON YOUR COW",50,250);
  }
  else
  {
    textSize(25);
    text("You won?",140,150);
    text("there must be some mistake.",30,200);
    text("Play again",140,250);
  }
}
void human() 
{
  if(get(x,y)!= color(0))
  {
    gameOver=true;
    hum=true;
  }
  else
  {
    stroke(255); 
    strokeWeight(5);
    point(x,y);
    
    if(direction==UP)
    {
      y=y-3;
    }
    if(direction==DOWN)
    {
      y=y+3;
    }
    if(direction==LEFT)
    {
      x=x-3;
    }
    if(direction==RIGHT)
    {
      x=x+3;
    }
  }
  
}
void keyPressed()
{
  if(keyCode==UP) 
  {
    direction=UP;
  }
  else if(keyCode==DOWN)
  {
    direction=DOWN;
  }
  else if(keyCode==LEFT)
  {
    direction=LEFT;
  }
  else if(keyCode==RIGHT)
  {
    direction=RIGHT;
  }
}
void comp()
{
  if(get(cx,cy)!= color(0))
  {
    gameOver=true;
  }
  else
  {
    stroke(0,0,255); 
    strokeWeight(5);
    point(cx,cy);
    
    if(cdirection==UP)
    {
      cy=cy-3;
      if(get(cx,cy-3) != color(0))
      {
        cdirection=RIGHT;
      }
    }
    if(cdirection==DOWN)
    {
      cy=cy+3;
      if(get(cx,cy+3) != color(0))
      {
        cdirection=LEFT;
      }
    }
    if(cdirection==LEFT)
    {
      cx=cx-3;
      if(get(cx-3,cy) != color(0))
      {
        cdirection=UP;
      }
    }
    if(cdirection==RIGHT)
    {
      cx=cx+3;
      if(get(cx+3,cy) != color(0))
      {
        cdirection=DOWN;
      }
    }
  }
}
