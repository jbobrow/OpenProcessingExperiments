
PImage triangleImage;
PImage customBrush;
PImage palette;
float someScale = 0.1;
float someRotation = 0.1;
color brushColor;

void setup()
{
  size(500,500);
  background(255);
  triangleImage = requestImage("triangle.png");
  customBrush = new PImage(500,500);
  palette = requestImage("palette.jpg");
}
void draw()
{
  noStroke();
  fill(0);

  if (palette.width > 0)
  {
    image(palette, 400, 400, 100, 100);
  }
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      pushMatrix();
      translate(mouseX,mouseY);
      rotate(someRotation);
      scale(someScale);
      fill(0);
      imageMode(CENTER);
      image(triangleImage, 0, 0, 32, 32);
      popMatrix();
      imageMode(CORNER);
    }
    fill(brushColor);
    if (mouseButton == RIGHT)
    {
      fill(brushColor);
      ellipse(mouseX, mouseY, 20, 20);
    } 
    if (mouseButton == CENTER)
    {
      brushColor = get(mouseX, mouseY);
    }
    if (keyPressed)
    {
      if (key == '9')
      {
        tint (0, 255, 255);
      }
      if (key == '2')
      {
        someScale = (someScale + .1);
      }
      if (key == '3')
      {
        someRotation = (someRotation + .1);
      }
    }
    
  }   
      
}


