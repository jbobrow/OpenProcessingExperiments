
void setup()
{
  size(360,500);
}

void draw()
{
}

void Strichelung( int Start, int Breite)
{
  int b = int(random(50)+1);
  int TeilBreite = Breite / b;
  
  for ( int j = 0; j < b; j++)
  {
    rect((j*TeilBreite)+Start, 0, ((j+1)*TeilBreite)+Start, 500); 
  }
}

void keyPressed()
{
  fill(0,0,0);
  rect(0,0,360,500);
  int a = int(random(50)+1);
  int Breite = int(360 / a);
  fill( 255, 255, 255);
  for( int i = 0; i < a; i ++)
  {
    Strichelung( Breite * i, Breite );
  }
  save("Test");
}
