
PGraphics overlay;
PImage base;

void setup()
{
  int a = 800;
  size (800,800);
  noStroke();
  smooth();
  noLoop();
  background(0);
  
  overlay = createGraphics(width,height,P2D);
  
}

int level = 1;

void draw()
{
  int x = width;
  int y = height;
  int diam = width;
  
  save("base.tif");
  

    base = loadImage("base.tif");

  
  overlay.beginDraw();
    overlay.fill(0);
    overlay.rect(0,0,width,height);
    drawCircle(x, y, diam, level);
  overlay.endDraw();
  
  overlay.blend(base,0,0,width,height,0,0,width,height,DIFFERENCE);
  image(overlay,0,0);
}

int count = 0;

void levels(int level, int count)
{
  
  if (level>1)
  {
  level = level -1;
  count = count++;
  levels(level, count);
  }
}

void drawCircle(int x, int y, int diam, int level)
{

  if (level == 1)
  {
  overlay.fill(255);
  
  overlay.ellipse(x/2,y/2,diam, diam);

  }
if (level>1)
  {
    level = level - 1;  
    
    drawCircle(x-diam/2,y-diam/2,diam/2,level);
    drawCircle(x+diam/2,y-diam/2,diam/2,level);
    drawCircle(x+diam/2,y+diam/2,diam/2,level);
    drawCircle(x-diam/2,y+diam/2,diam/2,level);
  }
}

void mouseClicked()
{
  if (level>= 9)
  {
    level = 0;
  }
  level = level + 1;
  redraw();
  
}


