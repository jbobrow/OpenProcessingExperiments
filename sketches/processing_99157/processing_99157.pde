
void setup()
{
  size(400, 600);
  background(0,0,0);
  smooth();
  frameRate(60);
}
void draw()
{
  fill(255,171,3);
  triangle(mouseX,mouseY,30,30,100,100);
  fill(255,255,0);
  ellipse(99,43,width,height); 

  
}
