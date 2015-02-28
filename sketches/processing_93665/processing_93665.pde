
// Homework 10
// Joseph Oak © 2013
 
float [ ] arrayX = {
 
  random( 50, 350 ),
  random( 50, 350 ),
  random( 50, 350 ),
  random( 50, 350 ),
  random( 50, 350 ),
  random( 50, 350 ),
  random( 50, 350 ),
  random( 50, 350 ),
  random( 50, 350 ),
  random( 50, 350 ),
 
};
 
float [ ] arrayY = {
 
  random( 50, 350 ),
  random( 50, 350 ),
  random( 50, 350 ),
  random( 50, 350 ),
  random( 50, 350 ),
  random( 50, 350 ),
  random( 50, 350 ),
  random( 50, 350 ),
  random( 50, 350 ),
  random( 50, 350 ),
 
};
 
int [ ] arrayDiam = {
 
  int( random( 30, 80 ) ),
  int( random( 30, 80 ) ),
  int( random( 30, 80 ) ),
  int( random( 30, 80 ) ),
  int( random( 30, 80 ) ),
  int( random( 30, 80 ) ),
  int( random( 30, 80 ) ),
  int( random( 30, 80 ) ),
  int( random( 30, 80 ) ),
  int( random( 30, 80 ) ),
   
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

float [ ] deltaX = {
  
  1,
  - 1,
  1,
  - 1,
  1,
  - 1,
  1,
  - 1,
  1,
  - 1,
  
};

float [ ] deltaY = {
  
  1,
  - 1,
  1,
  - 1,
  1,
  - 1,
  1,
  - 1,
  1,
  - 1,
  
};
 
void setup( ) {
   
  size( 400, 400 );
  background( 255 );
  rectMode( CENTER );
 
  frameRate( 100 );
  
}

void draw( ) {
  
  noStroke( );
  fill( 255 );
  rect( width / 2, height / 2, width, height );
  drawShapes( );
  moveShapes( );
  
}

void drawShapes( ) {
  
  for ( int i = 0; i < arrayX.length; i++) {
     
    noFill( );
    stroke( col[i] );
    
    rect( arrayX[i], arrayY[i], arrayDiam[i], arrayDiam[i] );
    line( arrayX[i] - ( arrayDiam[i] / 2 ), arrayY[i] - ( arrayDiam[i] / 2 ), arrayX[i] + ( arrayDiam[i] / 2 ), arrayY[i] + ( arrayDiam[i] / 2 ) );
    line( arrayX[i] + ( arrayDiam[i] / 2 ), arrayY[i] - ( arrayDiam[i] / 2 ), arrayX[i] - ( arrayDiam[i] / 2 ), arrayY[i] + ( arrayDiam[i] / 2 ) );
    
    textAlign( CENTER, CENTER );
    fill( col[i] );
    textSize( 14 );
    text( + int( deltaX[i] ) + "," + int( deltaY[i] ), arrayX[i], arrayY[i] );
    
  };
  
}

void moveShapes( ) {
  
  for ( int i = 0; i < deltaX.length; i++) {
    
    float buffer = arrayDiam[i] / 2;
    
    arrayX[i] += deltaX[i];
    arrayY[i] += deltaY[i];
  
    if ( arrayY[i] > height - buffer ) { // BOUNCE BOTTOM
    
      deltaY[i] = - deltaY[i];
      
      if ( deltaX[i] >= 0 && deltaY[i] <= 0 ) { // JUDGES ANGLE OF ENTRY
        deltaX[i] = deltaX[i];
      }
      
    } else if ( arrayX[i] > width - buffer ) { // BOUNCE RIGHT
    
      deltaX[i] = - deltaX[i];
      
      if ( deltaX[i] <= 0 && deltaY[i] <= 0 ) { // JUDGES ANGLE OF ENTRY
        deltaY[i] = deltaY[i];
      }
      
    } else if ( arrayY[i] < buffer) { // BOUNCE TOP
    
      deltaY[i] = - deltaY[i];
      
      if ( deltaX[i] >= 0 && deltaY[i] >= 0 ) { // JUDGES ANGLE OF ENTRY
        deltaX[i] = deltaX[i];
      }
      
    } else if ( arrayX[i] < buffer ) { // BOUNCE LEFT
    
      deltaX[i] = - deltaX[i];
      
      if ( deltaX[i] <= 0 && deltaY[i] >= 0) { // JUDGES ANGLE OF ENTRY
        deltaY[i] = - deltaY[i];
      }
      
    }
    
  };
  
}

