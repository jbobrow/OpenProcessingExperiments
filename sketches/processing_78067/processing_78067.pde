
//Perry Phan 4/5 Tron
/* @pjs globalKeyEvents='true"; */
int x = 250;
int y = 250;
int direction = RIGHT;
void setup()
{
  size (700,700);
  background(0);
 stroke(255);
}
void draw()
{
  
  if (get(x,y) !=color(0,0,0)) //crashed!
  {
    fill(255,0,0);
    ellipse(x,y,200,200);
    
  }
  else
  {
    point(x,y);
    if (direction == LEFT)
    {
      x--;
    }
    else if (direction == RIGHT)
    {

      x++;
    }
    else if (direction == UP)
    {
      
      y--;
    }
    else if (direction == DOWN)
    {
      y++;
    }
   
  }    
}
void keyPressed()
{
  if(key == 'j')
  {
    direction = LEFT;
  }
  else if (key == 'l')
  {
    direction = RIGHT;
  }
  else if(key == 'i')
  {
    direction = UP;
  }
  else if (key == 'k')
  {
    direction = DOWN;
  }
}
