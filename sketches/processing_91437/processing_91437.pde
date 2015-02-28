
//suzanne1, suzanne choi, hw8
//copy rights 2013 suzanne choi. all rights reserved.


// press space bar to see new pattern
// press a to go back to first pattern

int phase, y, dx,dy,dia;
 
void setup ( )
{
  size (400, 400);
  background (209,227,197 );
  phase = 0;
  dia = 20;
  dx = 30;
  dy = 30;
  y = 15;
}
 
void draw ( )
{
  if ( phase == 0 ) 
  {for1 ( );} 
  else if ( phase == 1 ) 
  {while1 ( );
 y=(y+dy) % height;}
}
 
void while1 ( )
{
  int x = 0;
  while (x < width) {
    stroke(255);
    fill (200, random (150),5);
    ellipse (x, y, dia, dia);
x=x+dx;
  }
}
 
void for1 ( )
{ 
  for (int a = 0; a < width; a = a+10) {
  for (int b = 0; b < height; b = b+10) {
  strokeWeight(2);
  stroke(157,170,148);
    point(a, b);
  }
}
}
  
 
void keyPressed ( )
{
  if (key == ' ') {
    phase = 1;
    background (255);}
  if (key == 'a') {
    phase = 0;
    background (209,227,197 );
    
  }
}



