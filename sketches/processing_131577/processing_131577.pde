
//copyright nickiecheung HW4 2/1/2014

//press any key to make the bird flap his wings
//mouse press to change the color of the bird
//mouse wheel to make it foggy

//universal variables
float x, y, dx, dy, xDist, yDist, wd, ht, easingCoef; 
color bgColor;
int birdCol = color( 208, 140, 216 );

void setup()
{
  
  size( 400, 400 );
  background( 255 );
  noCursor();
}


void draw() 
{
  xDist = mouseX;
  yDist = mouseY;
  dx = xDist - x;
  dy = yDist - y;
  easingCoef = 0.5;
  x += dx * easingCoef;
  y += dy * easingCoef;
  wd = 40;
  ht = 40;

  prepareWindow( );
  cloud( );
  //flappy the bird
  smooth( );
  fill( birdCol );
  stroke( 3 );
  ellipse( x, y, wd, ht );
  rectMode(CORNER);
  fill( 255 );
  stroke( .5 );
  rect( x - 19, y + 4, wd * .6, ht * .25, 2, 20, 45, 20 );
  rect( x - 25, y, wd * .7, ht * .25, 2, 20, 45, 70 );
  ellipse( x + 10, y - 5, wd * .2, ht * .3 );
  fill( 0 );
  ellipse( x + 11, y - 3, wd * .1, ht * .1 );
  fill( 242, 158, 68 );
  triangle( x + wd *.5, y, x + wd * .6, y + .2 * ht, x + wd * .45, y + ht * .2);
}

void cloud( )
{
  frameRate( 30 );
  fill( 255);
  noStroke( );
  ellipse( random( 0, 400), random( 0, 200 ), wd*2, ht );
  ellipse( random( 0, 400), random( 0, 200 ), wd*.5, ht*.25 );
  ellipse( random( 0, 400), random( 0, 200 ), wd*2, ht );
  ellipse( random( 0, 400 ), random( 200, 400 ), wd*3, ht );
  ellipse( random( 0, 400 ), random( 200, 400 ), wd, ht * .5);
  ellipse( random( 0, 400), random( 200, 400 ), wd*2, ht );
}

void mouseWheel( )
{
  background( 60, 79, 129, 50);
} 

void prepareWindow( )
{
  bgColor = color( 197, 226, 250 );
  rectMode(CORNER);
  fill( bgColor );
  rect( 0, 0, width, height );
}

void mousePressed() 
{
  if (birdCol == color( 132, 169, 198 )) 
  {
    birdCol = color( random( 0, 255 ), random( 0, 255), random(0, 255) );
  } 
  else 
  {
    birdCol = color( 132, 169, 198 );
  }
}

void keyPressed()
{
  fill( 255 );
  rect( x - 19, y +2, wd * .6, ht * .25, 2, 20, 45, 20 );
  rect( x - 25, y-5, wd * .7, ht * .3, 2, 20, 45, 70 );
  noStroke();
}

void mouseWheel(MouseEvent event) {
  fill( 165, 170, 185, 90 );
   rect( 0, 0, width, height );
   frameRate(4);
}




