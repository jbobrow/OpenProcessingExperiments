
void setup()
{
  size(400, 600);
  background(0, 0, 0);
  smooth();
}
void draw()
{
  fill(255,255,255, 15);
  rect(0,0, width,height);
  fill(0, 0, 255);
  //stroke(255,255,255);
  //strokeWeight(7);
  noStroke();
  ellipse(mouseX, mouseY,mouseX, 100);
}
void mouseDragged()
{
  fill(random(255), random(255), random(255));
}
void keyPressed()
{
  
}


