
void setup ()
{
  size (400, 600 ) ;
  background (4, 5, 255) ;
  smooth () ;
  frameRate (10) ;
}

void draw ()
{
  fill (25, 250, 45, 10) ;
  ellipse(width/2 , height/2, random (width), random (height) );
  fill (0, random (255), random (255)) ;
  ellipse (mouseX, mouseY, 0, 0 ) ;
   fill( random(255), random(255), random(255), random (255) );
  
 }

