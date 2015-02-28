

float radius = 200;
int X, Y;
int nX, nY;
int delay = 16;

void setup(){
  size( 500, 500 );
  strokeWeight( 5 );
  smooth();
  frameRate( 15 ); 
  X = width / 2;
  Y = width / 2;
  nX = X;
  nY = Y;  
}

void draw(){
  
  radius = radius + sin( frameCount / 4 ); 
  
  X+=(nX-X)/delay;
  Y+=(nY-Y)/delay;
  
  background( 255,255,255 );
  
  fill( 0, 100, 100);
  
  stroke(0,200,200,90); 
  
  ellipse( X, Y, radius+40, radius+40 );  
  
  fill( 239,241,94,80);
  stroke(240,214,90,60); 
  ellipse( X, Y, radius+80, radius+80 ); 
  
  fill( 250,230,88,80);
  stroke(230,250,110,60); 
  ellipse( X, Y, radius, radius );                  
   
  fill( 255,240,120,80);
  stroke(200,220,100,60); 
  ellipse( X, Y, radius-20, radius-20 );
}



