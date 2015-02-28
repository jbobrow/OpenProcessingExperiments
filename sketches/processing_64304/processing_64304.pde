
float a = 0;
float b = 400;
float z = 0;
float n = 0;

void setup()
{
  size(800,800);
  background(255);
  strokeWeight(2);
  stroke(random(255),random(255),random(255));
  frameRate(1500);
}

void draw()
{
  if (z <= 400)
  {
    line(a,400,400,b);
    a += 10;
    b -= 10;
    z += 10;
  }
  
  if ((z > 400) && (z <= 800))
  {
    line(a,400,400,b);
    a += 10;
    b += 10;
    z += 10;
  }
  
  if ((z > 800) && (z <= 1200))
  {
    line(a,400,400,b);
    a -= 10;
    b += 10;
    z += 10;
  }
  
  if ((z > 1200) && (z <= 1600))
  {
    line(a,400,400,b);
    a -= 10;
    b -= 10;
    z += 10;
  }
  
  if (z == 1600)
  {
    n += 10;
    stroke(random(255),random(255),random(255));
    background(255);
    a = 0;
    b = 400;
    z = 0;
  }
}

