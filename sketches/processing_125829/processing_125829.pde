
void setup()
{
  size(360,500);
}

void draw()
{
}

void Rechteck(int x, int y, int dx, int dy)
{
  fill(random(255), random(255), random(255));
  rect(x, y, dx, dy);
}

void Teilung( int x, int y, int dx, int dy, int z)
{
  z = z + 1;
  int r = int(random(10));
  if( r > z )
  {
  if ( dx < dy)
  {
    r = int(random(2));
    if ( r < 1)
    {
      Teilung(x,y, dx, dx, z);
      Teilung(x, dx, dx, dy - dx, z);
    } else {
      Teilung(x, y, dx, dy - dx, z);
      Teilung(x, y+ dy- dx, dx, dx, z);
    } 
  } else {
    r = int(random(2));
    if ( r < 1)
    { 
      Teilung(x,y, dy, dy, z);
      Teilung(dx, y + dy, dy - dx, dy, z);
    } else {
      Teilung(x, y, dx - dy, dy, z);
      Teilung(x + dx - dy, y,dx, dy, z); 
    }
  }
  } else {
   Rechteck(x, y, dx, dy);
  } 
}

void keyPressed()
{
  Teilung(0,0, 500, 360,0);
  save("R.jpg");
}
