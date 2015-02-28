
boolean mouseIsDown = false;

void setup()
{
  size(320, 480);
  background(0);
}


void draw()

{
  noStroke();
  fill(0, 0, 0, 10);
  rect(0, 0, width, height);
  if (mouseIsDown == true)
  {
  stroke(random(255), random(0), random(0));
  strokeWeight(4);
  line(mouseX, mouseY-20, random(pmouseX/3), random(pmouseY/1.5));
  }
  
    filter(POSTERIZE,255); 


  filter(DILATE); 
  
}


void mousePressed()
{
  mouseIsDown = true;
}


void mouseReleased()
{
  mouseIsDown = false;
  stroke(255, 255, 255);
  fill(255, 255, 255);
  ellipse(mouseX, mouseY, random(0, 10), random(0,10));
}
