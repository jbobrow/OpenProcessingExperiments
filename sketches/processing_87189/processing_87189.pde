
//Cristina Shin cshin1 Copyright Cristina Shin 1/28/2013
//Keyboard commands are left, right, up, and down, reach the dark gray rectangle while trying to match the gray path perfectly.

float x, y, wd, ht;

void setup( )
{
  
  x = 100;
  y = 100;
  wd = 100;
  ht = 100;

  size( 400, 400 );
  background( 157, 194, 172 );
    
    noStroke( );
    fill(150);
    rect( 20, 20, wd, ht/4);
    rect( 275, 40, wd, ht);
    rect( 20, 140, wd, ht);
    rect( 275, 250, wd, ht);
    rect( 20, 235, 3.55*wd, ht/5);
    rect( 20, 35, 3.55*wd, ht/5);
    rect( 20, 135, 3.55*wd, ht/5);
    rect( 20, 235, 3.55*wd, ht/5);
  
}


void draw( )
{  
  
  fill(100);
  rect( 275, 349, wd, ht/5);
    
    
  noStroke( );
  fill( 255 );
  rect( x/5, y/5, wd, ht/5);
  
}
//Keyboard commands are left, right, up, and down, reach the dark gray rectangle while trying to match the gray path perfectly.
void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      x = x - 20;
    } else if (keyCode == RIGHT) {
      x = x + 20;
    } else if (keyCode == DOWN ) {
      y = y + 20;
    } else if (keyCode == UP ) {
      y = y - 20;
      
  }}}
  
  

