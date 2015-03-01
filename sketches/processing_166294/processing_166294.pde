
void setup()
{
  size(600,600);
  background(0);
}

void draw()
{
  stroke(243,247,35);
  strokeWeight(20);
  fill(0);
  beginShape();
  vertex(150,500);
  bezierVertex(500,0,0,0,400,500);
  endShape();
}
