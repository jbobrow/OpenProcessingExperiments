
class asteroids
{
float x = 100 + random(400) - random (100); 
float y = -100 - random(600);
float radius = 20;
PImage img; 
PImage img2;
PImage img3; 
}


class guy
{
  
float x= 250;
float y= 550;
float w=100;
float h = 125; 
PImage img; 

}

asteroids[] asteroid = new asteroids[8];
guy player = new guy();


float left = 0;
float right = 0;


void setup()
{
  size(500,700);
  
for (int i = 0; i < asteroid.length; i += 1)
  {
  asteroid[i] = new asteroids();
  }
 asteroid[0].img = requestImage("Dung.png");

  
  player.img = requestImage("scared.png");
}


void draw()
{
  background(0);

  player.x += (right - left) * 5;
  for (int i = 0; i < asteroid.length; i += 1)
  {
  asteroid[i].y += 2;
 if(Intersect(player.x, player.y, player.x + player.w, player.y + player.h,
                      asteroid[i].x, asteroid[i].y, asteroid[i].x + asteroid[i].radius, asteroid[i].y + asteroid[i].radius))
  {
    asteroid[i].x = -1000;
  }
  image(asteroid[0].img,asteroid[0].x,asteroid[0].y);
  } 
 
 image(player.img, player.x,player.y, player.w, player.h);  
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

boolean Intersect(float left, float top, float right, float bottom,
                          float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);

}



