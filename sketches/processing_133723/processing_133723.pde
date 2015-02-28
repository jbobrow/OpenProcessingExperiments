
// store whether key pressed or released in float variables
// 1 is pressed, 0 is not pressed
float left = 0;
float right = 0;

class Asteroid
{
  float x = random(20, 440);
  float y = 100;
  float radius = 20;
  float speed = random(1,3);
}

class Ship
{
  float x = 250;
  float y = 600;
  float w = 50;
  float h = 25;
  float speed = 5;
}

boolean isleftDown = false;
boolean isrightDown = false;

Asteroid[] asteroids = new Asteroid[8];
Ship player = new Ship();

void setup()
{
  size(500,700);
  for (int i = 0; i < asteroids.length; i = i += 1)
  {
    asteroids[i] = new Asteroid();
  }
}

void draw()
{
  background(0);
  if (isrightDown == true)
  {
    player.x += player.speed;
  }
  if (isleftDown == true)
  {
    player.x -= player.speed;
  }
  rect(player.x,player.y,player.w,player.h);
  for (int i = 0; i < asteroids.length; i = i += 1)
  {
    asteroids[i].y += asteroids[i].speed;
    if(rectRectIntersect(player.x,player.y,player.x + player.w, player.y + player.h, asteroids[i].x,asteroids[i].y, asteroids[i].x + asteroids[i].radius, asteroids[i].y + asteroids[i].radius))
    {
      asteroids[i].x = -1000;
    }
    
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
      isleftDown = true;
    }
    if (keyCode == RIGHT)
    {
      isrightDown = true;
    }
  }
}

void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      isleftDown = false;
    }
    if (keyCode == RIGHT)
    {
      isrightDown = false;
    }
  }
}
boolean rectRectIntersect(float left, float top, float right, float bottom,
                          float otherLeft, float otherTop, float otherRight, float otherBottom) 
                          {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
                          }



