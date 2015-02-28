

void setup ()
{
  size ( 400, 600) ;
  background ( 255, 255, 255) ;
  smooth () ;
}

void draw ()
{
  fill ( 255, 255, 255, 10) ;
  rect ( 0, 0, width, height) ;

  fill ( 0, 0, 255) ;
  if ( mouseY > height/2) 
  {
    fill ( 255, 0, 0);
  }
  ellipse ( mouseX, mouseY, 50, 50 ) ;
  
}

void mousePressed ()
{
  fill ( random(255), random(255), random(255));
}

void keyPressed ()
{
  background( random(255), random(255), random(255));
}


