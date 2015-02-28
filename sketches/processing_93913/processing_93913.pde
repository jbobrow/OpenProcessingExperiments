
/* homework 9 copyright shirleywang 2013 sijiaw*/

float [] xList = {
  random(0,200),
  random(0,200),
  random(0,200),
  random(0,200),
  random(0,200),
  random(0,200),
  random(0,200),
  random(0,200),
  random(0,200),
  random(0,200),
};
 
float [] yList = {
  random(100,350),
  random(100,350),
  random(100,350),
  random(100,350),
  random(100,350),
  random(100,350),
  random(100,350),
  random(100,350),
  random(100,350),
  random(100,350),
};
 
float [] sizeC = {
  random(10,40),
  random(10,40),
  random(10,50),
  random(10,50),
  random(10,80),
  random(10,80),
  random(10,60),
  random(10,60),
  random(10,40),
  random(10,40),
};

float [ ] deltaX = {
   random(10,10),
   random(0,20),
   random(40,30),
   random(80,40),
   random(70,50),
   random(20,60),
   random(60,70),
   random(0,80),
   random(10,90),
   random(20,100),
};

float [ ] deltaY = {
   random(10,10),
   random(10,20),
   random(10,30),
   random(10,40),
   random(10,50),
   random(10,60),
   random(10,70),
   random(10,80),
   random(10,90),
   random(10,100),
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

void setup ( ) {
  size ( 400, 400 );
  background ( 255 );
  colorMode ( HSB );

 
}

void draw ( ) {
  frameRate ( 5);
  moveShapes ( );
     for ( int i = 0; i < xList.length; i++ ) {
    noStroke ( ) ;
    fill ( col [i], 100 );
    ellipse (xList [i], yList [i], sizeC [i], sizeC [i]);
    
    rect (xList [i] * 1.5, yList [i] * .9, sizeC [i ]/ 3, sizeC [i] / 3);
  }
}

void moveShapes ( ) {
  
 for ( int i = 0; i < xList.length; i++ ) {
     xList [i] = xList [i] + deltaX [i];
     yList [i] = yList [i] + deltaY [i];
      
    if ( xList [i] < 0 || yList [i] < 0 || xList [i] > width || yList [i] > height) {
      deltaX [i] = -deltaX [i];
      deltaY [i] = -deltaY [i];
    }
  }
 }

