
//Stanley L. ,CP1 block 14/15
int x=0;
int y=0;
int z=0;
int w=255;
void setup() 
  {
  rotate(0,PI/4);
  size(500, 500);
  background(255);  
  stroke(0);     
  }
void draw()
{
frameRate(15);
fill(255,11);
rect(0,0,500,500);
}
void mouseMoved()
  {
  fill(x,y,z,25);
  ellipse(pmouseX,mouseY,w,w);  
  ellipse(500-mouseX,500-mouseY,w,w);  
  ellipse(500-mouseX,mouseY,w,w);  
  ellipse(mouseX,500-mouseY,w,w);  
  x=x+ int (random(-256,255));
  if (x>254)
    {x=144};
  y=y+ int (random(-256,255));
   if (y>254)
    {y=144};
  z=z+ int (random(-256,255));
    if (z>254)
    {z=144};
    if (z<1)
    {z=5};
  w=w- int (random(-10,10));
  if (w<3)
  {w=14};
  if (w>450)
  {w=13};
  }
