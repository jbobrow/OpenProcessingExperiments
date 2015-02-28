
//Justin J, User Input Painting Program, CP1 Mods 16/17
void setup()
{
  noStroke();
  size(500, 500);
  background(0);
}
void draw()
{
  Drawing();
}
void Drawing()
{
  if (mousePressed==true && mouseButton==LEFT)
  {
    ellipse(mouseX, mouseY, 20, 20);
    if (key=='m')
    {
      ellipse(500-mouseX, mouseY, 20, 20);
      ellipse(mouseX, 500-mouseY, 20, 20);
      ellipse(500-mouseX, 500-mouseY, 20, 20);
    }
  }
  if (mousePressed==true && mouseButton==RIGHT)
  {
    stroke(0);
    fill(0);
    rect(mouseX, mouseY, 50, 50);
  }
  if (key=='e')
  {
    background(0);
  }
}
void keyTyped()
{
  if (key=='r')
  {
    stroke(255, 0, 0);
    fill(255, 0, 0);
  }
  if (key=='g')
  {
    stroke(0, 255, 0);
    fill(0, 255, 0);
  }
  if (key=='b')
  {
    stroke(0, 0, 255);
    fill(0, 0, 255);
  }
  if (key=='w')
  {
    stroke(255);
    fill(255);
  }
}
/**Left click and drag to make ellipses.<br>
 Press "m" to have mirror images.<br>
 To stop mirror images, press any other key.<br>
 For colored mirror images, choose color before mirror.<br>
 Press "r" for red.<br>
 Press "g" for green.<br>
 Press "b" for blue.<br>
 Press "w" for white. <br>
 Right Click and drag for a small eraser.<br>
 Press "e" to erase the whole screen.
 */
