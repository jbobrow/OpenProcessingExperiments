
 
float x, y, sz, dx, dy;
 
void setup()
{
  size (600,600);
 

  x = 300;
  y= 500;
  dx= 20;
  dy= random(50);
  sz= 50;
     
  noStroke();
  smooth();
  
}
 
void draw()
{

background(0);

  fig();
  movFig();
}
 

 
void fig()
{
  fill (255);
  ellipse (x,y,sz,sz);
}
 
 
void movFig()
{
 x+=dx;
 y+=dy;
 if (x>width || x<0)
  {
  dx=-dx;
  }
 else if (y>height||y<0)
  {
  dy=-dy;
  }
}
 
 
 



