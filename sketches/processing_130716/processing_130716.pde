
PImage coloringPic;
color brushColor;
float sizeX = 1;
float sizeY = 1;
float rotateX = 0;

void setup()
{
  size(501,501);
  background(#FFFFFF);
  frameRate(30);
  
  coloringPic = requestImage("colorPicker.jpg");
}

void draw()
{
  noStroke();
  image(coloringPic, 0,0,125,125);
  
  if (keyPressed == true)
  {
      if (keyCode == UP)
      {
        sizeX = sizeX + 1;
        sizeY = sizeY + 1;
      }
      if (keyCode == DOWN)
      {
        sizeX = sizeX - 1;
        sizeY = sizeY - 1;
      }
  }
  
  if (key == '1')
  {
    rotateX = rotateX + 2;
  }
  if (key == '2')
  {
    rotateX = rotateX + 0;
  }
  
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      fill(brushColor);
      pushMatrix();
      translate(mouseX, mouseY);
      
      scale(sizeX, sizeY);
      rotate(rotateX);
      
      triangle(-10,-10,10,-10,0,10);
      popMatrix();
    }
    if (mouseButton == RIGHT)
    {
      brushColor = get(mouseX,mouseY);
    }
  }
}


