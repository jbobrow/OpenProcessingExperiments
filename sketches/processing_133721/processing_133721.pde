
class Asteroid
{
  float x = random(50,450);
  float y = 100;
  float radius = 20;
  float speed = random(1,5);
  
}

class Ship
{
  float x = 250;
  float y = 600;
  float w = 50;
  float h = 25;
}

//Asteroid asteroid1;
Asteroid[] asteroids = new Asteroid[8];
Ship player = new Ship();

void setup()
{
  size(500,700);
  for (int i = 0; i < asteroids.length; i += 1)
  {
    asteroids[i] = new Asteroid();
  }
  
   
   
  
}

void draw()
{
  background(0);
  fill(random(255), random(255), random(255));
  rect(player.x, player.y, player.w, player.h);
  
  for (int i = 0; i < asteroids.length; i += 1)
  {
    asteroids[i].y += asteroids[i].speed;
    ellipse(asteroids[i].x, asteroids[i].y, asteroids[i].radius, asteroids[i].radius);
  }
}

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      player.x -= 15;
    }
    if (keyCode == RIGHT)
    {
      player.x += 15;
    }
  }
}

void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      player.x -= 0;
    }
    if (keyCode == RIGHT)
    {
      player.x += 0;
    }
  }
}


boolean rectRectIntersect(float left, float top, float right, float bottom,
                          float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}



