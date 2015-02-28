
void setup()
{
  size(400,600);
  background(0,0,0);
  frameRate(4);
  smooth();
}

void draw()
{
  fill(random(255),random(255),random(255));
  quad(random(width), random(height), random(width), random (height), random (width), random (height), random (width), random (height)) ;
  stroke(255,255,255);
  mouseDragged() ;
  ellipse(mouseX, mouseY, 50, 50);
}
