
float x = 0;
float speed = 10;
color circleColor;
int colorTimer = 0;
PImage myImage1;
PImage myImage2;

void setup()
{
  size(400, 400);
  frameRate(30);
  myImage1 = requestImage("Aikido4.jpg");
  myImage2 = requestImage("Aikido1.jpg");
}
void draw()
{
  if (myImage1.width > 0)
  {
    myImage1.filter(GRAY);
    image(myImage1, 0, 0, width, 250);
  }
  
  image(myImage2, 0, 200, width, 200);
  
  for (float xx = 0; xx < width; xx += 36.5)
  {
    stroke(0);
    line(xx, 0, xx, 200);
  }

  for (float yy = 0; yy < height; yy += 36.5)
  {
    stroke(0);
    line(0, yy, 200, yy);
  }
  
  
  noStroke();
  
  /*colorTimer += 1;
  if (colorTimer > 2)
  {
    colorTimer = 0;
  }
  */
  
  float radius = 50;
  
  if (x <= radius)
  {
    speed = 10;
    fill (255, 0, 0);
  }
  else if (x >= width - radius)
  {
    speed = -10;
    fill (0, 0, 255);
  }
  else
  {
    //if (x % 50 == 0)
    if (colorTimer == 0)
    {
    circleColor = color(random(255), random(255), random(255));
    myImage1.filter(GRAY);
    }
    fill (circleColor);
  }
  
  
  if ((x > 200|| x < 50) && speed == 10)
  {
    fill(255, 0, 255);
  }
  
    x += speed;
  
  fill(255, 255, 255);
  
  stroke(random(50, 255));
  float lx = 0;
  float ly = 200;
  while (lx < 400)
  {
    {
    float nextX = lx + 1;
    float nextY = ly + random(-10, 10);
    
    if (nextY > 200 + 10)
    {
      nextY = 200;
    }
    else if (nextY < 200 - 10)
    {
      nextY = 200;
    }
    
    if (nextX > 200)
    {
      nextY = 200;
    }
    line(lx, ly, nextX, nextY);
    ly = nextY;
    lx = nextX;
  }
  strokeWeight(2);
  }
}




