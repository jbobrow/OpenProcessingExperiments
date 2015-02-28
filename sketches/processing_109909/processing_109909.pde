
int rad = 30;
float xpos, ypos;
float xspeed = 2.8; 
float yspeed = 2.2;
int xdirection = 1;
int ydirection = 1;


void setup ()  {
  size( 600, 400 );
  noStroke();
  frameRate( 70 );
  ellipseMode( RADIUS );
  
  xpos = width/2;
  ypos = height/2;
}

void draw ()  {
  
  background( 0 );
  fill( 72, 76, 255 );
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  if ( xpos > width - rad || xpos < rad )  {
    xdirection *= -1;
  }
  
  if ( ypos > height - rad || ypos < rad )  {
    ydirection *= -1;
  }
  
  ellipse( xpos, ypos, rad, rad );
 
}
