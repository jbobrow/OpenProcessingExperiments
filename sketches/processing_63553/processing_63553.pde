
void setup()
{
   size(400,600);
   background (255, 255,255 );
   smooth();
  frameRate(10);   
}
                
void draw()
{
  //fill( 25, 250, 45, 10, 0);
  rect( 123, 31, random (width),random (height) );
  //fill( 234, 123, 213, 0);
  ellipse( mouseX, mouseY, 0, 0);
}


void mousePressed()
{
  fill(random(255),random(255),random(255),random(255) );
   
   
}


