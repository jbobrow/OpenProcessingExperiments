
float radius = 50.8;
int X, Y;
int nX, nY;
int delay = 16;

void setup(){
  size( 700, 500 );
  strokeWeight( 10 );
  frameRate( 32 );
  X = width / 10;
  Y = height / 10;
  nX = X;
  nY = Y;  
}

void draw(){
  
  radius = radius + sin( frameCount / 4 );
  
  X+=(nX-X)/delay;
  Y+=(nY-Y)/delay;
  
  background( 83 );
  
  fill( 0, 150, 184 );
  
 stroke(330); 
  
  ellipse( X, Y, radius, radius );                  
}

void mouseMoved(){
  nX = mouseX;
  nY = mouseY;  
}
