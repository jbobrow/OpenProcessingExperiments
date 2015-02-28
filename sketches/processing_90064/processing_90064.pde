
void setup ()
{
  size(500,500);
  background(124,12,118);
  smooth();
}
void draw()
{
  triangle(mouseX,mouseY,mouseX+10,mouseY-3,mouseX+5,mouseY+45);
  noStroke();
  stroke(24,234,229);
  strokeWeight(13);
  line(mouseX,mouseY,mouseX,mouseY);
}
