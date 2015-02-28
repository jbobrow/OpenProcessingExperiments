
float x, xTwo, xSpeed, xSpeedTwo;
float y, yTwo, ySpeed, ySpeedTwo;
float z, zTwo, zSpeed, zSpeedTwo;
int q; //size of rectangle
int r, g, b; //colors for ball one
int rTwo, gTwo, bTwo; //colors for ball two

void setup()
{
  smooth();
  size(500, 500, P3D);
  q = 5;

  x = random(150, 350);
  xTwo = random(150, 350);
  xSpeed = random(1, 5);
  xSpeedTwo = random(1, 5);

  y = random(150, 350);
  yTwo = random(150, 350);
  ySpeed = random(1, 5);
  ySpeedTwo = random(1, 5);

  z = random(-100, 100);
  zTwo = random(-100, 100);
  zSpeed = random(1, 5);
  zSpeedTwo = random(1, 5);


  r = int(random(0, 255));
  g =int(random(0, 255));
  b = int(random(0, 255));
  rTwo = int(random(0, 255)); 
  gTwo = int(random(0, 255));
  bTwo = int(random(0, 255));
}

void draw()
{

  background(150);
  noFill();
  //loop
  for (int i = 0; i < 500; i+=q)
  {
    for (int j = 0; j < 500; j+=q)
    {
      rect(i, j, q, q);
    }
  }

  pushMatrix();
  translate(x, y, z);
  fill(r, g, b);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(xTwo, yTwo, zTwo);
  fill(rTwo, gTwo, bTwo);
  sphere(20);
  popMatrix();

  x = x + xSpeed;
  y = y + ySpeed;
  z = z + ySpeed;

  xTwo = xTwo + xSpeedTwo;
  yTwo = yTwo + ySpeedTwo;
  zTwo = zTwo + zSpeedTwo;

  if (x < 150 || x > 350)
  {
    xSpeed= -xSpeed;
    q--;
    r = int(random(0, 255)); 
    g = int(random(0, 255));
    b = int(random(0, 255));
  }

  if (y < 150 || y > 350)
  {
    ySpeed= -ySpeed;
    q++;
    r = int(random(0, 255)); 
    g = int(random(0, 255));
    b = int(random(0, 255));
  }
  
  if (z < -100 || z > 100)
  {
    zSpeed= -zSpeed;
    q++;
    r = int(random(0, 255)); 
    g = int(random(0, 255));
    b = int(random(0, 255));
  }

  if (xTwo < 150 || xTwo > 350)
  {
    xSpeedTwo= -xSpeedTwo;
    q--;
    rTwo = int(random(0, 255)); 
    gTwo = int(random(0, 255));
    bTwo = int(random(0, 255));
  }

  if (yTwo < 150 || yTwo > 350)
  {
    ySpeedTwo= -ySpeedTwo;
    q++;
    rTwo = int(random(0, 255)); 
    gTwo = int(random(0, 255));
    bTwo = int(random(0, 255));
  }
  
  if (zTwo < -100 || zTwo > 100)
  {
    zSpeedTwo= -zSpeedTwo;
    q++;
    rTwo = int(random(0, 255)); 
    gTwo = int(random(0, 255));
    bTwo = int(random(0, 255));
  }
  
  pushMatrix();
  translate(width/2,height/2,0);
  fill(220, 40);
  box(200);
  popMatrix();
  
}
