
//Tron, Aidan Fulkerson, Computer Programming 1, Mr. Simon
int x = 150;
int y = 150;
int direction = RIGHT;

void setup()
{
  background(0);
  size(300, 300);
}
void draw()
{ 
  if (get(x, y) != color(0))
  {
    text("GAME OVER", 120, 150);
  }
  else
  {
    stroke(255);
    point(x, y);
    if (direction == RIGHT)
    {
      x++;
    }
    else if (direction == LEFT)
    {
      x--;
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
  if (keyCode == UP)
  {
    direction = UP;
  }
  if (keyCode == DOWN)
  {
    direction = DOWN;
  }
  if (keyCode == LEFT)
  {
    direction = LEFT;
  }
  if (keyCode == RIGHT)
  {
    direction = RIGHT;
  }
}
