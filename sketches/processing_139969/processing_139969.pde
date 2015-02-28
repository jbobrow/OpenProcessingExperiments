
void setup( )
{
  size(155, 180); //size of window
  background(0); //color of background set to black
  smooth();
}
void draw()
{
  
  rect(mouseX, mouseY, 150, 30); //allows user to move rectangle to erase monster
  rect(6, 20, 140, 70); //size of main body of monster 

  ellipse(50, 75, 5, 5); 
  ellipse(100, 75, 5, 5);
  fill(255, 0, 0);
  ellipse(25, 25, 5, 5); 
  ellipse(125, 25, 5, 5); 
  noFill();
  stroke(0);
  bezier(50, 75, 25, 25, 125, 25, 100, 75);
  
}
 

  




