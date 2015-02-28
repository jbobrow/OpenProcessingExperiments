
color fillColor = color(0); // default color is black
int paintSize = 10;
boolean showInstructions;
int frame = 1;
void setup()
{
  size(1000, 700);
  background(255);
  noStroke();
  showInstructions = true;
  smooth();
}
void draw()
{
  if (showInstructions == true)
  {
    instructions();
    frame = frameCount;
  }
  if (showInstructions == false && frame == (frameCount - 1))
    background(255);
  savePicture();
}
void mouseDragged()
{
  showInstructions = false;
  if (mouseButton == LEFT)
  {
    strokeWeight(paintSize);
    stroke(fillColor);
    line(mouseX, mouseY, pmouseX, pmouseY);  // this works better than drawing small ellipses or points
  }
  if (mouseButton == RIGHT)
  {
    background(255);
  }
}
void keyReleased()
{
  if (key != '?' && keyCode != SHIFT && key != 'p' && key != 's')
    showInstructions = false;
  if (key == 'r')
    fillColor = color(255, 0, 0);
  if (key == 'g')
    fillColor = color(0, 255, 0);
  if (key == 'b')
    fillColor = color(0, 0, 255);
  if (key == 'c')
    fillColor = color(0, 255, 255);
  if (key == 'm')
    fillColor = color(255, 0, 255);
  if (key == 'y')
    fillColor = color(255, 255, 0);
  if (key == 'k')
    fillColor = color(0);
  if (key == 'w')
    fillColor = color(255);
  if (key == '*')
  {
    background(255);
    noStroke();
    fill(0);
    for (int i = 0; i < 1000; i++)
      ellipse(random(width - 6) + 3, random(height - 6) + 3, 3, 3);
  }
  if (key == '1')
    paintSize = 10;
  if (key == '2')
    paintSize = 20;
  if (key == '3')
    paintSize = 30;
  if (key == '4')
    paintSize = 40;
  if (key == '5')
    paintSize = 50;
  if (keyCode == UP && paintSize < 100)
    paintSize += 5;
  if (keyCode == DOWN && paintSize > 5)
    paintSize -= 5;
  if (key == ' ')
    background(255);
  if (key == '?')
    showInstructions = true;
}
void instructions()
{
  fill(255);
  rect(0, 0, width, height);
  textSize(20);
  fill(0);
  String instructions = "Click and drag the mouse to draw.\nChange the color with the folowing keys:\nr = red, g = green, b = blue, c = cyan, m = magenta, y = yellow, k = black, w = white\nTo change the width of the paintbrush, press 1, 2, 3, 4, or 5,\nor you can use the up and down arrows for custom changes.\nRight-click or hit the spacebar to blank the canvas.\nHit * for small circles everywhere!\nPress 's' to save the current picture temporarily, and press 'p' to get the saved picture back.\nPress ? to read these wonderful instructions again.";
  text(instructions, 20, 40);
}
void savePicture()
{
  if (keyPressed && key == 's')
  {
    loadPixels();
  }
  if (keyPressed && key == 'p')
  {
    updatePixels();
  }
}
