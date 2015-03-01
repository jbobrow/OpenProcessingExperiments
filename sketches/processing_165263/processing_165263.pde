
float n, angle;
float h = 0;
float v = 5;

void setup()
{
  size(600,600);
  background(255,0);
}

void draw()
{
  background(255, 0);
  translate((width+2*h)/2,(height+2*v)/2);
  for(n = 400; n > 0; n += -17)
  {
    if(n == 400)
    {
      fill(255-(n/4), 255-(n/7), 255-(n/3));
      new equiTriangle(n);
      rotate(angle);  
    }
    else
    {
      fill(255-(n/4), 255-(n/7), 255-(n/3));
      new equiTriangle(n);
      rotate(angle);  
    }
  }
  angle+=.005;
  if (frameCount%2==0 & frameCount<1260) saveFrame("lotus-###.gif");
}

class equiTriangle
{
  float x1, y1, x2, y2, x3, y3;
  equiTriangle(float n)
  {
    strokeWeight(1);
    x1 = -(0.5*n)-h;
    y1 = (0.4330127019*n)-v;
    x2 = 0-h;
    y2 = -(0.4330127019*n)-v;
    x3 = (0.5*n)-h;
    y3 = (0.4330127019*n)-v;
    triangle(x1,y1,x2,y2,x3,y3);
    
  }
}


