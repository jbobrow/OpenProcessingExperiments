
void setup()
{
  size( 600,600 );
  background( 0);
 
  stroke(198,173,237,70 );
}
  
void draw()
{
  if (mousePressed) {
    translate(mouseX,mouseY);
    rotate(frameCount/10.0);
    triangle(0,0, 80,0,0, 70);
    fill(228,192,239,40 );
  }
}
 
void keyReleased()
{
  if (key=='c' || key=='C') {
    background(0);
  }
}

