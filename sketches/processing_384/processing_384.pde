
class Bubble 
{ 
  color c; 
  float x;  // location, of course
  float y; 
  int seedX;  // for the noise
  int seedY; 
  int alphaValue;
  int diameter; 
  int leftBound;
  int rightBound;
  int topBound;
  int bottomBound;
  float noiseInput; 
  float amp; // the magnitude of the intensity of the noise
  float move; 
  float dSeed; // delta seed: amount to change noiseInput by

  Bubble( int x, int y ) 
  { 
    this.x = x; 
    this.y = y; 
    // pick random seeds for the noise function
    seedX = (int)random(1000);
    seedY = (int)random(1000);
    alphaValue = 10; 
    // pick a random color
    c = color( random(255), random(255), random(255) );
    alphaValue = 7;
    diameter = width/10; 
    noiseInput = 1.00; // initial noise value
    dSeed = .02; 
    amp = diameter; 
    topBound = 0;
    leftBound = 0;
    rightBound = width;
    bottomBound = height;
  } 

  void update() 
  { 
    // set the stage ///////////
    fill( c, alphaValue ); 
    stroke( c, alphaValue*5 );
    // draw the bubble /////////
    ellipse( x, y, diameter, diameter ); 
    // get ready for next iteration /////
    noiseInput += dSeed;      // increment the noiseInput
    // increment the x ///////
    noiseSeed(seedX);                       // establish x's seed
    move = amp*noise(noiseInput) - (amp/2); // scale noise to -amp to +amp
    x += move;                              // add the new value to x
    // increment the y ///////
    noiseSeed(seedY); 
    move = amp*noise(noiseInput) - (amp/2); 
    y += move;  
    // bounds check ////
    if ( x < leftBound ) { 
      x = leftBound + 1; 
    }
    if ( x > rightBound ) { 
      x = rightBound-1; 
    }
    if ( y < topBound ) { 
      y = topBound + 1; 
    }
    if ( y > bottomBound ) { 
      y = bottomBound-1; 
    }
  }

  void shrinkBounds()
   {
     int margin = diameter/2;
     topBound += margin;
     bottomBound -= margin;
     leftBound += margin;
     rightBound -= margin;
   }
   
   void shrinkBoundsMore()
   {
     diameter = 2*diameter/3;
     topBound = 0;
     bottomBound = height;
     leftBound = 0;
     rightBound = width;
   }
     
} 

