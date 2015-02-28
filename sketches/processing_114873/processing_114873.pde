
float prevX;
float prevY;
float angle = 0;
float s = 1;
PImage paletteImage;
color backgroundColor;
void setup()
{
  size(600,600);
  paletteImage = requestImage("colors.png");
  background (47);
}

void draw()
{
  fill(
      red(backgroundColor),
      green(backgroundColor),
      blue(backgroundColor));
      
  if (paletteImage.width > 0)
  {
    image(paletteImage, 0, 0, 200, 200);
  }
  
  if (mousePressed == true && mouseButton == RIGHT)
  {
    backgroundColor = get(mouseX, mouseY);
  }
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
      {
        strokeWeight(1);
        pushMatrix();
        translate(mouseX, mouseY);
        scale(s);
        rotate(angle);
        triangle(-25, 25, 0, -25, 25, 25);
        popMatrix();
      }
  }
  prevX = mouseX;
  prevY = mouseY;
}



void keyReleased()
{
  if (key == 'a')
  {
    s -=.5;
  }
  if (key == 'd')
  {
    s +=.5;
  }
  if (key == 'q')
  {
    angle -= 1;
  }
  if (key == 'e')
  {
    angle += 1;
  }
     

}
     
     

     




