
void setup( )
{
  size(155, 180);
  background(0);
  smooth();
}
void draw()
{
  
  rect(mouseX, mouseY, 150, 30);
  rect(6, 20, 140, 70);

  ellipse(50, 75, 5, 5); 
  ellipse(100, 75, 5, 5);
  fill(255, 0, 0);
  ellipse(25, 25, 5, 5); 
  ellipse(125, 25, 5, 5); 
  noFill();
  stroke(0);
  bezier(50, 75, 25, 25, 125, 25, 100, 75);
  
}
 

  




