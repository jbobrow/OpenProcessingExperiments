
/* @pjs preload="filmstrip.jpg"; */

PImage filmstrip1, filmstrip2;

int centroHorizontal, anchoStrip, xPosRaton;
float stripSpeed, strip1X, strip2X;

void setup() {
  size( 640, 480 );
  frameRate( 30 );
  
  centroHorizontal = width / 2;
  anchoStrip = 858;
  
  filmstrip1 = loadImage( "filmstrip.jpg" );
  filmstrip2 = loadImage( "filmstrip.jpg" );
  
  strip2X = strip1X - anchoStrip;
  
}

void draw() {
  background( 0 );
  
  xPosRaton = mouseX;
  stripSpeed = ( xPosRaton - centroHorizontal ) / 4.2;
  strip1X -= stripSpeed;
  strip2X -= stripSpeed;
  
  if( ( strip1X + anchoStrip ) <= 0 ) strip1X = strip2X + anchoStrip;
  else if( strip1X >= width ) strip1X = strip2X - anchoStrip;
  
  if( ( strip2X + anchoStrip ) <= 0 ) strip2X = strip1X + anchoStrip;
  else if( strip2X >= width ) strip2X = strip1X - anchoStrip;
  
  pushMatrix();
  translate( strip1X, ( height / 2 ) - ( filmstrip1.height / 2 ) );
  image( filmstrip1, 0, 0 );
  popMatrix();
  
  pushMatrix();
  translate( strip2X, ( height / 2 ) - ( filmstrip2.height / 2 ) );
  image( filmstrip2, 0, 0 );
  popMatrix();
  
}



