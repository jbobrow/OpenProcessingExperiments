
// Homework 4
// Vishal Agrawal    
// vishla@andrew.cmu.edu
// copyright (C) 2012

/*
  Rotate
  Up Arrow | Down Arrow - rotate along X axis
  Left Arrow | Down Arrow - rotate along Y axis
  < - rotate anti-clockwise
  > - rotate clockwise
  
  Lateral Movement
  r - move right
  l - move left
  u - move up
  d - move down
  i - zoom in
  o - zoom out
  
  Reset
  Space Bar - reset
*/
PFont f1;

float lateralx, increaseLateralx;
float lateraly, increaseLateraly;
float lateralz, increaseLateralz;

int rotationx, rotationxIncrease;
int rotationy, rotationyIncrease;
int rotationz, rotationzIncrease;

void setup( )
{
  // Setting the size of the graphics window
  size( 500, 500, P3D );
  lights( );  
  
  // Loading Font
  f1 = loadFont( "f1.vlw" );
  textFont( f1 ); 
  
  // Setting Background Color to Black
  background( #000000 ); 
 
  noStroke( );
  
  // Initializations  
  lateralx = 0;
  increaseLateralx= (width*0.1); 
 
  lateraly = 0;
  increaseLateraly= (height*0.1); 
  
  lateralz = 0;
  increaseLateralz= (height*0.1); 
  
  rotationx = 0;
  rotationxIncrease = 10;
  
  rotationy = 0;
  rotationyIncrease = 10;
  
  rotationz = 0;
  rotationzIncrease = 10;
}

void drawAxis( )
{
  fill( 255 );
  
  // X-axis
  stroke( 255, 0, 0 );
  strokeWeight( 1 );
  
  line( lateralx+(-(width*0.4)), lateraly+(0), lateralz+(0), lateralx+(width*0.4), lateraly+(0), lateralz+(0));
  text( 'W', lateralx+(-(width*0.4)), lateraly+0, lateralz+0);
  text( 'E', lateralx+(width*0.4), lateraly+0, lateralz+0);
  
  // Y-axis
  stroke( 0, 255, 0 );
  
  line( lateralx+(0),  lateraly+(-200), lateralz+(0), lateralx+(0), lateraly+(200), lateralz+(0) );
  text( 'N', lateralx+(0), lateraly+(-(height*0.4)), lateralz+(0));
  text( 'S', lateralx+(0),  lateraly+(height*0.4), lateralz+(0));
  
  // Z-axis
  stroke(255, 255, 0 );
  
  line( lateralx+(0), lateraly+(0), lateralz+(-200), lateralx+(0), lateraly+(0), lateralz+(200));
  text( 'F', lateralx+(0), lateraly+(0), lateralz+(-200));
  text( 'B', lateralx+(0), lateraly+(0), lateralz+(200)); 
}

void drawInitial()
{
  // Edge of box
  int x= int(width*.1);
  // Lighting
  lights( );

  noStroke ();

  pushMatrix( );
    translate( lateralx+(-width*(0.6)), lateraly+(-height*(0.6)), lateralz+(-400) );  
    fill( #FA5305 );
    box( x );
  popMatrix( );
  
  pushMatrix( );
    translate( lateralx+(-width*(0.5)), lateraly+(-height*(0.5)), lateralz+(-200) ); 
    fill( #FA5305 );
    box( x );
  popMatrix( );

  pushMatrix( );
    translate( lateralx+(-width*(0.4)), lateraly+(-height*(0.4)), lateralz+(0) );   
    fill( #FA5305);
    box( x );
  popMatrix( );

  pushMatrix( );
    translate( lateralx+(-width*(0.4)), lateraly+(-height*(0.35)), lateralz+(-200) ); 
    fill( #FA5305 );
    box( x );
  popMatrix( );

  pushMatrix( );
    translate( lateralx+(-width*(0.3)), lateraly+(-height*(0.20)), lateralz+(-200) ); 
    fill( #FA5305 );
    box( x );
  popMatrix( );
  
  pushMatrix( );
    translate( lateralx+(-width*(0.2)), lateraly+(-height*(0.05)), lateralz+(-200) );  
    fill( #FA5305 );
    box( x );
  popMatrix( );  
  
  pushMatrix( );
    translate( lateralx+(-width*(0.1)), lateraly+(height*(0.10)), lateralz+(-200) ); 
    fill( #FA5305 );
    box( x );
  popMatrix( );

  pushMatrix( );
    translate( lateralx+(width*(0)), lateraly+(height*(0.25)), lateralz+(-200) ); 
    fill( #FA5305 );
    box( x );
  popMatrix( );

  pushMatrix( );
    translate( lateralx+(width*(0.1)), lateraly+(height*(0.10)), lateralz+(-200) ); 
    fill( #FA5305 );
    box( x );
  popMatrix( );

  pushMatrix( );
    translate( lateralx+(width*(0.2)), lateraly+(-height*(0.05)), lateralz+(-200) );  
    fill( #FA5305 );
    box( x );
  popMatrix( );

  pushMatrix( );
    translate( lateralx+(width*(0.3)), lateraly+(-height*(0.20)), lateralz+(-200) ); 
    fill( #FA5305 );
    box( x );
  popMatrix( );

  pushMatrix( );
    translate( lateralx+(width*(0.4)), lateraly+(-height*(0.35)), lateralz+(-200) ); 
    fill( #FA5305 );
    box( x );
  popMatrix( );

  pushMatrix( );
    translate( lateralx+(width*(0.4)), lateraly+(-height*(0.4)), lateralz+(-0) );   
    fill( #FA5305);
    box( x );
  popMatrix( );

  pushMatrix( );
    translate( lateralx+(width*(0.5)), lateraly+(-height*(0.5)), lateralz+(-200) ); 
    fill( #FA5305 );
    box( x );
  popMatrix( );
  
  pushMatrix( ); 
    translate( lateralx+(width*(0.6)), lateraly+(-height*(0.6)), lateralz+(-400) );  
    fill( #FA5305 );
    box( x );
  popMatrix( );
}

void keyPressed( )
{
  if (key == 'r')
  {
    lateralx += increaseLateralx; 
  }
  else if (key == 'l')
  {
    lateralx -= increaseLateralx;
  }
  else if (key == 'd')
  {
    lateraly += increaseLateraly;
  }
  else if (key == 'u')
  {
    lateraly -= increaseLateraly;
  }  
  else if (key == 'i')
  {
    lateralz += increaseLateralz;
  }
  else if (key == 'o')
  {
    lateralz -= increaseLateralz;
  }  
  else if (key == ',')
  {
    rotationz -= rotationzIncrease;
  }
  else if (key == '.')
  {
    rotationz += rotationzIncrease;
  }
  // Using ASCII code for SPACEBAR
  else if (key == 32 )
  {
    lateralx = 0;
 
    lateraly = 0; 
  
    lateralz = 0;
  
    rotationx = 0;
 
    rotationy = 0;

    rotationz = 0;
  }
  else if (key == CODED)
  {
      if (keyCode == UP)
      {
        rotationx -= rotationxIncrease;
      }
      else if (keyCode == DOWN)
      {
        rotationx += rotationxIncrease;
      }
      else if (keyCode == RIGHT)
      {
        rotationy -= rotationyIncrease;
      }
      else if (keyCode == LEFT)
      {
        rotationy += rotationyIncrease;
      }
  }
}

void draw( )
{
  // This moves the (0,0,340) point to the center of the window  
  translate( width/2, height/2, 0 );  
  
  // Setting Background Color to Black 
  background( #000000 ); 
  
  rotateX( radians( rotationx ) );
  rotateY( radians( rotationy ) );
  rotateZ( radians( rotationz ) );
 
  // Calling the drawInitials() function
  drawInitial();
  
  // Calling the drawAxis() function
  drawAxis( );
}



