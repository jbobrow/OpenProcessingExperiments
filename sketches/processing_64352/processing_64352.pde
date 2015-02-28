
void setup()
{
  size(400,200);
  background(15);
  noStroke();
  frameRate(50);
}

void draw()
{
  rectMode(CENTER);
  fill(255);
  rect(mouseX,mouseY,50,50);
  rectMode(CORNER);
  fill(0,0,0,10);
  rect(0,0,400,200);
}


