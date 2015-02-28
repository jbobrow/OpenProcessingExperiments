
CircleObject [] circles = new CircleObject[8];
float moveX = 0;
float moveSpeed = 5.0;
float left = 0;
float right = 0;


void setup()
{
  size( 500, 500);
  for (int i = 0; i < 8; i++)
  {
    
    circles[i] = new CircleObject();
    circles[i].x = random(width);
    circles[i].y = 0;
    circles[i].w = 30;
    circles[i].h = 30;
    circles[i].speed = random(0.1, 3);
    
    
    
  }
  
}

void draw()
{
   background(0);
   moveX += (right - left) * moveSpeed;
   rect(moveX, 450, 25, 25);
   
   for (int i = 0; i < 8; i++)
   {
    circles[i].y += circles[i].speed;
    ellipse(circles[i].x, circles[i].y, circles[i].w, circles[i].h);
   }
    
   
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
  
}
class CircleObject
{
 float x;
 float y;
 float w;
 float h;
 float speed; 
}
