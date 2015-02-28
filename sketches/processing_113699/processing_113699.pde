
void setup()
{
  size(360, 500);
  frameRate(0.3);
}

void draw()
{
  fill(0,0,0);
  rect(0,0, 360, 500);
  Teilung( 0, 0, 360, 500);
}

void Teilung(int x, int y, int w, int h)
{
  fill(random(255), random(255), random(255));
  int f = int(random(2));
  switch(f)
  {
    case 0:
      rect(x,y,w,h);
      break;
    case 1:
      Teilung(x,y,int(w/1.68), h);
      Teilung(x+int(w/1.68), y, w - int( w / 1.68), h);
      break;
  }
}
