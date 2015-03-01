
void setup()
{
  size(500,500);
  background(0);
  fill(255);
  stroke(255);
  smooth();
}

void draw()
{
 
  pushMatrix();
  translate(width/2,height/2);
  fill(255);
  rotate(radians(second())*50);
  triangle(0, 0, 58, 20, 86, 75);
  
  popMatrix();

}
