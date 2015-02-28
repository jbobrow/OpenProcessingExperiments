
int x = 0, speedX = 1;
int random;
void setup()
{
  size(200,200);
}
void draw()
{
 drawEllipse(0);
 fillShape();
}
void drawEllipse(int posY)
{
   background(255);
  ellipse(x, height/2 - 20,10,10);
  ellipse((width - x), height/2 + 20, 10,10); 
  x= x + speedX;
  if (x >width || x <0)
  speedX = speedX * -1;
}
void fillShape()
{
  frameRate(100);
  fill(random,255,255);
  float m = millis();
  fill(m * .567);
  if(mouseX < width/2);
  {
    fill(random,255,255,255);
  }
  if(mouseX > width/2);
  {
    fill(random,255,255,0);
  }
  
}
