

float x, y, oldX, oldY;
float xNoise, yNoise;
float xOffSet, yOffSet;


void setup( )
{
  smooth(); 
  background(255); 
  size( 600, 600 );
  stroke( 0, 16);
  strokeWeight( 1 );


  xNoise = random( width );
  yNoise = random( height );
  xOffSet = 0.001;  
  yOffSet = 0.001;  
}

void draw( )
{
  drawNoisePoint( );
  int s = second();  // Values from 0 - 59

println(s); 

  for (int i = 20; i < s-20; i = i+5) {
    for (int j = 20; j < 600-20; j = j+5) {
      //      point(i, j);
      x = noise( xNoise )  * width ;
      y = noise( yNoise )  * height;
      point( i+x, y );
      xNoise = xNoise + xOffSet;
      yNoise = yNoise + yOffSet;
    }
  }
}
void drawNoisePoint( )
{
}



