
// Copyright Shannon Impellicceiri 2014
// Computer Arts with Processing T/H 11:30-1:30
// ICE #6
// 2/4/14

// define global variables
float distance;
float boxSize;
float sphereSize;

void setup( )
{
  size( 400, 400, P3D );
  background( 0 );
  
  // initialize variables
  distance = 100; 
  boxSize = 30;
  sphereSize = 20;
}

void draw( ) {
  prepareWindow( );
  placeShapes( ); 
}

void placeShapes( ) {
  fill(255,255,50);
  noStroke();
  
  // box
  pushMatrix();
    box(boxSize);
  popMatrix();
  
  // x-axis sphere
  pushMatrix();
    translate(distance,0,0);
    sphere(sphereSize);
  popMatrix();
  
  // y-axis sphere
  pushMatrix();
    translate(0,-distance,0);
    sphere(sphereSize);
  popMatrix();
  
  // z-axis sphere
  pushMatrix();
    translate(0,0,-distance);
    sphere(sphereSize);
  popMatrix();
}

void prepareWindow( ) {
  background( 0 );
  translate( width/2, height/2, 0 );
  
  // rotate +30 degrees around the x 
  rotateX( radians( frameCount ) );
  
  // rotate +20 degrees around the y 
  rotateY( radians( 20 ) );
  
  // turn on the light 
  lights( );
  
  stroke( 255, 0, 0 );
  strokeWeight( 5 );
  line( -100, 0, 0, 100, 0, 0 ); // RED x axis line
  stroke( 0, 255, 0 );
  line( 0, -100, 0, 0, 100, 0 ); // GREEN y axis line
  stroke( 0, 0, 255 );
  line( 0, 0, -100, 0, 0, 100 ); // BLUE z axis line

}

/*float x,y,dim;

void setup(){
  size(600,600);
  x=0;
  y=0;
  dim=50;
  fill(200,200,0);
  rectMode(CENTER);
}

void draw(){
  translate(x,height/2);
  rotate(radians(frameCount));
  rect(0,0,dim,dim);
  point(0,0);
  x++;
  y++;
  if(x>width){
    x=0;
    fill(random(0,255),random(0,255),random(0,255));
  }
  
}
*/


