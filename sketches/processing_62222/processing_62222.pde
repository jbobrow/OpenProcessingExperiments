
void setup()
{
  size(600, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);
}

void draw()
{


  fill(random(255),random(255),random(255));
  ellipse(height/2, height/2, mouseX, mouseY);
} 


