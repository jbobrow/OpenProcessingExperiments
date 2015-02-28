
void setup()
{ 
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);

} 

void draw() 
{
  noStroke();
  fill(255, 255, 255, 30); 
  rect( 0, 0, width, height );

  fill(255, 0, 0);
  ellipse( mouseX, mouseY, 30, 30 );

}
