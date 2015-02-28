
//copyright Irene Joung 2014
//ICE#6

void setup( )
{
  size( 400, 400, P3D );
  background( 0 ); 
}

void draw( ) 
{
  prepareWindow( );
  placeShapes( ); 
}

void placeShapes( ) 
{
    //box
    fill(255,255,0);
    noStroke();
    box(40);
    
    fill(255,255,0);
    lights();
    //sphere1
    translate(100,0,0);
    sphere(20);
    //sphere2
    translate(-100,-100,0);
    sphere(20);
    //sphere3
    translate(0,100,-100);
    sphere(20);
}

void prepareWindow( ) 
{
  background( 0 );
  translate( width/2, height/2, 0 );
  // rotate +30 degrees around the x 
  rotateX( radians( 30 ) );
  // rotate +20 degrees around the y 
  rotateY( radians( 20 ) );
  // turn on the light 
  lights( );
  stroke( 255, 0, 0 );
  strokeWeight( 5 );
  line( -100, 0, 0, 100, 0, 0 ); 
  stroke( 0, 255, 0 );
  line( 0, -100, 0, 0, 100, 0 ); 
  stroke( 0, 0, 255 );
  line( 0, 0, -100, 0, 0, 100 );
  //Axis Axis
  //RED x axis line GREEN y axis line BLUE z axis line
}


