
float x;
float y;
float d;

float speedX;
float speedY;

float dirX = 1;
float dirY = 1;

void setup ()
{
  size (600, 200); 
  smooth();


  x = random (width);
  y = random (0, height);

  speedX = random (1, 4);
  speedY = random (1, 4);

  d = 40;
}

void draw ()
{
  background (#57385c);
  
  // zeichnen

  stroke (#A75265);
  strokeWeight (2);
  fill (#ffedbc);
  ellipse (x, y, d, d);
  
  // bewegen

  x+= speedX*dirX;
  y+= speedY*dirY;
  
  // randüberprüfung

  if (x > width-d/2)
  {
    x = width-d/2;
    dirX *= -1;

    speedX = random (1, 4);
    speedY = random (1, 4);
  }

  if (x < d/2)
  {
    x = d/2;
    dirX *= -1;

    speedX = random (1, 4);
    speedY = random (1, 4);
  }

  if (y > height-d/2)
  {
    y = height-d/2;
    dirY *= -1;

    speedX = random (1, 4);
    speedY = random (1, 4);
  }

  if (y < d/2)
  {
    y = d/2;
    dirY *= -1;

    speedX = random (1, 4);
    speedY = random (1, 4);
  }
}

