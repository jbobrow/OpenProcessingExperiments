
void setup()
{
  size(500, 500);
  background(0, random(100), random(150)); 
  smooth();
  frameRate(15);
  stroke(0, random(200), random(200));
}
void draw() 
{
  line(pmouseX, pmouseY, mouseX, mouseY);
  strokeWeight(4);
  //background(255,255,255);
  ellipse(mouseX, mouseY, 100, 100);
   fill(0, random(120), random(100), 75);
  if (mouseY>height/2)
  {
    fill(0, 0, random(222), 100);
  }
  if (mouseX>width/2)
  {
    fill(0, random(100), random(255), 90);
  }
  ellipse(mouseX, mouseY, 75, 75);
}
void mousePressed()
{
  fill(0, random(250), random(200), 75);
}


