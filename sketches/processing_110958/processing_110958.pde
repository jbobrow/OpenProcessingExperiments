
void setup()
{
  size (320, 480);
  background(229, 255, 253); 
 

}

void draw()
{
  float lineColor = abs(mouseX * .5 - pmouseX);
  stroke(247-lineColor,47-lineColor,237-lineColor);
  fill(255, 200, 85);
  ellipse(160, 240, pmouseY, height-mouseX);
}
void mousePressed()
{
  fill (229, 255, 253);
ellipse(160, 240, pmouseY, height-mouseX);
}
