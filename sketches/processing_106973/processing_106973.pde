
void setup()
{
  size ( 600, 300);
}

void draw()
{
}

int Farben(int Farbe)
{
  if( random(1) < 0.1 )
  {
  Farbe = Farbe + 1;
  if( Farbe > 2 ) { Farbe = 0; };
  if ( Farbe == 0 )
  {
    fill(random(255), random(255),255);
  }
  if ( Farbe == 1 )
  {
    fill(255, random(255),random(255));
  }
  if ( Farbe == 0 )
  {
    fill(random(255),255,random(255));
  }
  }
  return Farbe;
}

void keyPressed()
{
  int Farbe = 0;
  noStroke();
  for( int i = 0; i < 600; i++)
  {
    Farbe = Farben(Farbe);
    rect(i, 0, 1, 300);

  }
}
