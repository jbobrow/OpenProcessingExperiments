
// ICE 6 
// copyright eunkic

void setup( ){
  size( 400, 400, P3D );
  background( 0 );
}

void draw( ) {
  prepareWindow( );
  placeShapes( );
}

void prepareWindow( ) {
  background( 0 );
  translate( width/2, height/2, 0 );

  // rotate +30 degrees around the x Axis
  rotateX( radians( frameCount ) );

  // rotate +20 degrees around the y Axis
  rotateY( radians( 20 ) );

  // turn on the light
  lights( );

  stroke( 255, 0, 0 );
  strokeWeight( 5 );
  line(-100, 0, 0, 100, 0, 0 ); // RED x axis line
  stroke( 0, 255, 0 );
  line( 0,-100, 0, 0, 100, 0 ); // GREEN y axis line
  stroke( 0, 0, 255 );
  line( 0, 0,-100, 0, 0, 100 ); // BLUE z axis line
}

void placeShapes( ) {
  
  // cube
  noStroke ();
  translate(0, 0, 0); 
  fill(255, 215, 13);
  box(30);
  
  // sphere on X
  pushMatrix();
  translate(100, 0, 0);
  fill(255, 215, 13);  
  sphere(20);  
  popMatrix();
 
  // sphere on Y
  pushMatrix();
  translate(0, -100, 0);
  fill(255, 215, 13);  
  sphere(20);  
  popMatrix();
  
  // sphere on Z
  noStroke();
  pushMatrix();
  translate(0, 0, -100);
  fill(255, 215, 13);  
  sphere(20);  
  popMatrix();
}



