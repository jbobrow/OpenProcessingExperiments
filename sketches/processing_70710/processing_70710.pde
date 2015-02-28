
int colorBackground = 0;
void setup()
{
  size(800, 800);
  background(255);
  fill(50,52,51);
  textSize(12);
  text("Press: 'e' to erase 'a' to clear screen 'r' for red 'g' for green 'b' for blue 'y' for yellow 'o' for black '1,3,5,7,9' changes stroke size Click to draw", 20, 20);
}
void draw()
{
  text("Press: 'e' to erase 'a' to clear screen 'r' for red 'g' for green 'b' for blue 'y' for yellow 'o' for black '1,3,5,7,9' changes stroke size Click to draw", 20, 20);
  if ( key=='r')
  {
    stroke(255, 0, 0);
  }
  if (key=='b')
  {
    stroke(0, 0, 255);
  }
  if (key=='g')
  {
    stroke(11, 183, 29);
  }
  if (key=='y')
  {
  stroke(229,220,42);
  }
  if (key== 'o')
  {
    stroke(0);
  }
  if (key=='1')
  {
    strokeWeight(1);
  }
  if (key=='3')
  {
    strokeWeight(8);
  }
  if (key=='5')
  {
    strokeWeight(18);
  }
  if (key=='7')
  {
    strokeWeight(30);
  }
  if (key=='9')
  {
    strokeWeight(55);
  }
  if (key=='e')
  {
    stroke(255);
  }
}
void mouseDragged()
{
  line(mouseX, mouseY, pmouseX, pmouseY);
}
void keyPressed()
{
    if(key== 'a')
  {
    background(255);
  }
}
