
void setup()
{
  size( 480,480 );
  background( 0 );

  stroke( 255,50 );
} 
 
void draw()
{ 
  if (mousePressed) {
    translate(mouseX,mouseY);
    rotate(frameCount/10.0);
    line(0,0, 80,0);
  }
}

void keyReleased() 
{
  if (key=='c' || key=='C') {
    background(0);
  }
}  
