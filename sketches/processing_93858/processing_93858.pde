
// Homework 11
// Joseph Oak © 2013

final int MAX = 10;
final int screenwd = 400;
final int screenht = 400;

int [ ] arrayX;
int [ ] arrayY;
int [ ] diam;

int rDelta;

void setup( ) {
  
  size( screenwd, screenht, P3D );
  
  arrayX = new int[ MAX ];
  arrayY = new int[ MAX ];
  diam = new int[ MAX ];
  
  initialize( arrayX, 0, width );
  initialize( arrayY, 0, height );
  initialize( diam, 10, 80 );
  
}

void draw( ) {
  
  lights( );
  background( 255 ); 
  
  drawBoxes( );
  moveBoxes( );
  rDelta++;
  
  function( width/2, height/2, rDelta, rDelta);
  
}

// DRAWS UNIQUE FIGURE

void function( int tranX, int tranY, int rotX, int rotY ) {
  
  stroke( 255, 0, 0 );
  noFill( );
  translate( tranX, tranY, 0 );
  rotateX( radians( rotX ) );
  rotateY( radians( rotY ) );
  box( 80 );
  
  line( 0, 0, 0, 40, 40, 40);
  line( 0, 0, 0, -40, -40, -40);
  
  line( 0, 0, 0, -40, 40, 40);
  line( 0, 0, 0, 40, -40, 40);
  line( 0, 0, 0, 40, 40, -40);
  
  line( 0, 0, 0, -40, -40, 40);
  line( 0, 0, 0, 40, -40, -40);
  line( 0, 0, 0, -40, 40, -40);
  
  noStroke( );
  fill( 255, 0, 0 );
  box( 20 );
  
}

// BOX FUNCTIONS

void drawBoxes( ) {
  
  for ( int i = 0; i < arrayX.length; i++ ) {
    
    pushMatrix( );
    
      stroke( 0 );
      noFill( );
      translate( arrayX[i], arrayY[i], 0 );
      rotateY( radians( rDelta ) );
      box( diam[i]/10 , diam[i], diam[i]/10 );
      
    popMatrix( );
    
  }
  
}
  
void moveBoxes( ) {
  
  for ( int i = 0; i < arrayY.length; i++ ) {
    
    arrayY[i]++;
    
    if( arrayY[i] >= screenht + diam[i] )
    {
       arrayY[i] = -diam[i]; 
    } 
    else if ( arrayY[i] < -diam[i])
    {
      arrayY[i] = screenht + diam[i]; 
    }
    
  }
  
}

// RANDOMLY INITIALIZES VALUES INTO GIVEN ARRAYS

void initialize( int [ ] initial, int  min, int max ) {
  
  for ( int i = 0; i < initial.length; i++ ) {
    
    initial[i] = int( random( min, max ));
    
  }
  
}

