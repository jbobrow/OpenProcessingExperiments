
void setup()
{
  int a = 800;
  size (800,800);
  noStroke();
  smooth();
  noLoop();
  background(255);
   
}
 
int level = 6;
 
void draw()
{
  int x = width;
  int y = height;
  int diam = width;
   
  drawCircle(x, y, diam, level);
   
}
 
void drawCircle(int x, int y, int diam, int level)
{
  fill(random(x/2),random(x/2),random(x/2),80);
   
  ellipse(x/2+2,y/2+2,diam-2, diam-2);
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
  if (level>= 10)
  {
    level = 0;
  }
  level = level + 1;
  fill(255);
  rect(0,0,width, height);
  redraw();
   
}

