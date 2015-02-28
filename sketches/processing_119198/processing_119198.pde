
void setup()
{
  size(500,500);
  background(245);
}

void draw()
{
  background(245);
  fill(255);
  stroke(69,201,120);
  
  ellipse(125,125,50,50);
  ellipse(125,225,50,50);
  ellipse(225,125,50,50);
  ellipse(425,275,50,50);
  ellipse(425,350,50,50);
  ellipse(425,425,50,50);
 
  
  pushMatrix();
  translate(225,225);
  ellipse(mouseX/2.5,0,50,50);
  popMatrix();
  resetMatrix();
  
}
