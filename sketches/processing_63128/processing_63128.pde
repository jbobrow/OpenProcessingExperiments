
// pmouseX pmouseY

void setup()
{
  
  size(500,500);
  noStroke();
}
void draw()
{
  fill(255,10);
  rect(0,0, width, height);
  stroke(0);
  line(mouseX, mouseY, pmouseX, pmouseY);
}

