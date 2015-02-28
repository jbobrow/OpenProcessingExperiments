
PImage paletteImage;
color backgroundColor;
float angle = 0.0;
float s = 1;
float prevX;
float prevY;

void setup()
{
  size(600, 600);
  paletteImage = requestImage("palette.png");
}

void draw()
{
  if (paletteImage.width > 0)
  {
    image(paletteImage, 0, 0, 200, 200);
  }
  if (mousePressed == true && mouseButton == RIGHT)
  {
    backgroundColor = get(mouseX, mouseY);
  }
  if (mousePressed == true && mouseButton == LEFT)
  {
    fill(red(backgroundColor), green(backgroundColor), blue(backgroundColor));
    pushMatrix();
    translate(mouseX, mouseY);
    rotate(angle);
    scale(s);
    triangle(0,-10,-10,10,10,10);
    popMatrix();
  }
}

void keyPressed()
{
  if (keyCode == UP)
  {
    s += 1.0;
  }
    if (keyCode == DOWN)
  {
    s -= 1.0;
  }
  if (keyCode == LEFT)
  {
    angle -= 1;
  }
    if (keyCode == RIGHT)
  {
    angle += 1;
  }
}



