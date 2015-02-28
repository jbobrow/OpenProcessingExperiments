
void setup()
{
  size(400,600);
  background(255,255,255);
  smooth();
}

void draw()
{
//  fill(0,0,255);
  rect(mouseX, mouseY,10,10);
}
void mousePressed()
{
  save("snapshot");
fill(random(255),random(255),random(255));
background(0,0,255);
}

