
void setup ( )
{
  size(360,500);
}

void draw()
{
}

int Farben( int Farbe )
{
  if( Farbe ==0 ) { fill(0,0,255);};
  if( Farbe ==1 ) { fill(255,0,0);};
  if( Farbe ==2 ) { fill(0,255,0);};
  Farbe = Farbe + 1;
  if ( Farbe > 2) {Farbe =0;};
  return ( Farbe);
}


void MalleRaster(int Abstand)
{
  int Farbe = 0;
  for( int i = 0; i < ( 360 / Abstand ); i = i + 2)
  {
    Farbe = Farben( Farbe);
    rect(i * Abstand, 0, Abstand, 500);
  }
}

void keyPressed()
{
  fill(0,0,0);
  rect(0,0,360,500);
  float Halbiere = random(100) ;
  float abstand = 100;
  while((Halbiere - mouseX) > abstand)
    {
      Halbiere = Halbiere/2;
    }  
    println(Halbiere);
    MalleRaster(int(Halbiere));
    save("Test");
}
