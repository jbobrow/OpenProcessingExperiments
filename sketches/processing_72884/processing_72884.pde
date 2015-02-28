
int xpos = 25;
int ypos = 25;

int direction;

int gray = 1;
boolean grayup = false;



void setup()
{
  size(501, 501);
  background(255);
}

void draw()
{
  if (xpos == -1)
    xpos = 49;
  if (xpos == 50)
    xpos = 0;
  
  if (ypos == -1)
    ypos = 49;
  if (ypos == 50)
    ypos = 0;
  
  direction = int(random(0, 2));
  
  fill(0, 0, 0, 10);
  rect(10*xpos, 10*ypos, 10, 10);
  
  if (direction == 0)
    xpos += int(random(-2, 2));
  else
    ypos += int(random(-2, 2));
}
