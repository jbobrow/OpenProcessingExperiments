
int array = 3;

float [] x1 = new float[array];
float [] y1 = new float[array];
float [] z1 = new float[array];
float [] r1 = new float[array];

float [] x2 = new float[array];
float [] y2 = new float[array];
float [] z2 = new float[array];
float [] r2 = new float[array];

float dy1 = 0;
float dy2 = 0;
float gravity = 0.1;

void setup()
{
  size(600, 600, P3D);
  background(0);
  noStroke();
  
  for(int i = 0; i < array; i++)
  {
    x1[i] = random(width);
    y1[i] = random(-height, 0);
    z1[i] = random(-height*.5, height*.8);
    r1[i] = random(5, 20);
    
    x2[i] = random(width);
    y2[i] = random(-height, 0);
    z2[i] = random(-height*.5, height*.8);
    r2[i] = random(5, 20);
  }
}

void draw()
{
  background(0);
  drawFig1(x1, y1, z1, r1);
  drawFig2(x2, y2, z2, r2);
  moveFig1(x1, y1, z1, r1);
  moveFig2(x2, y2, z2, r2);
}

void drawFig1(float [] x, float [] y, float [] z, float [] r)
{
  lights();
  directionalLight(255, 255, 255, 0, height, 0);
  directionalLight(40, 40, 40, -width, 0, 0);
  
  for(int i = 0; i < array; i++)
  {
    pushMatrix();
    translate(x1[i], y1[i], z1[i]);
    fill(255);
    sphere(r1[i]);
    popMatrix();
  }
}

void drawFig2(float [] x, float [] y, float [] z, float [] r)
{
  for(int i = 0; i < array; i++)
  {
    pushMatrix();
    translate(x2[i], y2[i], z2[i]);
    fill(255);
    box(r2[i]);
    popMatrix();
  }
}

void moveFig1(float [] x, float [] y, float [] z, float [] r)
{
  for(int i = 0; i < array; i++)
  {
    if(y1[i] > height)
    {
      dy1 = dy1 * -1;
    }
    y1[i] = y1[i] + dy1;
    dy1 = dy1 + gravity;
  }
}

void moveFig2(float [] x, float [] y, float [] z, float [] r)
{
  for(int i = 0; i < array; i++)
  {
    if(y2[i] > height)
    {
      dy2 = dy2 * -1;
    }
    y2[i] = y2[i] + dy2;
    dy2 = dy2 + gravity;
  }
}


