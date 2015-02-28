
class Asteroid
{
  float x = random(500);
  float y = random(100);
  float radius  = 20;
  float speed = random(1, 5);
}

class Ship
{
  float x = 250;
  float y = 600;
  float w = 50;
  float h = 25;
  float speed = 5;
}

boolean isLeftDown = false;
boolean isRightDown = false;

Asteroid[] asteroids = new Asteroid[8];
Ship player = new Ship();

void setup()
{
  size(500, 700);
  for (int i = 0; i < asteroids.length; i += 1)
  {
    asteroids[i] = new Asteroid();
  }
}

void draw()
{
  background(0);
  
  if (isRightDown == true)
  {
    player.x += player.speed;
  }
  if (isLeftDown == true)
  {
   player.x -= player.speed; 
  }
  
  fill(random(255), random(255), random(255));
  rect(player.x, player.y, player.w, player.h);
  
   for (int i = 0; i < asteroids.length; i += 1)
  {
    asteroids[i].y += asteroids[i].speed;
    
    ellipseMode(CORNER);
    ellipse(asteroids[i].x, asteroids[i].y, asteroids[i].radius, asteroids[i].radius);
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
    if(keyCode == RIGHT)
    {
      isRightDown = true;
    }
  }
}
void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      isLeftDown = false;
    }
    if(keyCode == RIGHT)
    {
      isRightDown = false;
    }
  }
}

boolean collision(float left, float top, float right, float bottom, float otherLeft, float otherTop, float otherRight, float otherBottom)
{
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}


