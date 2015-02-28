
void setup ()
{
  size ( 400,600);
  background (255,255,255) ;
  smooth ();
  frameRate (30);
  strokeWeight (5);
  
}





void draw()
{
  fill (random (255) ,random(255),random(255) )  ;
  ellipse (mouseX, mouseY  , mouseX/2,mouseY);
  
  
  
}

