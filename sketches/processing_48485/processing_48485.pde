
void setup()
{
  size( 400, 600 );
  background(random (255), random(255), random(255) );
  smooth();
  textAlign( CENTER );
  frameRate(16);
}
void draw()
{
  background(255, 255, 255);
  textSize( 36 );
  fill( random(255), random (225), random (225) );
  if (mouseY>0);
  {
    textSize(mouseY/2);
  }


  image( loadImage("ozzieSmith.jpg"), mouseX-150, mouseY-150, mouseX, mouseY);
}


