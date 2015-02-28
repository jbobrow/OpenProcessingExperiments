
void setup()
{
  size(500, 500);
  frameRate(60);
}
void draw()
{
}
void mouseMoved()
{
  background(0);
  fill(255, 255, 0);
  triangle(mouseX, mouseY - 50, mouseX - 40, mouseY + 25, mouseX + 40, mouseY + 25);
  fill(0);
  triangle(mouseX, mouseY + 25, mouseX - 20, mouseY - 13, mouseX + 20, mouseY - 13);
}
/**
 The triforce follows you. :D <br>
 Hold down a mouse button to make it stay still. <br>
 As soon as you release the mouse button it will follow you again.
 */
