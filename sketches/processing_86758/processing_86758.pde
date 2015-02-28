
// Christian Murphy
// Copyright January 2013
// variables

float x, y, wd, ht;

// function definitions

void setup( )
{
 size( 400, 400 ); //arguments must be magic
 x = width*.5;
 y = height*.5;
 wd = width*.2;
 ht = height*.2;
 background( 45, 80, 76 );
 smooth();
}

void draw( )
{
fill( random (255) );
ellipse(x*random(2), y, wd, ht*random(2.12) );
fill ( 200, 55, 78 );
line( x*random(12), x, y*ht*random(12), y );
line(x, y*random(2), wd*random(2.12), ht );
stroke(255, 155, 32 );
line(x, y*random(4), wd*random(4), ht );
stroke( 55, 21, 20 );
point( random(400), random (400) );
point( random(400), random (400) );
point( random(400), random (400) );
point( random(400), random (400) );
point( random(400), random (400) );
point( random(400), random (400) );
point( random(400), random (400) );
point( random(400), random (400) );
point( random(400), random (400) );

// mouse
//top
stroke(random (250), 100, random(250));
ellipse(mouseX , random (2), mouseY, x*.80);
//bottom
stroke(random (250), 100, random(250));
ellipse(mouseX*2 , x*.80, mouseY*4,random (2));
}


