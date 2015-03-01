
void setup()
{
  size( 600,600);
  colorMode (HSB, 360,100,100);
  background( 360);
  
}

void draw()
{
  if (mousePressed) {
  translate(mouseX,mouseY);
  rotate(random(2*PI));
  noStroke();
  fill(random(21,360), random(0,50), random (90,100), 100);
  triangle(20,90, 50,30, 100,90);
 } 
}
void keyReleased()
{
if (key=='s' || key=='S') {
background(360);
}
}

  


