
void setup()
{
  size(360, 500);
}

void draw()
{
}

int Kombiniere( color Farbe, color Farbe2)
{
  float r1 = red(Farbe);
  float r2 = red(Farbe2);
  float b1 = blue(Farbe);
  float b2 = blue(Farbe2);
  float g1 = green(Farbe);
  float g2 = green(Farbe2);
  
  return color( (r1+r2)/2, (b1+b2)/2, (g1+g2)/2);
}

void Rechteck(color Farbe)
{
  int a = int(random(360));
  int b = int(random(500));
  
  int c = int(random(360)-a);
  int d = int(random(500)-b);
  
  loadPixels();
  
  for(int x = a; x < (c + a); x++)
  {
    for(int y = b; y < (d+b); y++)
    {
      int Stelle = (y * 360) + x;
      pixels[Stelle] = Kombiniere(Farbe, pixels[Stelle]);
    }
  }
  // zuzu
  updatePixels();
}

void Dreieck(color Farbe)
{
  int a = int(random(360));
  int b = int(random(500));
  
  int c = int(random(360)-a);
  int d = int(random(500)-b);
  
  loadPixels();
  
  for(int x = a; x < (c + a); x++)
  {
    for(int y = b; y < ((d+b)/(c+a)) *x; y++)
    {
      int Stelle = (y * 360) + x;
      pixels[Stelle] = Kombiniere(Farbe, pixels[Stelle]);
    }
  }
  // zuzu
  updatePixels();
  
}

void keyPressed()
{
  fill(255,255,255);
  rect(0,0,360,500);
  for( int z = 0; z < random(360); z++)
  {
    Zeichne();
  }
}

void Zeichne()
{
  color Farbe = color(0,0,0);
  int a = int(random(2));
  
  int b = int(random(3));
  switch(b)
  {
    case 0:
      Farbe = color( 125,125,255);
      break;
    case 1:
      Farbe = color( 125,255, 125);
      break;
    case 2:
      Farbe = color( 255, 125,125);
      break;
      
  }
  
  switch(a)
  {
    case 1:
      Rechteck(Farbe);
      break;
    case 0:
      Dreieck(Farbe);
      break;
  }  
}
