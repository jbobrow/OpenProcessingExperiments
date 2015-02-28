
void setup()
{
  size(600, 600); 
  background(200, 30, 53);
}
void draw()
{ 
 noStroke();
  ellipse(300, 300, mouseX, mouseY);
}
void mousePressed()
{
  fill(random(255),random(255),random(255));
  
}


