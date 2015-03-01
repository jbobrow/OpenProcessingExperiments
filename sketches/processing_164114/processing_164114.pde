
void setup()
{
  size(600,600);
}

void draw()
{
}

void farben(int rot, int grun, int blau)
{
  int z = int(random(3));
  if ( z == 0 )
  {
    fill(255 - rot, grun, blau);
  }
  if ( z == 1 )
  {
    fill(rot,255- grun, blau);
  }
  if ( z == 2 )
  {
    fill(rot, grun, 255 - blau);
  }
}

void keyPressed()
{
  int rot = int(random(255));
  int grun = int(random(255));
  int blau = int(random(255));
  farben(rot, grun, blau);
  rect(0,400,600,200);
  fill(rot,grun,blau);
  triangle(0,400, 300,0, 600,400);
  farben(rot, grun, blau);
  triangle(0,400, 300,0, 0,0);
  farben(rot, grun, blau);
  triangle(300,0, 600,0, 600,400);
}
