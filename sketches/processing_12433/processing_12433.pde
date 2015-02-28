
int w = 300;
float density = 0.1;
void setup()
{
  size(300,300);
  noSmooth();
  for(int i = 0; i<w*w; i++)
  {
    int x = i%w;
    int y = i/w;
    float r = norm(x * y, 0.0, w*w)*255;
    float g = norm(x*1.5, 0.0, w)*255;
    float b = norm(y*1.5, 0.0, w)*255;
    set(x,y, color(r,g,b));
  }
}

void draw()
{
  for(int i = 0; i<w*w;i++)
  {
    int x = i%w;
    int y = i/w;
    int vx = round(noise(x*.7,y*.4, frameCount*.1 ));
    int vy = round(noise(x*.5,y*.05, frameCount *.05));
    vx = int(cos(vx)*1.2);
    vy = int(sin(vy)*1.3);
    color c = get(x + vx, y  + vy);
    set(x, y, c);
  }
}

void mousePressed()
{
  setup();
}

