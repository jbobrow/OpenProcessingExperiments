
void setup ()
{
  size (400, 600) ;
  background (255,255,255);
  smooth () ;
  textAlign (CENTER);
  textSize (34) ;
  fill ( 12, 137, 11) ;
  triangle ( width/2, 40, 100, height/2, 300, height/2) ;
  fill ( 129, 85,49) ;
  rect ( 175, height/2, 50,50) ;
}
void draw ()
{
  fill (random (59), random (203), random (58)) ;
  text ("Merry Christmas!", random(width), random (height));
}

