
// Abby Zhang  mod 4,5 CP1

PImage pig;
int x=100;
int y=100;
void setup()
{
  size(500,500);
  pig = loadImage("Pig.PNG");
}
void draw()
{ 
  background(0);
  image(pig,x,y,300,300);
  int direction = int(random(-5,5));
   if(direction == 0)
  {
    x = x + 1; //right
  }
  else if(direction == 1)
  {
    x = x - 1; //left
  }
  else if(direction == 2)
  {
    y = y + 1; //down
  }
  else // direction must be 3
  {
    y = y - 1; //up
  }
}
