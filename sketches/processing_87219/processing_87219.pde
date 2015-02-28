
//Christian Murphy
//HW #4
//Copyright January 2013

// you need to use spacebar to reset the background with a random color, "a" to draw 
// a random set of lines and ellipse on the canvas, and click to draw a random
// rectangle and ellipse anywhere on the screen!

float x, y, wd, ht, z, c;

void setup( )
{
  size( 400, 400 );
 x = width*.5;
 y = height*.5;
 wd = width*.2;
 ht = height*.3;
 z = mouseX;
 c = mouseY;
  smooth( );
  background(220, 342, 198);

}

void draw( )
{
fill (223); 
  ellipse( width/2, height/2, width++/x, height++/y);
  ellipse( width++, height++, y*random(50), wd/random(50) );
  rect( width++, height++, width/random(350), ht/random(350) );
  ellipse( frameCount++, ht, frameCount*.5, frameCount );
  ellipse( frameCount++, ht, frameCount*.5, ht );
  ellipse( frameCount++, y, frameCount*.5, frameCount );
  ellipse( mouseY++, mouseY, wd, mouseX++);
 
}

void mousePressed( )
{
  fill( random (255),  random (255),  random (255) );
  rect( random (400), random (400), random (105), random (130) );
  ellipse( mouseX , random (100), mouseY, random(100) );
}

void keyPressed( )
{
  if (key == ' ')
  background(random (234), random (234), random (234));
    if (key == ' ')
    fill( random (55) );
ellipse(x*random(2), y, wd, ht*random(2.12) );
 if (key == 'a')
  line( x*random(12), x, y*ht*random(12), y );
line(x, y*random(2), wd*random(2.12), ht );
stroke(155, 155, 332 );
line(x, y*random(4), wd*random(4), ht );
stroke( 55, 21, 20 );

}

