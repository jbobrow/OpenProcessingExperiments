
// Class Demo  Tuesday Septembre 6
// Jim Roberts
// First look at setup, draw, keyPressed, mousePressed
float x, y; //variable declaration

color col;  // this is a variable declaration
color bright;
color dark;

int value=0;
int s;

void setup( )
{
   //size( screen.width, screen.height ); 
   size( 500, 400 ); 
   x = 120; // init
   y = 150;
   s= 0;
   strokeWeight(s);
   col = color( random( 256), random( 256), random( 256), 10 );
   bright = color(204, 102, 0);
   dark = color(51);
   noCursor( );
}

void draw( )
{

  
    x =mouseX;
    y=mouseY;
    background(dark);
    
    smooth();
    stroke(random( 256), random( 256), random( 256));
  strokeWeight(s);
  fill(bright);
  ellipse(x, y+30, x, y+70);
  
  
  fill(dark);
  ellipse(x-8, y+22, x-6, y+70);
  
  
  fill(bright);
  ellipse(x, y, x, y);
  
  fill(dark);
  ellipse(x-4, y-8, x-10, y);
  
  fill(bright);
  ellipse(x+130, y+80, x, y*2);
  
  fill(dark);
  ellipse(x+134, y+88, x-18, y*2);
  
  
  fill(bright);
  ellipse(x+130, y+80, x, y/2);
  
  fill(dark);
  ellipse(x+134, y+96, x-18, y/2+18);
}


void mousePressed( )
{
  
  bright = color( random( 256), random( 256), random( 256) );
  dark = color( random( 256), random( 256), random( 256) );
 // background( random( 256), random( 256), random( 256) );
}

void keyPressed ( )
{
  s=s+10;
}

