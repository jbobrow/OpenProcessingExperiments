
void setup()
{
  size(500, 500);
  background(0);
}

void draw()
{
  background(0);
  fill(255);
  noStroke();
    
  ellipse(240, 100, 40, 40);
  ellipse(400, 100, 40, 40);
  
  ellipse(240, 250, 40, 40);
  ellipse(400, 250, 40, 40);
  
  ellipse(240, 400, 40, 40);  
  ellipse(400, 400, 40, 40);
  
  
  fill(120, 20, 5);
  noStroke();
  
  ellipse(mouseX/2, 100, 40, 40);
  ellipse(mouseX/2, 250, 40, 40);
  ellipse(mouseX/2, 400, 40, 40);



}
