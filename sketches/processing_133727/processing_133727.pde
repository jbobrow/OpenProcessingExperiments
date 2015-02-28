
class character
{
  float x = 250;
  float y = 600;
  float w = 50;
  float h = 25;
  float speed = 10;
}

class circle
{
  float x = 100 + random(400) - random(100);
  float y = 100 - random(100) ;
  float radius = 20;
}

circle[] circles = new circle[8];
character player = new character();

void setup()
{
  size(500,700);
  
  for(int i = 0; i < circles.length; i += 1)
  {
  circles[i] = new circle();
  }
}
boolean isRightDown = false;
boolean isLeftDown = false;
void draw()
{
  background(0);
  circles[0].y += 1;
  circles[1].y += 2;
  circles[2].y += 0.5;
  circles[3].y += 0.75;
  circles[4].y += 1;
  circles[5].y += 2;
  circles[6].y += 1.25;
  circles[7].y += 0.5;
for(int i = 0; i < circles.length; i += 1)
{
   ellipse(circles[i].x, circles[i].y, circles[i].radius, circles[i].radius);
    if(collision(player.x,player.y,player.x + player.w, player.y + player.h, circles[i].x, circles[i].y, circles[i].x + circles[i].radius, circles[i].y + circles[i].radius))
  {
    circles[i].x = -1000;
  }
 
}

  
 
 if(isRightDown == true)
{
  player.x += player.speed;
}
if(isLeftDown == true)
{
  player.x -= player.speed;
}
rect(player.x, player.y, player.w, player.h);

}
void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
     isLeftDown = false;
    }
    if (keyCode == RIGHT)
    {
     isRightDown = false;
    }
  }
}
 
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      isLeftDown = true;
    }
    if (keyCode == RIGHT)
    {
      isRightDown = true;
    }
  }
}

boolean collision(float left, float top, float right, float bottom, float otherLeft, float otherTop, float otherRight, float otherBottom)
{
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}



