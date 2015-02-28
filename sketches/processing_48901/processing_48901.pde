

//Julia Toren
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(70);
}
void draw()
{

  strokeWeight(0); 
  stroke(255, 255, 255);
  line(mouseX, mouseY, 0, 0);
  // line(pmouseX,pmouseY, 0, 0);
  fill(random(245, 255), random(245, 255), random(92, 100));

  ellipse(mouseX, mouseY, mouseX/2, mouseY/2);
}


