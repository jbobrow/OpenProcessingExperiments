
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

  for ( int i = 0; i < xList.length; i++ ) {
    noStroke ( ) ;
    fill ( col [i], 100 );
    ellipse (xList [i], yList [i], sizeC [i], sizeC [i]);
    
    rect (xList [i] * 1.5, yList [i] * .9, sizeC [i ]/ 3, sizeC [i] / 3);
  }
}



