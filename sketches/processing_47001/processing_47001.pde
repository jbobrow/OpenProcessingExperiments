
//Homework12
//copyright Christina Lee November 2011 Pittsburgh, PA 15289

int MAX = 250;

float [] x;
float [] y;
float [] z;
float [] rad;
float [] dx;
float [] dy;
float [] dz;
color [] col;


void setup()
{
  size(800, 600, P3D);
  
  x = new float [MAX];
  y = new float [MAX];
  z = new float [MAX];
  rad = new float [MAX];
  dx = new float [MAX];
  dy = new float [MAX];
  dz = new float [MAX];
  col = new color [MAX];
  
  initFloatArray(x, 0, width);
  initFloatArray(y, 0, height);
  initFloatArray(z, -400, 400);
  initFloatArray(rad, 1, 50);
  initFloatArray(dx, 2, 20);
  initFloatArray(dy, 2, 20);
  initFloatArray(dz, 2, 20);
  initColorArray();
  
  
}

void draw()
{
  background(255, 183, 170);
  noStroke();
  lights();
  moveBalls();
  drawBalls();
  drawBalls2();
}

void initFloatArray(float [] array, float low, float high)
{
  for (int i = 0; i < array.length; i++)
  {
    array[i] = int(random(low, high));
  }
}

void initColorArray()
{
  for (int i = 0; i < col.length; i++)
  {
    col[i] = color(255, int(random(0, 200)));
  }
}

void moveBalls()
{
  for (int i = 0; i < MAX; i++)
  {
    x[i] = x[i] + dx[i];
    y[i] = y[i] + dy[i];
    z[i] = z[i] + dz[i];
    
    if (x[i] > width + rad[i]/2 || x[i] < -rad[i]/2)
    {
      dx[i] = -dx[i];
    }
    
    
    if (y[i] > height + rad[i]/2 || y[i] < -rad[i]/2 )
    {
      dy[i] = -dy[i];
    }
    
    if (z[i] < -rad[i]/2)
    {
      dz[i] = -dz[i];
    }
    
    if (z[i] > 400 || z[i] < -400)
    {
      dz[i] = -dz[i];
    }
    
  }
 
}

void drawBalls()
{
  for (int i = 0; i < MAX; i++)
  {
    fill(col[i]);
    pushMatrix();
    translate(x[i], y[i], z[i]);
    sphere(rad[i]);
    popMatrix();
  }
}

void drawBalls2()
{
  for (int i = 0; i < MAX*0.8; i++)
  {
  stroke(175, 233, 255);
  noFill();
  ellipse(x[i], y[i], rad[i], rad[i]);
  }
}
