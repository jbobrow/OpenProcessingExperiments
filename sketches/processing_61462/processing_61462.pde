
void setup( )
{
  size(250, 250);
  background(255,90,10);
  smooth();
 
  ellipse(50, 75, 5, 5);
  ellipse(90, 75, 5, 5);
  fill(255, 0, 0);
  ellipse(25, 25, 5, 5); 
  ellipse(100, 25, 5, 5);
  noFill();
  stroke(0);
  bezier(20, 30, 25, 25, 125, 25, 100, 75);
}
