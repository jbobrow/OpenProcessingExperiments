
//Combining transformations
float angle = 0.0;
void setup()
{
  size(500,500);
  background(255);
  smooth();
}
 
void draw()
{
 
  pushMatrix();
  translate(mouseX,mouseY);
  rotate(angle);
 strokeWeight(0.1);
  fill(0,113,167,4);
  ellipse(50,50, 100,100);
  fill(167,73,0,10);
  rect(-25,-25,50,50);
 
  angle+=0.3; 
   
  popMatrix();
 
}

