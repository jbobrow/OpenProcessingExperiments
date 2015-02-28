
//Brandan H. Computer Programming 1 Block 7
//Press left mouse key for red squares
//Press right mouse key for green squares
//Press key a to clear screen
void setup()
{
  size(500,500);
}
void draw()
{
}
void mouseDragged()
{
  if (mouseButton==RIGHT)
  {
    fill(135,255,200);
    rect(pmouseX,pmouseY,25,25);
    rect(500-pmouseX,pmouseY,25,25);
    rect(pmouseX,500-pmouseY,25,25);
    rect(500-pmouseX,500-pmouseY,25,25);
  }
  if (mouseButton==LEFT)
  {
    fill(252,93,0);
    rect(pmouseX,pmouseY,25,25);
    rect(500-pmouseX,pmouseY,25,25);
    rect(pmouseX,500-pmouseY,25,25);
    rect(500-pmouseX,500-pmouseY,25,25);
  }
}
void keyPressed()
{
  {
    if (key=='w')
    smooth();
    fill (mouseY,mouseX,10);
    ellipse(mouseX,mouseY,25,25);
    ellipse(500-mouseX,mouseY,25,25);
    ellipse(mouseX,500-mouseY,25,25);
    ellipse(500-mouseX,500-mouseY,25,25);
  }
  {
    if (key=='a')
    background(197,197,197);
  }
}
