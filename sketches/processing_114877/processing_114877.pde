
PImage paletteImage;
color backgroundColor;
float angle = 0;
float s = 1;
int currentBrush = 0;

float prevX;
float prevY;

void setup()
{
  size(600,600);
  paletteImage = requestImage("palette.png");
  background(0);
  
}

void draw ()
{
  

  
  if(paletteImage.width > 0)
  {
    image(paletteImage, 0, 0, 300, 100);
  }
  
  if (mousePressed == true && mouseButton == RIGHT)
    {
      backgroundColor = get(mouseX, mouseY);
    }
   
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      stroke(#FFFFFF);
      strokeWeight(5);
      fill(  
        red(backgroundColor),
        green(backgroundColor),
        blue(backgroundColor));
      pushMatrix();
      translate(mouseX, mouseY);
      rotate(angle);
      scale(s);
      triangle(-25, 25, 0, -25, 25, 25);
      popMatrix();
    }
  }
  
  if (currentBrush == 2)
{
 
}
 
}

void keyPressed()
{
  if (keyCode == UP)
  {
    s += .1;
  }
  if (keyCode == RIGHT)
  {
    angle += .1;
  }
}


