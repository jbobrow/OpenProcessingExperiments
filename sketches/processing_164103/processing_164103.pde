
void setup()
{
  size(500,360);
}

void draw()
{
}

void keyPressed()
{
  Farbe();
  rect(0,0,250,180); 
  Farbe();
  rect(250,0,250,180);
  Farbe();
  rect(0,180,250,180);
  Farbe();
  rect(250,180,250,180);
  Farbe();
  ellipse(250,180,100,100);
  save("Test.jpg");
}

void Farbe()
{
  int x = int(random(6));
  if ( x == 0  )
  {
    fill(255,0,0);
  }
  if ( x == 1 )
  {
    fill(0,255,0);
  }
  if ( x == 2 )
  {
    fill(0,0,255);
  }
  if ( x == 3 )
  {
    fill(255,0,0);
  }
  if ( x == 4 )
  {
    fill(255,255,0);
  }
  if ( x == 5 )
  {
    fill(0,0,255);
  }
}
