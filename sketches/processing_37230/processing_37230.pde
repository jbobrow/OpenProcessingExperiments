
void setup() 
{
  background(255,255,255);
  size(400,400);
  smooth();
}
 
void draw()
{
  strokeWeight(random(10));
  stroke(random(250),random(251),random(252));
  fill(random(210),random(254),random(255));
  rect(mouseX,mouseY,20,50);
  line(mouseX,mouseY,0,50);
  ellipse(mouseX,mouseY,20,20);
  
}



