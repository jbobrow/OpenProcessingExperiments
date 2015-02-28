
// ICE 9
//Miranda Jacoby Copyright 2014 All Rights Reserved

/*
  growing bars
   NO if-ing allowed!
*/


color r = color( 255, 0, 0 );
color b = color( 0, 0, 255 );
color g = color( 0, 255, 0 );

void setup ( )
{
  size( 600, 600  );
  fill( 0 ); 
  noStroke( );
}

void draw ( )
{
  background( 0 );
  
  drawVerticalColumn( 100, 34, r );
  drawVerticalColumn( 250, 12, g );
  drawVerticalColumn( 350, 42, b );
  
  drawHorizontalColumn( 100, 34, r );
  drawHorizontalColumn( 250, 12, g );
  drawHorizontalColumn( 350, 42, b );
}

void drawVerticalColumn( float x, float wd, color c)
{
  fill(c);
  rect(x, 0, wd, frameCount%601); 
}

void drawHorizontalColumn( float y, float ht, color c)
{
  fill(c);
  rect(0, y, frameCount%601, ht);
}




