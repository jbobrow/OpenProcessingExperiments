
void setup()
{
  size(500,500);
  background(255);
  noFill();
  stroke(0,0,0);
  
  smooth();
}

void draw()
{
  translate(mouseX,mouseY);
  
  rectMode(CENTER);
  rect(0,0,100,100);
  rect(100,100,100,100);
}
