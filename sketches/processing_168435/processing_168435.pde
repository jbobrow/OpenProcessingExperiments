
void setup()
{
size(400,400);
background(0,255);
}

void draw()
{
  //background(0,255);
  //println(mouseX);
  translate(mouseX, mouseY);
  noFill();
  stroke(255);
  triangle(100, 100, 300, 100, 200, 300);
}

