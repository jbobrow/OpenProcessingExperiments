
void setup()
{
  size(600,600);
  frameRate(20);
}

void draw()
{
  if (mousePressed)
  {
  float r = random(50, 200);
  ellipse(mouseX, mouseY, r, r);
  ellipse(mouseX+random(0,500), mouseY-random(0,500), r, r);
  ellipse(mouseX-random(0,500), mouseY+random(0,500), r, r);
  ellipse(mouseX+random(0,500), mouseY+random(0,500), r, r);
  ellipse(mouseX-random(0,500), mouseY-random(0,500), r, r);
  fill(255,255,255,random(100));
  noStroke();
  }
  else
  {
    background(0);
  }
}

