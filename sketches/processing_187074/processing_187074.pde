
void setup()
{
  size( 600,600 );
  background(0,0,155);
  stroke(158,173,137,70 );
}
   
void draw()
{
  if (mousePressed) {
    translate(mouseX,mouseY);
    rotate(frameCount/2.0);
    quad(38, 31, 86, 20, 69, 63, 30, 76);
    fill(228,192,239,40);
  }
}
  
void keyReleased()
{
  if (key=='c' || key=='C') {
    background(255);
  }
}



