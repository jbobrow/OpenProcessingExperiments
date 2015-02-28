

void setup ()
{
  size( 600, 800 );

  shapeMode (CENTER);

  fuss_links = loadShape( "fuss_l.svg" );
  fuss_rechts = loadShape ("fuss_r.svg");
}

void draw ()
{
  background( 255 );

 fuesse( 300, 650 );

  kopf(290, 150);

  torso(170,200);

 

  arm( -80, 300 );
  pushMatrix();
  scale( -1, 1 );
  arm( -650, 300 );
  popMatrix();



}



