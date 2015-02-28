
float counter = 0;
 
void setup()
{
  size(400, 400);
}
 
void draw()
{
  background(150);
 
  translate(width/2, 300);
 
  pushMatrix();
  translate(0, sin(counter)*100);
  ellipse(0, 0, 320, 160);
  noStroke();
  fill(85,47,9);
  popMatrix();
 
  counter += 0.001;
}

 

