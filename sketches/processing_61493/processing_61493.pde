
import processing.opengl.*;

// copyright Victoria Adams May 15, 2012
// based on Class Code Set 09 Noise 3 by Jim Roberts 257  copyright Feb 2012
// no input necessary, just a fun visualizaton


float x, y, a;
float xNoise, yNoise;
float xOffSet, yOffSet;
float redNoise, greenNoise, blueNoise;
float redOffSet, greenOffSet, blueOffSet;
color col;
  
void setup( )
{
  size( 600, 600, OPENGL );

  xOffSet = 0.001;
  yOffSet = 0.001;
  redOffSet = 0.01;
  greenOffSet = 0.02;
  blueOffSet = 0.03;

  //noStroke( );
 // fill( 0 );
  background( 0);
  col = color( random( 256 ), random( 256 ), random( 256 ) );
}

void draw( )
{  
  background (0);
  float r = noise(redNoise) * 255;
  float g = noise(greenNoise) * 255;
  float b = noise(blueNoise) * 250;

  col = color( r, g, b); 

  redNoise += redOffSet;
  greenNoise += greenOffSet;
  blueNoise += blueOffSet;

  drawNoiseBall( );
  drawNoiseBall( );
}


void drawNoiseBall( )
{
  x = noise( xNoise )  * width;
  y = noise( yNoise )  * height;

  strokeWeight(2);
  stroke( col );
  fill (0);
  //lights ();
  //noStroke();
  translate (x, y, frameCount%height);
  rotateX(a);
  rotateY(a*2);
  sphere(90);

  xNoise = xNoise - xOffSet;
  yNoise = yNoise + yOffSet;
  
  a += 0.01;
  
}

