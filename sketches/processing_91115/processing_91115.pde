
void setup() {
  size(200,200); }
  
void draw()
{
  background (0);
  smooth();
  pushMatrix();
  translate(90, 180);
  rotate(mouseX);
  scale(.50);
  noStroke ();
  fill(255);
  ellipse(200, 200, 100, 100);
  ellipse (200, 200, 200, 200);
  fill(227, 230, 232);
  rect(200, 200, 100, 100);
     popMatrix();
}
