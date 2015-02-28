

float radius = 200;
int X, Y;
int nX, nY;
int delay = 16;

void setup() {
  size( 500, 500 );
  strokeWeight( 5 );
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

  background( 255, 255, 255 );

  fill( 0, 100, 100);

  stroke(0, 200, 200, 90); 

  ellipse( X, Y, radius+40, radius+40 );  

  fill( 255, random(200), random(200), 80);
  stroke(0, 250, 250, 60); 
  ellipse( X, Y, radius+80, radius+80 ); 

  fill( 0, random(200), random(200), 80);
  stroke(0, 150, 150, 60); 
  ellipse( X, Y, radius, radius );                  

  fill( 255, random(50), random(50), 80);
  stroke(0, 250, 250, 60); 
  ellipse( X, Y, radius-20, radius-20 );
}


