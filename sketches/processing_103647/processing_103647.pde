
int screenHeight = 1000;
int screenWidth = 1000;

void setup()
{
  size(1000, 1000);
  background(255, 255, 255);
  drawTree(100);
  drawTree(200);
}

void drawTree(float xPosition)
{
  rect(400, 800, 200, 750);
  line(200, 800, 800, 800);
  line(200, 800, 350, 700);
  line(800, 800, 650, 700);
  line(350, 700, 250, 700);
  line(650, 700, 750, 700);
  line(250, 700, 350, 600);
  line(750, 700, 650, 600);
  line(350, 600, 275, 625);
  line(650, 600, 725, 625);
  line(275, 625, 500, 200);
  line(725, 625, 500, 200);
}
