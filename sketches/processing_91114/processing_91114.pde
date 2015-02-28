
void setup() {
  size(200,200); }
 
void draw()
{
  smooth();
  pushMatrix();
  translate(60,100);
  rotate(mouseY);
  scale(.50);
  fill(238, 169, 184);
  ellipse(0,0,200,200);
  fill(155, 205, 155);
  rect(0,0,200,200);
     popMatrix();
}
