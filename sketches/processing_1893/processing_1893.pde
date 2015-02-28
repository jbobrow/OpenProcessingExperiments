
void setup()
{
  size( 600, 480, P3D); 
  frameRate( 30 );
}

int numBlocks = 5;

void draw()
{
  lights();
  background(0);
  perspective(PI/3.0, float(width)/float(height), 1, 1000);
    camera( 50, 50, -100, // eyeX, eyeY, eyeZ
    50, 50, 50, // centerX, centerY, centerZ
    0.0, -1.0, 0.0); // upX, upY, upZ 
    translate( 50, 50, 50 );
    stroke( 0, 0, 0, 100 );
    rotateX( mouseY / 100.0 );
    rotateZ( mouseX / 100.0 );
  for( int r = 0; r < numBlocks; r++ )
  {
    for( int g = 0; g < numBlocks; g++ )
    {
      for( int b = 0; b < numBlocks; b++ )
      {
          int inc = 255/numBlocks;
          fill( r * inc, g * inc, b * inc, 100 );
          pushMatrix();
          float amt = 100.0 / numBlocks;
          translate( r * amt - 50, g * amt - 50, b * amt - 50 );
          box( 5 );
          popMatrix();
      }
    } 
  }
}

void keyPressed()
{
   if( key == CODED )
   {
       if( keyCode == UP )
       {
        numBlocks++;
       }
       if( keyCode == DOWN )
       {
          numBlocks --; 
       }
   }
    
}

