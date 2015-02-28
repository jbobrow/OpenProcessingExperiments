
float s = 1;
float r = 0;
PImage veerImage;
color currentColor;

void setup()
{
  size(500, 500);
  veerImage = requestImage("veer.jpg");
}

void draw()
{
  if(veerImage.width > 0)
  {
    image(veerImage, 0, 0, 100, 100);
  }
  
  if(mousePressed == true)
  {
    if(mouseButton == RIGHT)
    {
    currentColor = get(mouseX, mouseY);
    }
      if(mouseButton == LEFT)
    {
      pushMatrix();
      translate(mouseX, mouseY);
      rotate(radians(r));
      scale(s);
      fill(red(currentColor), green(currentColor), blue(currentColor));
      triangle(0, -30, -30, 30, 30, 30);
      popMatrix();
    }
  }

}

void keyReleased()
{
  // scale
  if(key == 's')
  {
    s = s + 1;
  }
  
  if(key == 'a')
  {
    s = s - 1;
  }
  
  if(s <= 0)
  {
    s = 1;
  }
  
  // rotate
  if(key == 'r')
  {
    r = r + 10;
  }
  
  if(key == 'e')
  {
    r = r - 10;
  }
  
  if(r >= 360)
  {
    r = 0;
  }
}


