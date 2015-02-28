
//Marlo S, User Input, CP1 mods 14-15//
void setup()
{
  size(800, 600);
}
void draw()
{
  stroke(125, 125, 125, 10);
  fill(125, 125, 125, 10);
  rect(0, 0, 800, 600);
  stroke(125, 125, 125, 10);
  fill(125, 125, 125, 10);
  rect(0, 0, 800, 600);
  noFill();
  strokeWeight(3);
  {
    if (key=='1')
    {
      stroke(255, 0, 0);
      ellipse(pmouseX, pmouseY, 25, 25);
      ellipse(800-pmouseX, pmouseY, 25, 25);
      ellipse(800-pmouseX, 600-pmouseY, 25, 25);
      ellipse(pmouseX, 600-pmouseY, 25, 25);
    }
  }
  if (key=='2')
  {
    stroke(255, 95, 0);
    ellipse(pmouseX, pmouseY, 25, 25);
    ellipse(800-pmouseX, pmouseY, 25, 25);
    ellipse(800-pmouseX, 600-pmouseY, 25, 25);
    ellipse(pmouseX, 600-pmouseY, 25, 25);
  }
  if (key=='3')
  {
    stroke(255, 245, 0);
    ellipse(pmouseX, pmouseY, 25, 25);
    ellipse(800-pmouseX, pmouseY, 25, 25);
    ellipse(800-pmouseX, 600-pmouseY, 25, 25);
    ellipse(pmouseX, 600-pmouseY, 25, 25);
  }
  if (key=='4')
  {
    stroke(0, 255, 0);
    ellipse(pmouseX, pmouseY, 25, 25);
    ellipse(800-pmouseX, pmouseY, 25, 25);
    ellipse(800-pmouseX, 600-pmouseY, 25, 25);
    ellipse(pmouseX, 600-pmouseY, 25, 25);
  }
  if (key=='5')
  {
    stroke(0, 0, 255);
    ellipse(pmouseX, pmouseY, 25, 25);
    ellipse(800-pmouseX, pmouseY, 25, 25);
    ellipse(800-pmouseX, 600-pmouseY, 25, 25);
    ellipse(pmouseX, 600-pmouseY, 25, 25);
  }
  if (key=='6')
  {
    stroke(80, 0, 255);
    ellipse(pmouseX, pmouseY, 25, 25);
    ellipse(800-pmouseX, pmouseY, 25, 25);
    ellipse(800-pmouseX, 600-pmouseY, 25, 25);
    ellipse(pmouseX, 600-pmouseY, 25, 25);
  }
  if (key=='7')
  {
    stroke(195, 0, 255);
    ellipse(pmouseX, pmouseY, 25, 25);
    ellipse(800-pmouseX, pmouseY, 25, 25);
    ellipse(800-pmouseX, 600-pmouseY, 25, 25);
    ellipse(pmouseX, 600-pmouseY, 25, 25);
  }
  if (key=='8')
  {
    stroke(0);
    ellipse(pmouseX, pmouseY, 25, 25);
    ellipse(800-pmouseX, pmouseY, 25, 25);
    ellipse(800-pmouseX, 600-pmouseY, 25, 25);
    ellipse(pmouseX, 600-pmouseY, 25, 25);
  }
  if (key=='9')
  {
    stroke(255);
    ellipse(pmouseX, pmouseY, 25, 25);
    ellipse(800-pmouseX, pmouseY, 25, 25);
    ellipse(800-pmouseX, 600-pmouseY, 25, 25);
    ellipse(pmouseX, 600-pmouseY, 25, 25);
  }
  if (key=='Z' || key=='z')
  {
    stroke(255,0,0);
    rect(pmouseX, pmouseY, 25, 25);
    rect(800-pmouseX, pmouseY, 25, 25);
    rect(800-pmouseX, 600-pmouseY, 25, 25);
    rect(pmouseX, 600-pmouseY, 25, 25);
  }
   if (key=='X' || key=='x')
  {
    stroke(255, 95, 0);
    rect(pmouseX, pmouseY, 25, 25);
    rect(800-pmouseX, pmouseY, 25, 25);
    rect(800-pmouseX, 600-pmouseY, 25, 25);
    rect(pmouseX, 600-pmouseY, 25, 25);
  }
   if (key=='C' || key=='c')
  {
    stroke(255, 245, 0);
    rect(pmouseX, pmouseY, 25, 25);
    rect(800-pmouseX, pmouseY, 25, 25);
    rect(800-pmouseX, 600-pmouseY, 25, 25);
    rect(pmouseX, 600-pmouseY, 25, 25);
  }
   if (key=='V' || key=='v')
  {
    stroke(0, 255, 0);
    rect(pmouseX, pmouseY, 25, 25);
    rect(800-pmouseX, pmouseY, 25, 25);
    rect(800-pmouseX, 600-pmouseY, 25, 25);
    rect(pmouseX, 600-pmouseY, 25, 25);
  }
   if (key=='B' || key=='b')
  {
    stroke(0, 0, 255);
    rect(pmouseX, pmouseY, 25, 25);
    rect(800-pmouseX, pmouseY, 25, 25);
    rect(800-pmouseX, 600-pmouseY, 25, 25);
    rect(pmouseX, 600-pmouseY, 25, 25);
  }
   if (key=='N' || key=='n')
  {
    stroke(80, 0, 255);
    rect(pmouseX, pmouseY, 25, 25);
    rect(800-pmouseX, pmouseY, 25, 25);
    rect(800-pmouseX, 600-pmouseY, 25, 25);
    rect(pmouseX, 600-pmouseY, 25, 25);
  }
   if (key=='M' || key=='m')
  {
    stroke(195, 0, 255);
    rect(pmouseX, pmouseY, 25, 25);
    rect(800-pmouseX, pmouseY, 25, 25);
    rect(800-pmouseX, 600-pmouseY, 25, 25);
    rect(pmouseX, 600-pmouseY, 25, 25);
  }
   if (key==',')
  {
    stroke(0);
    rect(pmouseX, pmouseY, 25, 25);
    rect(800-pmouseX, pmouseY, 25, 25);
    rect(800-pmouseX, 600-pmouseY, 25, 25);
    rect(pmouseX, 600-pmouseY, 25, 25);
  }
   if (key=='.')
  {
    stroke(255);
    rect(pmouseX, pmouseY, 25, 25);
    rect(800-pmouseX, pmouseY, 25, 25);
    rect(800-pmouseX, 600-pmouseY, 25, 25);
    rect(pmouseX, 600-pmouseY, 25, 25);
  }
  if (key=='A' || key=='a')
  {
    stroke(255, 0, 0);
    strokeWeight(10);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }

  if (key=='S' || key=='s')
  {
    stroke(255, 95, 0);
    strokeWeight(10);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if (key=='D' || key=='d')
  {
    stroke(255, 245, 0);
    strokeWeight(10);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if (key=='F' || key=='f')
  {
    stroke(0, 255, 0);
    strokeWeight(10);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if (key=='G' || key=='g')
  {
    stroke(0, 0, 255);
    strokeWeight(10);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if (key=='H' || key=='h')
  {
    stroke(80, 0, 255);
    strokeWeight(10);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if (key=='J' || key=='j')
  {
    stroke(195, 0, 255);
    strokeWeight(10);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if (key=='K' || key=='k')
  {
    stroke(0);
    strokeWeight(10);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if (key=='L' || key=='l')
  {
    stroke(255);
    strokeWeight(10);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if (key=='R'|| key=='r')
  {
    stroke(125);
    strokeWeight(1);
    fill(125);
    rect(0, 0, 800, 600);
    stroke(125, 125, 125, 10);
    fill(125, 125, 125, 10);
    rect(0, 0, 800, 600);
  }
}
/**
Want to draw ellipses?<br>
Press:<br>
1-RED<br>
2-ORANGE<br>
3-YELLOW<br>
4-GREEN<br>
5-BLUE<br>
6-INDIGO<br>
7-PURPLE<br>
8-BLACK<br>
9-WHITE<p>
Want to draw squares?<br>
Z-RED<br>
X-ORANGE<br>
C-YELLOW<br>
V-GREEN<br>
B-BLUE<br>
N-INDIGO<br>
M-PURPLE<br>
,-BLACK<br>
.-WHITE<p>
Want to draw a line?<br>
Press:<br>
A-RED<br>
S-ORANGE<br>
D-YELLOW<br>
F-GREEN<br>
G-BLUE<br>
H-INDIGO<br>
J-PURPLE<br>
K-BLACK<br>
L-WHITE<p>
Press R to reset.<br>
Press any key not listed to stop drawing.<br>
Note: The controls aren't case sensitive.
*/

