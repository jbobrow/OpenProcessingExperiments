
float prevX;
float prevY;
float angle = 0;
float s = 1;
PImage paletteImage;
color backgroundColor;

void setup()
{
  
  size(700, 700);
  paletteImage = requestImage("palette.jpg");
  background (255, 255, 255);
  
}
 
void draw()
{
  fill(red(backgroundColor), green(backgroundColor), blue(backgroundColor));
       
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
      noStroke();
      pushMatrix();
      translate(mouseX, mouseY);
      scale(s);
      rotate(angle);
      triangle(-30, 30, 0, -30, 30, 30);
      popMatrix();
    }
  }
  
  prevX = mouseX;
  prevY = mouseY;
  
}


void keyReleased()
{
  
  if (keyCode == LEFT && key == CODED)
  {
    s -=.5;
  }
  if (keyCode == RIGHT && key == CODED)
  {
    s +=.5;
  }
  if (keyCode == DOWN && key == CODED)
  {
    angle -= .5;
  }
  if (keyCode == UP && key == CODED)
  {
    angle += .5;
  }
  
}


