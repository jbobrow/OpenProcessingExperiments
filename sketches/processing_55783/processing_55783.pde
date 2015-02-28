
void setup()
{
  size(200, 200);
  background(255,220,223);
  smooth();
  stroke(0);
  curve(40, 40, 80, 60, 100, 100, 60, 120);
  
  noStroke();
  fill(255, 0, 0);
  ellipse(40, 40, 3, 3);
  fill(0, 0, 255, 192);
  ellipse(100, 100, 3, 3);
  ellipse(80, 60, 3, 3);
  fill(255, 0, 0);
  ellipse(60, 120, 3, 3);  
}
