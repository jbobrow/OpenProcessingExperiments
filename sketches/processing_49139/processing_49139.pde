

void setup ()
{
  size ( 400, 600) ;
  background (255, 255, 255) ;
  smooth () ;
  
}

void draw ()
{
  // fill (240, 0, 0) ;
  ellipse (mouseX, mouseY, 50, 50) ;
  
}

void mousePressed ()
{
  save ("snapshot.png" ) ;
  fill (random (255), random (255), random (255));
}

