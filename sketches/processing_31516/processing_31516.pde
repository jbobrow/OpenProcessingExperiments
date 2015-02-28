
void setup()
{
  int a = 800;
  size (1400,700);
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
  if(width<height){
    diam=height;}
   
  drawCircle(x, y, diam, level);
   
}
 
void drawCircle(int x, int y, int diam, int level)
{
  fill(random(x/2),random(x/2),random(x/2),random(100-x/4,100));
   
  ellipse(x/2,y/2,diam, diam);
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

