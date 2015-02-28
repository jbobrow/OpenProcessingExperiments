
color bc[] = {color(200,0,0),color(0,200,0),color(0,0,200)};

void ln(float x, float y, float d, float l, int n)
{
  float x1 = l*cos(radians(d));
  float y1 = l*sin(radians(d));
  strokeWeight(n);
  if(n>1)
  {
    stroke(color(85, 61, 14));
  }
  else
  {
    stroke(color(43, 85, 14));
  }
  line(x,y , x+x1, y+y1);
  if(n>0)
  {
    if (n>1)
    {
      ln(x+x1/2, y+y1/2, d+75, l/2, n-1);
      ln(x+x1/2, y+y1/2, d-75, l/2, n-1);
      ln(x+x1, y+y1, d, l/2, n-1);
    }
    else
    {
      for(float f=0.1; f<1; f+=0.2)
      {
        ln(x+x1*f, y+y1*f, d+75, l/2, n-1);
        ln(x+x1*f, y+y1*f, d-75, l/2, n-1);
        ln(x+x1, y+y1, d, l/2, n-1);
      }
    }
  }
  if(n==1)
  {
    fill(bc[int(random(bc.length))]);
    noStroke();
    ellipse(x+x1/2, y+y1/2, 3, 3);
  }
}

void setup()
{
  size(400, 500);
  frameRate(5);
}

void draw()
{
  ln(200,480, -90, 200, 5);
}


