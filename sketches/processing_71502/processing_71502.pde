
// Alina V, User Input, CP1 mods 16,17
/**
Right-click and drag the mouse to draw symmetrical squares.<br>
Press and hold the following keys and drag the mouse for:<br>
r= red circles<br>
k= pink circles<br>
p= purple circlees<br>
e= erase the screen<br>
Press and hold the following keys and left-click and drag the mouse for:<br>
r= red squares<br>
k= pink squares<br>
p= purple squares<br>
*/
void setup()
{
  size(500,500);
  background(0);
}
void draw()
{
}
void keyPressed()
{
  if (key == 'e')
  {
  background(0,mouseX,255-mouseY);
 }
}
void mouseMoved()
{
  if (keyPressed == true && key == 'r')
  {
    fill(193,14,14,30);
    noStroke();
    ellipse(mouseX,mouseY,30,30);
  }
  if (keyPressed == true && key == 'k')
  {
    fill(246,88,255,30);
    noStroke();
    ellipse(mouseX,mouseY,30,30);
  }
  if (keyPressed == true && key == 'p')
  {
    fill(141,66,203,30);
    noStroke();
    ellipse(mouseX,mouseY,30,30);
  }
}
void mouseDragged()
{
  if (mouseButton == RIGHT)
 {
  fill(mouseX,mouseY,255-mouseY);
  stroke(0);
  rect(mouseX,mouseY,30,30);
  rect(500-mouseX,mouseY,30,30);
  rect(mouseX,500-mouseY,30,30);
  rect(500-mouseX,500-mouseY,30,30);
 }
{
   if (keyPressed == true && key == 'r' && mouseButton == LEFT)
  {
    fill(193,14,14,30);
    stroke(167,12,12);
    rect(mouseX,mouseY,mouseY/5,mouseY/5);
  }
  if (keyPressed == true && key == 'k' && mouseButton == LEFT)
  {
    fill(246,88,255,30);
    stroke(162,10,170);
    rect(mouseX,mouseY,mouseX/5,mouseX/5);
  }
   if (keyPressed == true && key == 'p' && mouseButton == LEFT)
  {
    fill(166,73,242,30);
    stroke(118,6,139);
    rect(mouseX,mouseY,mouseX/5,mouseX/5);
  }
 }
}
