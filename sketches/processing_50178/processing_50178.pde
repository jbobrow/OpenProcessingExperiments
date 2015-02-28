
// Homework #3 48-257 Programming in the Arts with Processing
// Will Crownover wlc@andrew.cmu.edu
// Copyright January 2012

void setup()
{
  size( 400, 400 );
  background( 200, 255, 255 ); 
  smooth();
}

void draw()
{
  
}

void mouseDragged()
{
  noStroke();
  fill( 200, 255, 255, mouseY/20 );
  rect( 0, 0, 400, 400 );
  
  fill( 200, 255, 255 );
  rect( 0, mouseY - 350, 400, 200 );
  fill( 220, 200, 0 );
  ellipse( 25, mouseY - 200, 50, 50 );
  stroke( 0, 200, 255 );
  strokeWeight( 1 );
  line( mouseX, mouseY + mouseX/10, mouseX, mouseY + mouseX/10 + 30 );
  strokeWeight( 1 );
  line( mouseX, mouseY + mouseX/10 + 60, mouseX, mouseY + mouseX/10 + 90 );
  strokeWeight( 1 );
  line( mouseX, mouseY + mouseX/10 + 120, mouseX, mouseY + mouseX/10 + 150 );
  strokeWeight( 1 );
  line( mouseX, mouseY + mouseX/10 + 180, mouseX, mouseY + mouseX/10 + 210 );
  strokeWeight( 1 );
  line( mouseX, mouseY + mouseX/10 + 240, mouseX, mouseY + mouseX/10 + 270 );
  strokeWeight( 1 );
  line( mouseX, mouseY + mouseX/10 + 300, mouseX, mouseY + mouseX/10 + 330 );
  stroke( mouseY/2 );
  strokeWeight( abs(mouseX - pmouseX) + 5 );
  line( pmouseX, pmouseY, mouseX, mouseY );
}
