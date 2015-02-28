
float x = 50;
float y = 266;
void setup()
{
  size(500,600);
}
void draw()
{
  background(12);
  fill(0,0,255);
  ellipse(300-x,300,80,120);
  fill(0);
  rect(267-x,294,65,20);
  rect(289-x,266,20,75);
  noStroke(); 
  fill(255,0,0);
  rect(217,y + 28,65,20);
  rect(239,y ,20,75);
  
  x = x + int(random(-5,5));
  y = y + int(random(-2,2)); 
  if(y > 600)
  {
    y = y - int(random(5,7));
  }
}
