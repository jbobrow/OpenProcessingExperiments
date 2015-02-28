
// Homework 9
// Joseph Oak © 2013

float [ ] arrayX = { 

  random( 0, 400 ),
  random( 0, 400 ),
  random( 0, 400 ),
  random( 0, 400 ),
  random( 0, 400 ),
  random( 0, 400 ),
  random( 0, 400 ),
  random( 0, 400 ),
  random( 0, 400 ),
  random( 0, 400 ),

};

float [ ] arrayY = { 

  random( 0, 400 ),
  random( 0, 400 ),
  random( 0, 400 ),
  random( 0, 400 ),
  random( 0, 400 ),
  random( 0, 400 ),
  random( 0, 400 ),
  random( 0, 400 ),
  random( 0, 400 ),
  random( 0, 400 ),

};

int [ ] arrayDiam = { 

  int( random( 20, 80 ) ),
  int( random( 20, 80 ) ),
  int( random( 20, 80 ) ),
  int( random( 20, 80 ) ),
  int( random( 20, 80 ) ),
  int( random( 20, 80 ) ),
  int( random( 20, 80 ) ),
  int( random( 20, 80 ) ),
  int( random( 20, 80 ) ),
  int( random( 20, 80 ) ),
  
};

color [ ] col = {
  
  color( random( 255 ), random( 255 ), random( 255 ) ),
  color( random( 255 ), random( 255 ), random( 255 ) ),
  color( random( 255 ), random( 255 ), random( 255 ) ),
  color( random( 255 ), random( 255 ), random( 255 ) ),
  color( random( 255 ), random( 255 ), random( 255 ) ),
  color( random( 255 ), random( 255 ), random( 255 ) ),
  color( random( 255 ), random( 255 ), random( 255 ) ),
  color( random( 255 ), random( 255 ), random( 255 ) ),
  color( random( 255 ), random( 255 ), random( 255 ) ),
  color( random( 255 ), random( 255 ), random( 255 ) ),
  
};


void setup( ) {
  
  size( 400, 400 );
  background( 255 );
  rectMode( CENTER );
  
  for( int i = 0; i < arrayX.length; i++ ) {
  
    noFill( );
    stroke( col[i] );
    
    rect( arrayX[i], arrayY[i], arrayDiam[i], arrayDiam[i] );
    line( arrayX[i] - ( arrayDiam[i] / 2 ), arrayY[i] - ( arrayDiam[i] / 2 ), arrayX[i] + ( arrayDiam[i] / 2 ), arrayY[i] + ( arrayDiam[i] / 2 ) );
    line( arrayX[i] + ( arrayDiam[i] / 2 ), arrayY[i] - ( arrayDiam[i] / 2 ), arrayX[i] - ( arrayDiam[i] / 2 ), arrayY[i] + ( arrayDiam[i] / 2 ) );
    
    textAlign( CENTER, CENTER );
    fill( col[i] );
    textSize( 14 );
    text( + arrayDiam[i], arrayX[i], arrayY[i] );
  
  }
  
}

