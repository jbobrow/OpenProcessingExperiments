
// Copyright Shannon Impellicceiri 2014
// Computer Arts with Processing T/H 11:30-1:30
// ICE #9
// 2/18/14

/*
  growing bars
   NO if-ing allowed!
*/

// declare variables
color r = color( 255, 0, 0 );
color b = color( 0, 0, 255 );
color g = color( 0, 255, 0 );
float growthLengthX = 0;
float growthLengthY = 0;

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
  
  // grow columns
  growthLengthX = frameCount % width;
  growthLengthY = frameCount % height;
}

void drawVerticalColumn( float x, float wd, color c)
{
  fill(c);
  //rect(x,0,wd,growthLengthY);
  
  // opposite direction
  rect(x,height-growthLengthY,wd,growthLengthY);
}

void drawHorizontalColumn( float y, float ht, color c)
{
  fill(c);
  //rect(0,y,growthLengthX,ht);
  
  // opposite direction
  rect(width-growthLengthX,y,growthLengthX,ht);
}




