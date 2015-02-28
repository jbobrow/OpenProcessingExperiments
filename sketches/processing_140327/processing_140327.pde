
// ICE 9
float dx;
float ht;
color r = color( 255, 0, 0 );
color b = color( 0, 0, 255 );
color g = color( 0, 255, 0, 0);

void setup ( )
{
  size( 600, 600  );
  fill( 0 ); 
  noStroke( );
  dx = 0;
  ht = 0;
}

void draw ( )
{
  background( 0 );
  drawVerticalColumn( 100, 34, r );
  drawVerticalColumn( 250, 12, g );
  drawVerticalColumn( 350, 42, b );
  println(g);
  println(hex(65280));
  drawHorizontalColumn( 100, 34, r );
  drawHorizontalColumn( 250, 12, g );
  drawHorizontalColumn( 350, 42, b );
}

void drawVerticalColumn( float x, float wd, color c)
{
  fill(c);
  rect(x, 0, wd, frameCount%height);
}

void drawHorizontalColumn( float y, float ht, color c)
{
 fill(c);
 rect(0, y, frameCount%width, ht);
}




