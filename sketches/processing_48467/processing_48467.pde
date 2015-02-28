
void setup()
{
  size (600, 460) ;
  background ( 255, 0, 0) ;
  textAlign ( CENTER) ;
  frameRate (10) ;
  textSize ( 36) ;
}


void draw()
{
 
  image( loadImage( "christmas.gif"), 0, 0) ;
text ("God Bless You", mouseX, mouseY);
}



