
float angle = 0.0;
void setup()
{
  size(700,400);
  background(0);
  smooth();
}
 
void draw()
{
 
  pushMatrix();
  translate(mouseX,mouseY);
  rotate(angle);
 
  fill(229,35,35,60);
  rect(-50,-50, 100,100);
 
  angle+=0.1;
   
  popMatrix();
 
}

