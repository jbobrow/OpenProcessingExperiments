
int x1, y1, x2, y2;
float ii;

void setup()
{
  size(800,800);
  background(0);
  stroke(255,64);
}

void draw()
{
  ii++;
  x1 = (int)(width/2*sin(ii/37) + width/2);
  x2 = (int)(width/2*sin(ii/29) + width/2);
  y1 = (int)(height/2*sin(ii/45) + height/2);
  y2 = (int)(height/2*sin(ii/33) + height/2);
  
  line(x1,y1,x2,y2);
}

