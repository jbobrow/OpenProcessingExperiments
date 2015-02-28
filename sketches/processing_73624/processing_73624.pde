
static int N = 30;
float[] x, y, vx, vy;
float dx, dy, len;
void setup()
{
  size(800, 600);
  smooth();
  frameRate(60);
  background(0);
  x = new float[N];
  y = new float[N];
  for(int i = 0; i < 10; i++)
  {  
    x[i] = 400 + cos(i * .068f);
    y[i] = 300 + sin(i * .068f);
  }
  for(int i = 10; i < 20; i++)
  {  
    x[i] = 400 + cos((i * .068f) + 1.5f);
    y[i] = 300 + sin((i * .068f) + 1.5f);
  }
  for(int i = 20; i < 30; i++)
  {  
    x[i] = 400 + cos((i * .068f) + 3f);
    y[i] = 300 + sin((i * .068f) + 3f);
  }
  vx = new float[N];
  vy = new float[N];
}
float ts = 1.0f/60.0f;
void draw()
{
  background(0);
  noStroke();
  for(int i = 0; i < N; i++)
  {
    dx = x[i] - width/2.0f;
    dy = y[i] - height/2.0f;
    len = sqrt(dx*dx + dy*dy);
    dx /= len;
    dy /= len;
    len /= 2;
    float f = -2000.0f / ((len * len) + 400);
    
    vx[i] += dx * f * ts;
    vy[i] += dy * f * ts;
    if(len < 25f)
    {
      vx[i] += dy * -2 * ts;
      vy[i] += -dx * -2 * ts;
    }    
    vx[i] *= .995f;
    vy[i] *= .995f;
    x[i] += vx[i];
    y[i] += vy[i];
    if(i < 10)
      fill(255, 255, 128);
    else if(i < 20)
      fill(255, 128, 255);
    else if(i < 30)
      fill(128, 255, 255);
    ellipse(x[i], y[i], 2, 2);
  }
  fill(255, 128, 128);
  ellipse(width/2.0f, height/2.0f, 10, 10);
}


