
void setup()
{
  size(700, 500);
  background(0, 0, 0);
  smooth();
}
 
void draw()
{ 
  fill(0,0,0, 5);
  noStroke();
  rect(0,0,width, height);
  stroke(random(255), random(255), random(255));
  line(350, 250, mouseX, mouseY);
  line(350, 250, mouseX, mouseY);
 
}
