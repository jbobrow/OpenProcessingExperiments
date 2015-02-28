
//HW3 - Computing for arts with Processing
//Copyright Ziad Ewais (zewais) - 09/06/2011 - CMU

float x, y;
String k;
void setup() //Setting up the stage!
{
  size(400, 400);
  smooth();
  fill(255, 0, 0);
  background(0, 0, 200);
  noCursor();
  strokeWeight(6);
  k = null; 
}

void draw()//The main function of drawing
{
  if (mousePressed && mouseButton == RIGHT)
  {
    background(random(255), random(255), random(255));
  }
  if (key == 'l')
  {
    k = "line";  
  }
  if (key == 'e')
  {
    k = "ellipse";
  }
  if (key == 'r')
  {
    k = "rect";
  }
  if (key == 't')
  {
    k = "triangle";
  }
}

void mouseDragged() //function when the mouse is dragged
{

  if (k == null || k == "line") // to draw the lines confetties
  {
    stroke(random(255), random(255), random(255), 200);
    line(random(mouseX - 20, mouseX + 20), random(mouseY - 20, mouseY + 20), 
    random(mouseX - 20, mouseX + 20), random(mouseY - 20, mouseY + 20));
  }
  if (k == "ellipse") // to draw the ellipses confetties
  {
    noStroke();
    fill(random(255), random(255), random(255), 200);
    ellipse(random(mouseX - 20, mouseX + 20), random(mouseY - 20, mouseY + 20), 
    random(20), random(20));
  }
  if (k == "rect") // to draw the rectangles confetties
  {
    noStroke();
    rectMode(CENTER);
    fill(random(255), random(255), random(255), 200);
    rect(random(mouseX - 20, mouseX + 20), random(mouseY - 20, mouseY + 20), 
    random(20), random(20));
  }
  if (k == "triangle") // to draw the triangles confetties
  {
    noStroke();
    fill(random(255), random(255), random(255), 200);
    triangle(random(mouseX - 20, mouseX + 20), random(mouseY - 20, mouseY + 20), 
    random(mouseX - 20, mouseX + 20), random(mouseY - 20, mouseY + 20),
    random(mouseX - 20, mouseX + 20), random(mouseY - 20, mouseY + 20));
  }
}
  



