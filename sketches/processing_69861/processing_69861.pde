
void setup ( )
{
  // setup
  size (500, 500) ;
  background (random (255), random (255), 0 ) ;
  smooth ( );
}

void draw ( )
{
  //right wing
  strokeWeight (3);
  ellipseMode (CENTER);
  fill (50, 150, 255, 230);
  ellipse (300, 200, 100, 100) ;
  ellipse (325, 300, 150, 150) ;

  //left wing
  ellipseMode (CENTER);
  ellipse (200, 200, 100, 100) ;
  ellipse (175, 300, 150, 150) ;

  //spots on right
  strokeWeight (7);
  stroke (255);
  fill (255);
  point (390, 300);
  point (350, 250);
  point (350, 350);

  //spots on left
  point (110, 300) ;
  point (150, 250);
  point (150, 350);

  // draw anntennae
  stroke (0);
  strokeWeight (10);
  line (250, 150, 200, 100) ;
  line (250, 150, 300, 100) ;

  // end of anntennae
  ellipseMode (CENTER);
  ellipse (200, 100, 10, 10) ;
  ellipse (300, 100, 10, 10) ;

  // draw body
  strokeCap (ROUND) ;
  strokeWeight (15) ;
  line (250, 350, 250, 150) ;
}
