
/*

  Farbprogramm RasterPhasendingens Nr 1, v0.1, 
  frei nach Dennis Richters frei nach ...
  von
  Steffen Henschel

  2010 04 17
  
  */

int grid = 32;        // Rasterfaktor: Anzahl der Blöcke in x-Richtung vorzugsweise kgv von 4
int colorFrom = 180;  // Farbbereich von ... 
int colorTo = 255;   //                     bis ...

float phaseStartFactor = 8;
float phaseStep = 0.00005;


float blkChangeColor = 0.1;
float blkColor;
float countBlks = 0.0;
float numOfBlks = 0.0;
int blockSize;
float phaseStart;
float step;

void setup()
{
  size ( 640, 640 );
  frameRate( 20 );
  background ( 180 );
  colorMode( HSB );
  noStroke();
  blockSize = width/grid;
  numOfBlks = grid*grid*height/width;
}

void draw() 
{
  for( int ix = 0; ix < (width/blockSize); ix++ )
  {
    for( int iy = 0; iy < (height/blockSize); iy++ )
    {
      countBlks++;
      
      step += phaseStep;
      phaseStart = countBlks*phaseStartFactor;
      blkColor = map( cos(phaseStart+step)+1, 0, 2, colorFrom, colorTo );
      fill( blkColor, 255, 255 );
      
      pushMatrix();
        translate( ix*blockSize, iy*blockSize );
        rect( 0, 0, blockSize, blockSize );
      popMatrix();
      
      if ( countBlks == numOfBlks ) {
        countBlks = 0;
      }
    }
  }
  if ( keyPressed) {
    
    switch ( key ) {
      
     case 's':
       phaseStep = 0.00000;
       println( "Stop!" );
       break;
     
     case 'c':
       colorFrom = int( random( 255.9 ) ); 
       colorTo = int( random( 255.9 ) );
       println( "Huh! New Colors!" );
       break;
       
      case 'g':
       grid = grid*2;
       if ( grid == 128 ) { grid = 8; }
       blockSize = width/grid;
       numOfBlks = grid*grid*height/width;
       println( "Wow!" );
       break;
    }
    
    switch ( keyCode ) {
      
     case 38:
       phaseStep += 0.000005;
       println( "Steps:" + phaseStep );
       break;
       
     case 40:
       phaseStep -= 0.000005;
       println( "Steps:" + phaseStep );
       break;
     
     case 37:
       phaseStartFactor -= 0.005;
       println( "Phase:" + phaseStartFactor );
       break;
       
     case 39:
       phaseStartFactor += 0.005;
       println( "Phase:" + phaseStartFactor );
       break;
    }
  }
}


