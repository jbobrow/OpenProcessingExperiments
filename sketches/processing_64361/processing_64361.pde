
float a = 0;
float b = 400;
float c = 400;
float d = 0;
float z = 0;
float n = 0;

void setup()
{
  size(800,800);
  background(255);
  strokeWeight(2);
  stroke(random(255),random(255),random(255));
  frameRate(3000);
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
  
  if ((z > 1600) && (z <= 2000))
  {
    line(0,c,d,0);
    c -= 10;
    d += 10;
    z += 10;
  }
  
  if ((z > 2000) && (z <= 2400))
  {
    line(800,c,d,0);
    c += 10;
    d += 10;
    z += 10;
  }
  
  if ((z > 2400) && (z <= 2800))
  {
    line(800,c,d,800);
    c += 10;
    d -= 10;
    z += 10;
  }
  
  if ((z > 2800) && (z <= 3200))
  {
    line(0,c,d,800);
    c -= 10;
    d -= 10;
    z += 10;
  }
  
  if (z == 3200)
  {
    line(0,410,10,800);
    n += 10;
    stroke(random(255),random(255),random(255));
    //background(255);
    a = 0;
    b = 400;
    c = 400;
    d = 0;
    z = 0;
    
  }
  
}

