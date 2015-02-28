
void setup()
{
  size(800,600);
  background(0);
  stroke(255);
  noFill();
  smooth();
}

void draw()
{
  background(0);
  drawTriangle(0,height,width/2,0,width,height);
}

void drawTriangle(int x1, int y1, int x2, int y2, int x3, int y3)
{
  int cx = ((x1+x2+x3)/3);
  int cy = ((y1+y2+y3)/3);
  float d1 = dist(0,height,cx,cy);
  float d2 = dist(width/2,0,cx,cy);
  float d3 = dist(width,height,cx,cy);
  float r = (mouseX/(width/255))-(d1/3);
  float g = (mouseX/(width/255))-(d2/3);
  float b = (mouseX/(width/255))-(d3/3);
  stroke(r,g,b);
  
  triangle(x1,y1,x2,y2,x3,y3);
  int xa = (x2+x1)/2;
  int ya = (y2+y1)/2;
  int xb = (x3+x2)/2;
  int yb = (y3+y2)/2;
  int xc = (x3+x1)/2;
  int yc = (y3+y1)/2;
  if(x3-x1>13000/(mouseY+1))
  {
    drawTriangle(x1,y1,xa,ya,xc,yc);
    drawTriangle(xa,ya,x2,y2,xb,yb);
    drawTriangle(xc,yc,xb,yb,x3,y3);
  }
}

