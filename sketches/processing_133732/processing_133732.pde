
class Asteroid
{
  float x = random(10, width - 10);
  float y = random(100);
  float radius = 20;
  float speed = random(1,5);
}
Asteroid[] asteroids = new Asteroid[8];

PImage Link;
float linkX = 0;
float linkY = 600;
float linkW = 100;
float linkH = 100;
float linkSpeed = 5.0;
float left = 0;
float right = 0;

void setup()
{
  size(500, 700);
  
  for (int i = 0; i < asteroids.length; i += 1)
  {
    asteroids[i] = new Asteroid();
    asteroids[i].radius += random(50);
  }
  
  Link = requestImage("Link.png");
}

void draw()
{ 
  background(0);
  for (int i = 0; i < asteroids.length; i += 1)
  {
    asteroids[i].y += asteroids[i].speed;
    
    if (collision(linkX,
      linkY, 
      linkX + linkW,
      linkY + linkH, 
      asteroids[i].x,
      asteroids[i].y,
      asteroids[i].x + asteroids[i].radius, 
      asteroids[i].y + asteroids[i].radius))
      {
        asteroids[i].x = -1000;
        linkW = linkW - 10;
        linkH = linkH -10;
      }
      
    ellipse(asteroids[i].x, asteroids[i].y, asteroids[i].radius, asteroids[i].radius);
  }
  
  
  if (Link.width > 0)
  {
    linkX += (right - left) * linkSpeed;
    image(Link, linkX, linkY, linkW, linkH);
  }
}

void keyReleased()
{
  if (key == CODED)
  {
    if(keyCode == LEFT)
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

boolean collision(float left, float top, float right, float bottom,
                          float otherLeft, float otherTop, float otherRight, float otherBottom)
{
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}




