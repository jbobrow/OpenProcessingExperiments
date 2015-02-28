
// Noise4 in 3-d
// PGSS 2013
// Copyright Jim Roberts July 2013 Pittsburgh Pa
// Adapted from a program written by John Gruen

float xStart, yStart, xNoise, yNoise;

float sampleSize;

float  transx, transy, transz, rotx;


void setup( )
{
  size( 1000, 600, OPENGL);
  noStroke( );

  xStart = random( 10 );
  yStart = random( 10 );
  
  transz = -345;
  rotx = 45;
  sampleSize = 25;
  
  
  rectMode( CENTER );
  
  textSize( 18 );
  textAlign( CENTER );

}

void draw( )
{
  background( 255 );
  pushMatrix( );
    translate( transx, transy, transz );
    rotateX(radians(rotx) );
    xStart += 0.01;
    yStart += 0.01;
    
    xNoise = xStart;
    yNoise = yStart;
    
    drawGrid( );
  popMatrix( );
  showStats( );
}

void showStats( )
{
   fill( 0 );
   text( "Frame Rate: " + int(frameRate), width/2, height*.93);
}

void drawGrid( )
{
   for( int y = 0; y <= height; y+= sampleSize )
   {
    yNoise += 0.1;
    xNoise = xStart;
    for( int x = 0; x <= width; x+= sampleSize )
    {
      xNoise += 0.1;
      pushMatrix( );
      translate( x, y, 0); 
      drawCloudParticle( x, y, noise( xNoise, yNoise ) ); 
      popMatrix( );
    }
  } 
}

void drawCloudParticle( float x, float y, float noiseFactor )
{
    float gray = map( (( noiseFactor * 255 )) , 0, 300, 0, 255 );
    float trans = 255-(255*noiseFactor);
    fill( gray, trans ); 
    float z = map( gray, 0, 255, 10, 100 );
    translate( 0, 0, int(z/2) );
    fill( gray );
    box( sampleSize, sampleSize, int(z ));  
}





