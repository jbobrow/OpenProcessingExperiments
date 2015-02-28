
circles[] c;
void setup()
{
  size(470,470);
  smooth();
  stroke(240);
  fill(255,230);

  c = new circles[400];
  for(int i=0; i<400; i++)
  {
    c[i] = new circles();
    c[i].x = random(-width,width);
    c[i].y = random(-height,height);
    c[i].d = (int)random(1,3);
    c[i].v = (int)random(1,5);
  }
}

void draw()
{
  background(0);
  for(int i=0; i<c.length; i++)
  {
    c[i].move();
    c[i].show();
    c[i].back();
  }
}




