
float x = 0;
float speed = 3.0;
float left = 0;
float right = 0;
float rectX = 100;
float rectY = 100;
float rectWidth = 100;
float rectHeight = 10;


class FallingObject
{
  float x = 100 + random(400) - random(100);
  float y = -100 - random(100);
  float radius = 20;
}
FallingObject[] fallingObjects = new FallingObject[8];

void setup()
{
  size(500, 500);
  
  for (int i = 0; i < fallingObjects.length; i += 1)
  {
    fallingObjects[i] = new FallingObject();
  }
}
 
void draw()
{
  background(201);
  x += (right - left) * speed;
  rect(x, 480, 100, 10);
  
  if (rectCircleIntersect (rectX, rectY, rectWidth, rectHeight, x, y, 20) == true)
  {
    fill (0);
  }
  else
  {
    fill(255);
  }
  
  for (int i = 0; i < fallingObjects.length; i += 1)
  {
  fallingObjects[i].y += 1;
  ellipse(fallingObjects[i].x, fallingObjects[i].y, fallingObjects[i].radius, fallingObjects[i].radius);
  }
}
 boolean rectCircleIntersect(float rx, float ry, float rw, float rh, float cx, float cy, float cr) 
  {
  float circleDistanceX = abs(cx - rx - rw/2);
  float circleDistanceY = abs(cy - ry - rh/2);
 
  if (circleDistanceX > (rw/2 + cr)) 
  { return false; }
  if (circleDistanceY > (rh/2 + cr)) 
  { return false; }
  if (circleDistanceX <= rw/2) 
  { return true; }
  if (circleDistanceY <= rh/2)
  { return true; }
 
  float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2);
  return cornerDistance <= pow(cr, 2);
}

 
void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      left = 0;
    }
    if (keyCode == RIGHT)
    {
      right = 0;
    }
  }
}
 
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      left = 1;
    }
    if (keyCode == RIGHT)
    {
      right = 1;
    }
  }



class FallingObject
{
  float x = 100 + random(400) - random(100);
  float y = -100 - random(100);
  float radius = 20;
}
}



