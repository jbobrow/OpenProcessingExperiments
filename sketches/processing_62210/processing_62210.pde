

void setup()
{ 
  size(600, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);
} 

void draw() 
{
  smooth();
  strokeWeight(.5);
  ellipse(width/2, height/2, mouseX, mouseY);
  fill(255, 255, 255);
  stroke(255,0,255, 127);
}

void keyPressed()
{
  if (key=='b')
  {
    smooth();
    strokeWeight(1);
    ellipse(width/2, height/2, mouseX, mouseY);
    fill(255, 255, 255);
    stroke(0, 0, 255, 127);
  }
  if (key=='n')
  {
    smooth();
    strokeWeight(3);
    ellipse(width/2, height/2, mouseX, mouseY);
    fill(255, 255, 255);
    stroke(0, 255, 0, 127);
  }
}

