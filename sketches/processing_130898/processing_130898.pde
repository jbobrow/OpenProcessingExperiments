
// ICE #5
// eunkic

float x, y, dx, wd, ht;
color bgColor, ellipseColor;

void setup( ) 
{
  size( 400, 400 );
  background( 0 );
  x = 0;
  y = height/2;
  wd = 39;
  ht = 29;
  dx = 1;
  bgColor = color( 0, 10 );
  ellipseColor = color(255, 0, 0 );
  noStroke ( );
}

void draw( )
{
  prepareWindow( );
  moveEllipse( );
  drawEllipse(x, y, wd, ht );
}

void prepareWindow () {
  fill(0, 10);
  rect( 0, 0, width, height );
}

void moveEllipse () {
  x += dx; 
  // x = x + dx
  if ( x > width)
  { dx = -dx;
  }
  else if ( x < 0)
  { dx = -dx;
  }
    
}

void drawEllipse ( float x, float y, float wd, float ht) {
  fill (255, 0, 0);
  ellipse (x, y, wd, ht);
}


