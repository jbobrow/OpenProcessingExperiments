
PShape anfang;
PShape huelle;
PShape gefuellt;
PShape ende;
PShape mehr;

void setup ()
{
  background (255);
  size (800, 600);
  smooth();
  frameRate(10);
  anfang = loadShape( "anfang.svg" ); //punkte
  huelle = loadShape( "hülle.svg" ); //Hülle
  gefuellt = loadShape ("Körper_gefüllt.svg" ); //
  ende = loadShape ("MONSTER_ENDE.svg");
  mehr = loadShape ("anfang_mehr.svg");
  
  shape(huelle, -20, 25);

}


void draw()
{

  if ( clickCount == 0 )
  {
    
    background(255); // dass die arme immer nur ein mal zu sehen sind
    shape(huelle, -20, 25);

  }
  else if ( clickCount == 1 )
    {
      shape(gefuellt, -27, 40);
    }

  else if (clickCount == 2)
  {
  shape(anfang, 100, 25); // ab else immer um eins erhöhen
  }
  
/*    else if (clickCount == 3)
  {
  shape(mehr, 100, 25);
  }
 */ 
  
  else if (clickCount == 4)
  {
  shape(ende, -20, 25);
  }
 
}

int clickCount = 0;

void mousePressed ()
{
  clickCount++;
  if ( clickCount > 4 ) clickCount = 0;
}

