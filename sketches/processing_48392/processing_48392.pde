
//Jaylynne Yancy

void setup ()
{
  size( 400, 600 );
  background (0 , 0, 3 );
  smooth() ;
  frameRate(15) ;
}

void draw()
{
  strokeWeight (1754) ;
  stroke(22, 55, 65, 42);
  fill( 0,0,0,50);
  //rect (0, 0, width, height ) ;
  fill ( random (147), random (34) , random (34) ) ; 
  ellipse (mouseX , mouseY, 50, 50) ;
 
}
 void keyPressed() 
{
  background (5, 5, 0, 2) ;
}

