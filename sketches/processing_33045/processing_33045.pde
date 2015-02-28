
PImage Nyan;
PImage Rainbow;

void setup() 
{
  size(650, 300);
  frameRate(50);
  background(0,68,120);
  Rainbow = loadImage("Rainbow.png");
  Nyan = loadImage("Nyan.png");
}

void draw() 
{
  image(Rainbow, mouseX-5, mouseY+7, 22, 48.644);
  image(Nyan, mouseX, mouseY);
}

