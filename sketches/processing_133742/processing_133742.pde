
class astro
{
  //float aX = random(width);
  float aX;
  float aY = 0;
  float aRadius = 20;
  float aSpeed = random(4, 9);
}

class shipChar
{
  float bX = 250;
  float bY = 600;
  float bWidth = 50;
  float bHeight = 25;
}

boolean isLeftDown = false;
boolean isRightDown = false;

astro[] asteroid = new astro[30];
shipChar player = new shipChar();

void setup()
{
  size(500,700);
  background(#000000);
  frameRate(30);
  
  for (int i = 0; i < asteroid.length; i++)
  {
    asteroid[i] = new astro();
    asteroid[i].aX = random(width);
  }
}

void draw()
{
  background(#000000);
  
  if (isRightDown == true)
  {
    player.bX += 10;
  }
  if (isLeftDown == true)
  {
    player.bX -= 10;
  }
  
  fill(#FFFF00);
  rect(player.bX, player.bY, player.bWidth, player.bHeight);

  for (int i = 0; i < asteroid.length; i++)
  {
    fill(#FF0000);
    asteroid[i].aY += asteroid[i].aSpeed;
    
    if (playerHit(
    player.bX, 
    player.bY, 
    player.bX + player.bWidth, 
    player.bY + player.bHeight,
    asteroid[i].aX, 
    asteroid[i].aY, 
    asteroid[i].aX + asteroid[i].aRadius, 
    asteroid[i].aY + asteroid[i].aRadius
    ))
    {
      asteroid[i].aX = -1000;
    }
    
    ellipseMode(CORNER);
    ellipse(asteroid[i].aX, asteroid[i].aY, asteroid[i].aRadius, asteroid[i].aRadius);
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

boolean playerHit (float left, float top, float right, float bottom, float otherLeft, float otherTop, float otherRight, float otherBottom)
{
  return!(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}


