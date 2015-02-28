

float radius = 30;
int X, Y;
int nX, nY;
int delay = 16;

void setup() {
  size( 500, 500 );
  strokeWeight( 4 );
  smooth();
  frameRate( 15 ); 
  X = width / 2;
  Y = width / 2;
  nX = X;
  nY = Y;
}


void draw() {

  radius = radius + sin( frameCount / 4 ); 


  X+=(nX-X)/delay;
  Y+=(nY-Y)/delay;


  background(255, 255, 255 );


  fill( 0, 200, 200, 70 );


  stroke(0); 


  ellipse( X, Y, radius, radius );
}

void mouseMoved() {
  nX = mouseX;
  nY = mouseY;
}


