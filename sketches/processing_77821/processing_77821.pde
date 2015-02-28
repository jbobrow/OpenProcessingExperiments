
//Benjamin Z. Mods 16/17. Tron
int direction=RIGHT;
int compd=LEFT;
boolean gameover=false;
int cx=450;
int cy=300;
int x = 150;
int y = 300;
float z=random(3);
float i=random(1);
void setup()
{
  size(600, 600);
  background(0);
}
void draw()
{
  if (gameover==false)
  {
    human();
  }
  if (gameover==false)
  {
    computer();
  }
}
void human()
{
  if (get(x, y) != color(0, 0, 0)) 
  {
    textSize(25);
    text("Gee Gee COMPUTER WINS", 225, 280);
    gameover=true;
  }
  else
  {
    stroke(255);
    point(x, y);
    if (direction==RIGHT)
    {
      x+=2;
    }
    else if (direction==LEFT)
    {
      x-=2;
    }
    else if (direction==UP)
    {
      y-=2;
    }
    else if (direction==DOWN)
    {
      y+=2;
    }
  }
}
void computer()
{
  if (get(cx, cy) != color(0, 0, 0)) 
  {
    textSize(25);
    text("Gee Gee HUMAN WINS", 225, 280);
    gameover=true;
  }
  else
  {
    stroke(0, 255, 0);
    point(cx, cy);
    if (compd==RIGHT)
    {
      cx+=2;
      if (get(cx+2, cy)!=color(0))
      {
        
          compd=UP;
        
      }
    }
    else if (compd==LEFT)
    {
      cx-=2;
      if (get(cx-2, cy)!=color(0))
      { 
        
          compd=DOWN;
        
      }
    }
    else if (compd==UP)
    {
      cy-=2;
      if (get(cx, cy-2)!=color(0))
      {
        
          compd=LEFT;
        }
       
      
    }
    else if (compd==DOWN)
    {
      cy+=2;
      if (get(cx, cy+2)!=color(0))
      {
        compd=RIGHT;
      }
    }
  
  
      }
    }


void keyPressed()
{
  if (key=='a')
  {
    direction=LEFT;
  }
  else if (key=='d')
  {
    direction=RIGHT;
  }
  else if (key=='s')
  {
    direction=DOWN;
  }
  else if (key=='w')
  {
    direction=UP;
  }
}

