
void setup()
{
  size(500,500);
  background(255);
  noFill();
  stroke(50,50,50);
  smooth();
  
}

void draw()
{
  translate(mouseX,mouseY);
  rect(50,150,50,50);
  ellipse(25,25,50,50);
  rect(150,50,50,50);
 
}
