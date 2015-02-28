
//Michelle Z, CP1 4-5, User Input

int r = 220;
int g = 0;

void setup()
{
  size(500,500);
  background(255);
  strokeWeight(0.5);
}

void draw()
{
  fill(r,g,255);
  r = r - 1;
  g = g + 1;
  if (g > 255)
  {
    r = 220;
    g = 0;
  }
  if (mousePressed && mouseButton == LEFT)
  {
    rect(pmouseX,pmouseY,100,100,15);
    rect(500-pmouseX,500-pmouseY,100,100,15);
  }
  else if (mousePressed && mouseButton == RIGHT)
  {
    ellipse(pmouseX,pmouseY,100,100);
    ellipse(500-pmouseX,500-pmouseY,100,100);
    ellipse(500-pmouseX,pmouseY,100,100);
    ellipse(pmouseX,500-pmouseY,100,100);
  }
  if (keyPressed)
  {
    triangle(mouseX,mouseY,mouseY+50,mouseY+100,mouseX-50,mouseX+100);
  } 
}
