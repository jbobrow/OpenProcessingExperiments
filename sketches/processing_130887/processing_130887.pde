
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
ellipseColor = color(255, 0, 0 );
noStroke ( );
}

void drawEllipse() {
  fill(ellipseColor);
  ellipse(x,y,wd,ht);
}

void keyPressed() {
  if (key == '+') {
    dx++;
  }
  else if (key == '-') {
    dx--;
  }
}

void prepareWindow() {
  rectMode(CORNER);
  fill(8,70,155,10);
  rect(0,0,width,height);
}

void moveEllipse() {
  x += dx;
  if ( x - .5 * wd > width ) {
    x = 0;
  }
  else {
    if ( x + .5 * wd < 0 ) {
      x = width;
    }
  }
}

void draw( )
{
prepareWindow( );
moveEllipse( );
drawEllipse( );
}


