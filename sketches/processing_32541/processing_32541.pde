
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
int count = 1;

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

void drawCircle(int x, int y, int diam, int level)
{

  if (level == 1)
  {
      overlay.fill(255); 
      overlay.ellipse(x/2,y/2,diam,diam);
      overlay.fill(0);
      overlay.ellipse(x/2,y/2,15*diam/16,15*diam/16);
      overlay.rect((x/2)-(diam/2),(y/2)-(diam/6),diam,diam/3);
      overlay.rect((x/2)-(diam/6),(y/2)-(diam/2),diam/3,diam);
      overlay.fill(255);
      overlay.ellipse(x/2,y/2,(13*diam)/16,(13*diam)/16);
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
  if (level>= 6)
  {
    //fill(0);
    //rect(0,0,width,height);
    level = 0;
  }
   level = level + 1;
   if (count == 1){count = 0;}
   else {count = 1;}
   redraw();
  
}


