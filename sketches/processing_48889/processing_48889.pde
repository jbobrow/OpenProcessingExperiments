
// Nate The Great

void setup()
{
  size(400,600);
  background(0,0,0);
  smooth();
  frameRate(300);
}
void draw()
{
  smooth();
  strokeWeight(4); 
  fill(180,180,180); 
  ellipse( mouseX,mouseY,8,8);
  text("Merry Christmas!",160,300);
  fill(255,255,255);
}

