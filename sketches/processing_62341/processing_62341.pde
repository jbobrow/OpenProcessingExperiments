
void setup()
{
  size(400, 600);
  background(0,0,0);
  smooth();
}
 
void draw()
{
  fill( 0, 0, 255 );
  rect(0, 0, width, height/2);
 
 fill( 0, 0, 0 ) ;
 rect(0,height/2,width,height/2);
 
 
  textAlign(CENTER);
  textSize(36);
  fill(0, 0, 255);
  
  if ( mouseY < height/2 )
  {
    fill(255, 255, 255);
  }
  
  text( "GO MAGIC!", mouseX, mouseY ) ;
  ellipse( mouseX, mouseY+30, 30, 30 );
  image ( loadImage ( "Magic.gif" ), width/2-100, height/2-70);
}


