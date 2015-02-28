
void setup()
{
  size(400, 600);
  background(38, 192, 198);
  smooth();

}

void draw()
{
  strokeWeight(7);
  stroke(255, 217, 23,25) ;
  line(200, 300, mouseX, mouseY);
  stroke(96,227,27);
  line(200, 600, 200, 300);
  fill(247, 25, 144);
  noStroke();
  ellipse(200, 300, 60, 60);
  
  
  
}
