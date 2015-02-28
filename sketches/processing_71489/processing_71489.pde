
//Eric Trinh, UserInput, CP1 mods 16-17
//url: http://ericsprogrammingsite.host22.com/UserInput.html

void setup()
{
  size(400, 400);
  smooth();
  background(0);
}
void draw()
{
}
void keyPressed()
{
  if (key == 'c')
  {
    background(0);
  }
}
void mouseDragged()
{
  if (mouseButton == LEFT)
  {  
    stroke(255, 255, 255, 20);
    triangle(mouseX, mouseY, mouseX, mouseY, 200, 200);
    triangle(mouseX, mouseY, mouseX, mouseY, 200, 200);
  }
  if (mouseButton == LEFT && keyPressed == true && key == 'r')
  {  
    stroke(mouseX, mouseY, 255 - mouseY, 20);
    triangle(mouseX, mouseY, mouseX, mouseY, 200, 200);
    triangle(mouseX, mouseY, mouseX, mouseY, 200, 200);
  }
  if (mouseButton == RIGHT)
  {
    stroke(255, 255, 255, 20);
    triangle(mouseX, mouseY, 0, 0, 0, 0);
    triangle(mouseX, mouseY, 400, 400, 400, 400);
    triangle(mouseX, mouseY, 400, 0, 400, 0);
    triangle(mouseX, mouseY, 0, 400, 0, 400);
  }
  if (mouseButton == RIGHT && keyPressed == true && key == 'r')
  {
    stroke(mouseY, mouseX, 255 - mouseY, 20);
    triangle(mouseX, mouseY, 0, 0, 0, 0);
    triangle(mouseX, mouseY, 400, 400, 400, 400);
    triangle(mouseX, mouseY, 400, 0, 400, 0);
    triangle(mouseX, mouseY, 0, 400, 0, 400);
  }
  if (keyPressed == true && key == ' ')
  {
    stroke(mouseY, mouseX, 255 - mouseY, 20);
    triangle(mouseX, mouseY, mouseX, mouseY, 200, 200);
    triangle(mouseX, mouseY, mouseX, mouseY, 200, 200);
    stroke(mouseX, mouseY, 255 - mouseX, 20);
    triangle(mouseX, mouseY, 0, 0, 0, 0);
    triangle(mouseX, mouseY, 400, 400, 400, 400);
    triangle(mouseX, mouseY, 400, 0, 400, 0);
    triangle(mouseX, mouseY, 0, 400, 0, 400);
  }
}
