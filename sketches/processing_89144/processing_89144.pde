
int x = 0;
int x1 = 250;

int y = 250;
int y1 = 0;
int y2 = 250;
int speedX = 1;
int speedX2 = -1;

int w = 30;
int h = 30;
int x2 = 480 ;
void setup ()
{
  size (500, 500);
}

void draw ()
{
  //functions in the void draw, with if statement to stop them moving
   if (((mouseX > width/2 +10) || (mouseX < width/2 -10)) && ((mouseY > height/2 +10) ||( mouseY < height/2 -10)))
  {
  background (50, 0, 180);
  goCollision1(20, 80, 200);
 
  }
}

void goCollision1(int r, int g, int b)
{
  fill ( r, 255, 150);
  ellipse (x, y, w, h);
 ellipse (x, y +30, w, h);
triangle ( x + 30, y - 30, x - 30, y + 30, x, y -30);
 x = x + speedX;
}

