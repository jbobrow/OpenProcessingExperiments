
void setup() 
{
  size(700, 1000);
  background(#000000);
  colorMode(HSB,360,100,100);
  frameRate(50);
} 

void draw() 
{
  int colorHue = frameCount % 360;
  noStroke();
  fill(colorHue,100,100);
  rect(mouseX, mouseY, 100, 100);
}

