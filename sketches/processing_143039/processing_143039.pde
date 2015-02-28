
void setup()
{
  size(1000,1000);
  
}
void draw()
{
  background(0);
  fill(0,0,255);
  triangle(0,600,500,0,1000,600);
  fill(255);
  noStroke();
 
  ellipse(mouseX,mouseY,200,200);
}

