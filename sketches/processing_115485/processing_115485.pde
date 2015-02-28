
/* @ pjs preload = "colorWindow.png"; */
PImage colorWindow;
int currentColor = 255;
float brushSize = 7;
float rotateInput = 0;

void setup()
{
  size(500,500);
  colorWindow = loadImage("colorWindow.png");
  background(255);
  
}

void draw()
{
  image(colorWindow,0,0);
  if (mousePressed == true && mouseButton == LEFT)
  {
    strokeWeight(2);
    fill(red(currentColor),green(currentColor),blue(currentColor));
    pushMatrix();
    translate(mouseX,mouseY);
    rotate(rotateInput);
    triangle(0,0,brushSize,0,0,brushSize);
    popMatrix();
  }
  if (mousePressed == true && mouseButton == RIGHT)
  {
    currentColor = get(mouseX,mouseY);

  }
}

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      brushSize += 1;
    }
    if (keyCode == DOWN && brushSize > 1)
    {
      brushSize -= 1;
    }
    if (keyCode == LEFT)
    {
      rotateInput += PI/10;
    }
    if (keyCode == RIGHT)
    {
      rotateInput -= PI/10;
    }
  } 
}


