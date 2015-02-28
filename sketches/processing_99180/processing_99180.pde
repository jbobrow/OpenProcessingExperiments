
void setup()
{
  size(600, 400) ;
  background(mouseX, mouseY, 255) ;
  smooth() ;
  
}

void draw()
{
  fill(300);
 
  rect( 0, 0, width, height ) ;
  
  float x ;
  
  stroke (600, 500, 300) ;

  strokeWeight (3) ;
  


  fill (random(255), random(255), random(255));
  if (key == 'b')
 { 
    fill (255, 0, 255) ;
  }
  ellipse ( 100, height-frameCount%height, 80, 80) ;
}
