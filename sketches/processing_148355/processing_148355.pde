
void setup()
{
  size(600,400);
  background(255,255,255);
}


void draw()
{

noStroke();
  ellipse(mouseX,mouseY, 50,50);
  fill(random(200),random(200),random(255));
}


void mousePressed()
{
  fill(random(255),random(255),random(255));
  triangle(mouseX, mouseY, mouseY, mouseX, 50,50);
}

