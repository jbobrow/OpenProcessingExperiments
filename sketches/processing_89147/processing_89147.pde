
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
  goCollision2(60,100,280);
  goCollision3(0,70,150);
  }
 // here are the three functions that draw shapes and move them toward the centre
}
void goCollision1(int r, int g, int b)
{
  fill ( r, 255, 150);
  ellipse (x, y, w, h);
  x = x + speedX;
}
void goCollision2(int r, int g, int b)
{
fill (255, g, 150);
ellipse (x2, y2, w, h);
x2 = x2 + speedX2;
}
void goCollision3(int r, int g, int b)
{
fill(150, 255, b);
triangle ( x1, y1, x1 + 20, y1 +20, x1 - 20, y1 +20);
y1 = y1 + speedX;
}
