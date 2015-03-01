
void setup() 
{
  size(1000, 1000);
  background(71, 102, 0);
  frameRate(20);
}

void draw() 
{
  float size = random(10,100);
  switch (frameCount %4)
  {
    case 0 : rect(mouseX, mouseY, 2.5*size, size);
    fill(178,204,255);
    break;
    case 1 : rect(mouseX, mouseY, 2.5*size, size);
    fill(237,169,0);
    break;
    case 2 :rect(mouseX, mouseY, 2.5*size, size);
    fill(166,166,166);
    break;
    case 3: ellipse(mouseX, mouseY, size, size);
    fill(124,206,118);
    break;
  }
}
