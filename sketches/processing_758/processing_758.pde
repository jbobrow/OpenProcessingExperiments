
PImage img;
float imgX, imgY;
float scaleValue;

void setup()
{
  size( 300, 300 );
  scaleValue = 1;
  img = loadImage( "austin.jpg" );
}

void draw()
{ 
  if (keyPressed)
  {
    if (key == CODED)
    {
      if (keyCode == UP)
      {
        scaleValue = constrain(scaleValue+.01,.1,3);
      }
      if (keyCode == DOWN)
      {
        scaleValue = constrain(scaleValue-.01,.1,3);
      }
    }
  }
  background( 0 );
  scale( scaleValue );
  translate( imgX, imgY );
  image( img, 0, 0 );
  float angle = atan2( mouseY - height/2, mouseX - width/2 ) - PI;
  float speed = 0.05 * dist( mouseX, mouseY, width/2, height/2 );
  imgX += speed * cos( angle );
  imgY += speed * sin( angle ); 
}




