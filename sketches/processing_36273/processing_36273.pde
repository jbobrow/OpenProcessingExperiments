
//homework 3
//copyright Christina Lee August 2011 Pittsburgh, PA 15289

//mouseIsDown assignment
boolean mouseIsDown = false;

//setup
void setup()
{
  background(255, 255, 255);
  size(500, 500);
  smooth();
}

//executed when mouse is down
void draw()
{
  if (mouseIsDown==true)
  {
    fill(mouseX%255, mouseY%255, random(256));
    noStroke();
    ellipse(mouseX, mouseY, 20, 20);
    ellipse(width-mouseX, height-mouseY, 20, 20);
  }
}

//setting parameters for mouseIsDown
void mousePressed()
{ 
  mouseIsDown = true;
}

void mouseReleased()
{ 
  mouseIsDown = false;
}

//erase function
void keyPressed()
{
  noStroke();
  fill(255, 255, 255);
  rect(0, 0, 500, 500);
}
