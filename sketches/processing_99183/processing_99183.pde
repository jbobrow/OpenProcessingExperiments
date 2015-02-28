
void setup()

{
  size(400, 600);
  background(170, 243, 255, 30);
  smooth();
  frameRate(10);

}

void draw()
{
  noStroke();
  fill(170, 243, 255, 30);
  rect(mouseX, mouseY, width, height);
  
  strokeWeight(4);
  fill(random(255), random(255), random(255));
  ellipse(mouseX, mouseY, 50, 50);

}
