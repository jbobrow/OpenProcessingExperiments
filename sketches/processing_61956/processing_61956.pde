
void setup()
{
  size(1000, 800);
  background(21, 160, 232);
  smooth();
  frameRate(15);
} 
void draw()
{
  image( loadImage("plane2.png"), 0, 0, width, height);
  image( loadImage("skydiver2.png") , mouseX, mouseY, mouseX, mouseY );
  fill(255, 255, 0);
  
 
}




