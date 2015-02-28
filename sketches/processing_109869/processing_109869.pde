
float squareSize = 1.0;

void setup()
{
  size(600, 600);
  frameRate(10);
  background(0);
  
  noStroke();
  fill(255, 255, 255);
  for(int c = 0; c < 45; c++)
  {
    int x = (int)random(0, 599);
    int y = (int)random(0, 599);
    rect(x, y, 1, 1);
  }
  
}

void draw()
{
  colorMode(HSB, 600);
    fill(mouseX, mouseY, 600);
    rect(mouseX, mouseY, squareSize, squareSize);
    squareSize+=0.2;
}

void mouseClicked()
{
  squareSize = 1.0;
  setup();
}


