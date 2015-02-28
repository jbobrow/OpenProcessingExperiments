
//homework3
//copyright Kristen McConnell August 2011 Pittsburgh PA 15221

float x,y;
color col;

//Black Background & Overall Size
void setup()
{
size(400,400);
smooth();
noCursor();
fill(0);
noStroke();
rect(0, 0, 400, 400);
}

//Drawing Dots with One Random Color
void draw()
{
  fill(col);
  ellipse(mouseX, mouseY, 30, 30);
}

//Drawing Dots by Dragging with Multiple Random Colors
void mouseDragged()
{
  noStroke();
  col=color(random(256),random(256),random(256));
  fill(col);
  ellipse(mouseX, mouseY, 30, 30);
}

