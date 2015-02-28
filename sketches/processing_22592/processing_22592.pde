
float r,x,y,ex,px,py;
float a,n;
float ox,oy;
float step,_min,_max;
int zeroX,zeroY,topX,topY,_width,_height;
boolean lines,solid;

void setup()
{
  _width = 192;
  _height = 157;
  zeroX = 40;
  zeroY = 40;
  topX = zeroX + _width;
  topY = zeroY + _height;
  
  size(topX,topY);
  background(0);
  stroke(255);
  n = 1;
  a = 0;
  step = 1;
  _min = -200;
  _max = 200;
  ox = (_width/2) + zeroX;
  oy = (_height/2) + zeroY;
  //smooth();
  solid = false;
  lines = false;
}

void draw()
{
  spirals();
//  webs();
}

void spirals()
{
  if((a < _min) || (a > _max))
    step = -step;
  a += step;
  translate(ox,oy);
  background(0);
  for(n = -10; n <= 10; n++)
  {
    ex = 1 / n;
    stroke(map(n,-10,10,128,255));
    if(solid)
      fill(map(n,-10,10,128,255));
    else
       noFill();
    if(lines)
      beginShape();
    for(int i = 0; i < 720; i++)
    {
      r = a * pow(radians(i),ex);
      x = r * cos(radians(i));
      y = r * sin(radians(i));
      if(lines)
        vertex(x,y);
      else
        point(x,y);
    }
    if(lines)
      endShape();
  }
}

void webs()
{
  if((a < _min) || (a > _max))
    step = -step;
  a += step;
  translate(ox,oy);
  background(0);
  for(int i = 0; i < 720; i+=10)
  {
    for(n = -10; n <= 10; n++)
    {
      ex = 1 / n;
      stroke(map(n,-10,10,128,255));
      noFill();
      r = a * pow(radians(i),ex);
      x = r * cos(radians(i));
      y = r * sin(radians(i));
      if(n == -10)
      {
        px = x;
        py = y;
      }
      line(px,py,x,y);
      px = x;
      py = y;
    }
  }
}

void keyPressed()
{
  if((key == 'f') || (key == 'F'))
    solid = !solid;
  if((key == 'L') || (key == 'l'))
    lines = !lines;
}

