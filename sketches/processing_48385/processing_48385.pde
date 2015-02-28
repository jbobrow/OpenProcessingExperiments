
//*sketch by Emma Tilma/*

void setup()
{
  size(400, 600);
  background(0, 0, 0);
  smooth();
}
void draw()
{
  textSize(36);
  text("Star of Bethlehem", 80, 400);
  strokeWeight(2);
  stroke(255, 255, 255, 25) ;
  line(100, 100, mouseX, mouseY);
}


