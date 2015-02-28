
void setup()
{
  size( 600, 800);
  background( 255, 255, 255);
  smooth();
  textAlign (CENTER); 
 frameRate (5);
}
void draw()
{
  fill (255, 255, 255, 75);
  rect (0, 0, width, height );
  
  textSize (36);
  fill (random (255), random (255) , random (255) );
  text ( "Merry Christmas!", random (width), random (height));
  
  
}
void keyPressed ()
{
  stop();
  
}

