
static int N = 200;
static int ParticleNum = 50000;
int CellWidth, CellHeight;
Solver fluid;
Particle[] p = new Particle[ParticleNum];

void setup()
{
  size(600, 600);
  frameRate(60);
  smooth();
  fluid = new Solver(N, 3, new float[]{ 0.0008, 0.0008, 0.25, 0.25, 0.25 }, 1.0f / 60.0f);
  for(int i = 0; i < ParticleNum; i++)
    p[i] = new Particle(random(width), random(height));
  CellWidth = (int)ceil((float)width / (float)N);
  CellHeight = (int)ceil((float)height / (float)N);
}

void draw()
{
  MouseUpdate();
  fluid.Update(true, true);
  background(0);
  DrawParticles();
}

void DrawParticles()
{
  for(int i = 0; i < ParticleNum; i++)
  {
    int x = (int)(p[i].x / CellWidth);
    int y = (int)(p[i].y / CellHeight);
    
    float dx = fluid.Grid[0][fluid.Index(x+1, y+1)];
    float dy = fluid.Grid[1][fluid.Index(x+1, y+1)];
    
    float lX = p[i].x - (x * CellWidth) - CellWidth/2.0f;
    float lY = p[i].y - (y * CellHeight) - CellHeight/2.0f;
    
    int x0 = (lX > 0)? Math.min(N, x + 1) : Math.min(N, x - 1);
    int xs = (lX > 0)? 1 : -1;
    int y0 = (lY > 0)? Math.min(N, y + 1) : Math.min(N, y - 1);
    int ys = (lY > 0)? 1 : -1;
    
    dx = lerp(lerp(fluid.Grid[0][fluid.Index(x+1, y+1)], fluid.Grid[0][fluid.Index(x0+1, y+1)], ys * lY / CellWidth), lerp(fluid.Grid[0][fluid.Index(x+1, y0+1)], fluid.Grid[0][fluid.Index(x0+1, y0+1)], ys * lY / CellWidth), xs * lX / CellHeight);
    dy = lerp(lerp(fluid.Grid[1][fluid.Index(x+1, y+1)], fluid.Grid[1][fluid.Index(x0+1, y+1)], ys * lY / CellWidth), lerp(fluid.Grid[1][fluid.Index(x+1, y0+1)], fluid.Grid[1][fluid.Index(x0+1, y0+1)], ys * lY / CellWidth), xs * lX / CellHeight);
       
    p[i].x += dx*16;
    p[i].y += dy*16;
    
    if(p[i].x > width | p[i].x < 0 | p[i].y > height | p[i].y < 0)
    {
      p[i].x = random(width);    
      p[i].y = random(height);
    }
    
    set((int)p[i].x, (int)p[i].y, color(85, 85, 255));
  }
}

int LastMouseX, LastMouseY;
void MouseUpdate()
{
    mouseX = max(1, mouseX);
    mouseY = max(1, mouseY);
 
    float mouseDx = mouseX - LastMouseX;
    float mouseDy = mouseY - LastMouseY;
    int cellX = floor((float)mouseX / CellWidth);
    int cellY = floor((float)mouseY / CellHeight);
    if(mousePressed & mouseButton == LEFT)
    ApplyForce(cellX, cellY, mouseDx, mouseDy, 2);    
    LastMouseX = mouseX;
    LastMouseY = mouseY;
}

public void ApplyForce(int x, int y, float vx, float vy, int r)
{
    x += 1;
    y += 1;
    float dx = fluid.Grid[0][fluid.Index(x, y)];
    float dy = fluid.Grid[1][fluid.Index(x, y)];
    for(int i = x - r; i < x + r; i++)
      for(int j = y - r; j < y + r; j++)
      {
        if(i > 0 & i < N & j > 0 & j < N)
        {
          float x0 = i - x;
          float y0 = j - y;
          float len = sqrt((x0*x0)+(y0*y0));
          if(len <= r)
          {
          fluid.Grid[0][fluid.Index(i, j)] = (vx != 0) ? PApplet.lerp(vx, dx, .85f) : dx;
          fluid.Grid[1][fluid.Index(i, j)] = (vy != 0) ? PApplet.lerp(vy, dy, .85f) : dy;
          }
        }
      }
}  



