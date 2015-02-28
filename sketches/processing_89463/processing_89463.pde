
//Homework 6
//Copyright Lila Fagen
//Lila.Fagen@gmail.com (ldf)


float bx, by, bsize, bvel, bcol;
float rx, ry, rsize, rvel, rcol;


void setup ( ) 
{
  size (400, 400);
  smooth ( );
  bx = random(0-width);
  by = random(0-height);
  bsize = .1 * width;
  bvel = 3;
  bcol = color(0, 0, 255); 
  
  
  rx= width/2;
  ry= 0;
  rsize = .2* width;
  rvel= 4;
  rcol = color(255, 0, 0);
  
  
}


void draw ( ) 
{
// background (0);
 moveB ( );
 b (bcol) ;
 moveR ( );
 r (rcol);
}

void moveB ( )
{
 bx = bx + bvel;
  if (bx > width + bsize)
 {
  bx = -bsize; 
 }
 by = by + bvel;
  if (by > height + bsize)
 {
  by = -bsize; 
 }
}

void b (float col )
{
stroke (0, 0, 255);
noFill( );
ellipse (bx, by, bsize, bsize);

}
void moveR ( )
{
// rx = rx + rvel;
//  if (rx > width - rsize || rx < rsize/2)
// {
//  rx = -rsize; 
// }
 ry = ry + rvel;
  if (ry > height || ry<0)
 {
  rvel = -rvel; 
 }
}
void r (float col )
{
  fill (255, 0, 0, 30);
  stroke (0 );
  ellipse (rx, ry, rsize, rsize);
}



