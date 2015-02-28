
int x = 0, speedX = 1;
void setup()
{
  size(200, 200);
  background(255);
}
void draw()
{
  fillShape();
drawEllipse(100);
}
  void drawEllipse(int posY)
  {
  background(255);
  ellipse(x, posY-20, 10, 10);
  if (posY < 20) 
  posY = 20;
  ellipse((width-x), posY+20, 10, 10);
  if (posY> height-20) posY=width-20;
   x= x + speedX;
  if(x>width || x < 0)
  speedX = speedX * -1;
  }
  void fillShape()
  {
   fill(0, 255, 255);  
  }
