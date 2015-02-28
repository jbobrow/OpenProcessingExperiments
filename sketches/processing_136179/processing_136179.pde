

PImage photo;

void setup ( )
{
  size( 600, 600, P3D );
  imageMode (CENTER);
  photo = loadImage("test.png");
}

void draw ( ) 
{
  background (0);
  translate (width/2, height/2, -200);
  rotateX (frameCount);
  image (photo, 0, 0, 300, 300);
  
}


