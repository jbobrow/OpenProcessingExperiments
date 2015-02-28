
float x = 0;
float speed = 3.0;

// store whether key pressed or released in float variables
// 1 is pressed, 0 is not pressed
float left = 0;
float right = 0;

void setup()
{
  size(500, 500); 
}

void draw()
{
  background(0);
  
  // if both keys pressed, right - left is 0.
  // if left pressed 0 - 1 is -1 so negative x direction.
  // multiply this by speed to make the amount of 
  // pixels moved equal to speed.
  x += (right - left) * speed;
  ellipse(x, height / 2, 100, 100);
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



