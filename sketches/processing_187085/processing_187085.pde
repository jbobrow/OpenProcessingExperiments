
// Written by Jakob Thomsen

float time;

float ax;
float ay;
float bx;
float by;
float cx;
float cy;

float toScrX(float x)
{
  return float(width) * (x + 1.0) / 2.0;
}

float toScrY(float y)
{
  return float(height) * (y + 1.0) / 2.0;
}

float toScrSX(float x)
{
  return float(width) * x / 2.0;
}

float toScrSY(float y)
{
  return float(height) * y / 2.0;
}

class pt
{
  float x;
  float y;
  
  pt()
  {
    x = 0;
    y = 0;
  }

  pt(float _x, float _y)
  {
    x = _x;
    y = _y;
  }
}

pt triangle_circumcenter(float ax, float ay, float bx, float by, float cx, float cy)
{
  float d = 2.0*(ax*(by-cy)+bx*(cy-ay)+cx*(ay-by));
  pt result = new pt();
  float aa = ax*ax+ay*ay;
  float bb = bx*bx+by*by;
  float cc = cx*cx+cy*cy;   
  result.x = (aa*(by-cy)+bb*(cy-ay)+cc*(ay-by))/d;
  result.y = (aa*(cx-bx)+bb*(ax-cx)+cc*(bx-ax))/d;
  
  return result;
}

float triangle_circumradius(float ax, float ay, float bx, float by, float cx, float cy)
{
  float abx = ax - bx;
  float aby = ay - by;
  float C = sqrt(abx * abx + aby * aby);
  
  float bcx = bx - cx;
  float bcy = by - cy;
  float A = sqrt(bcx * bcx + bcy * bcy);
  
  float cax = cx - ax;
  float cay = cy - ay;
  float B = sqrt(cax * cax + cay * cay);
  
  return (A*B*C) / sqrt((A+B+C)*(B+C-A)*(C+A-B)*(A+B-C));
}

boolean inside_triangle(float ax, float ay, float bx, float by, float cx, float cy, float x, float y)
{
  // convert position to barycentric coordinates
  float d = (by - cy) * (ax - cx) + (cx - bx) * (ay - cy);
  float alpha = ((by-cy)*(x-cx)+(cx-bx)*(y-cy)) / d;
  float beta = ((cy-ay)*(x-cx)+(ax-cx)*(y-cy)) / d;
  float gamma = 1.0 - alpha - beta;
  
  return !(alpha < 0 || alpha > 1 || beta < 0 || beta > 1 || gamma < 0 || gamma > 1);
}

boolean inside_circle(float cr, float cx, float cy, float x, float y)
{
  float dx = x - cx;
  float dy = y - cy;
  
  return dx * dx + dy * dy <= cr * cr;
}

void setup()
{
  size(512, 512);
  colorMode(RGB, 1);
  time = 0;
  
  ax = 10;
  ay = 10;
  bx = 300;
  by = 50;
  cx = 150;
  cy = 200;
}

void draw()
{
  background(0);
  float dt = frameRate;
  if(dt != 0)
  {
    time += dt;
  }
  else
  {
    time = float(millis()) / 1000.0;
  }
  
  // rect(toScrX(-0.5), toScrY(-0.5), toScrSX(1.0), toScrSY(1.0));
  stroke(1);
  strokeWeight(1);
  triangle(ax, ay, bx, by, cx, cy);
  pt q = triangle_circumcenter(ax, ay, bx, by, cx, cy);
  float r = triangle_circumradius(ax, ay, bx, by, cx, cy);
  stroke(0,0,1);
  strokeWeight(10);
  point(q.x, q.y);
  strokeWeight(1);
  noFill();
  stroke(0,0,1);
  ellipse(q.x, q.y, 2.0 * r, 2.0 * r);

  strokeWeight(10);
  if(inside_circle(r, q.x, q.y, mouseX, mouseY))
  {
    if(inside_triangle(ax, ay, bx, by, cx, cy, mouseX, mouseY))
    {
      stroke(0,1,0);
    }
    else
    {
      stroke(1,0,0);
    }
  }
  else
  {
    stroke(0,0,1);
  }

  point(mouseX, mouseY);

  if(mousePressed)
  {
    if(mouseButton == LEFT)
    {
      ax = mouseX;
      ay = mouseY;
    }
    if(mouseButton == CENTER)
    {
      bx = mouseX;
      by = mouseY;
    }
    if(mouseButton == RIGHT)
    {
      cx = mouseX;
      cy = mouseY;
    }
  }
}

