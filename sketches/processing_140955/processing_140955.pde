
float x = 0;
float speed = 3.0;
float left = 0;
float right = 0;
 
class Asteroid
{
  float x = random(width);
  float y = -100;
  float radius = 20;
  float speed = random(3, 6);
}
 
class Ship
{
  float x = 250;
  float y = 550;
  float w = 50;
  float h = 25;
}
 
//Asteroid asteroid1;
Asteroid[] asteroids = new Asteroid[15];
Ship player = new Ship();
 
void setup()
{
  size(500, 600);
  for (int i = 0; i < asteroids.length; i += 1)
  {
    asteroids[i] = new Asteroid();
  }
}
 
void draw()
{
  background(0);
  for (int i = 0; i < asteroids.length; i += 1)
  {
    asteroids[i].y += asteroids[i].speed;
    if (Colliding(
    player.x,
    player.y,
    player.x + player.w,
    player.y + player.h,
    asteroids[i].x,
    asteroids[i].y,
    asteroids[i].x + asteroids[i].radius,
    asteroids[i].y + asteroids[i].radius))
      {
        asteroids[i].x = -1000;
      }
    ellipseMode(CORNER);
    ellipse(asteroids[i].x, asteroids[i].y, asteroids[i].radius, asteroids[i].radius); 
  }
   
  rect (player.x, player.y, player.w, player.h);
}
 
void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      player.x += 0;
    }
    if (keyCode == RIGHT)
    {
      player.x += 0;
    }
  }
}
  
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      player.x += -15;
    }
    if (keyCode == RIGHT)
    {
      player.x += 15;
    }
  }
}
 
boolean Colliding(float left, float top, float right, float bottom, float otherLeft, float otherTop, float otherRight, float otherBottom)
{
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}


