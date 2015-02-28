
void setup()
{
  size (640, 640);
}
void draw()
{
  background (0);
  noFill();
  stroke (255);
  ellipse (320, 320, 300, 160);
  ellipse (320, 320, mouseX - 150, 160);
  line (0, 240, mouseX, 240); 
  line (0, 400, mouseX, 400);
  line (640, 320, 640-mouseX, 320);
}


