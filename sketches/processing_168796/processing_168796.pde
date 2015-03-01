
void setup()
{
  size(500, 500);
  background(255);
  stroke(0,0,0, 5);
  fill(0, 0, 0, 5);
  smooth();
}

void draw()
{
  int i=10;
  int j=20;
  if (mousePressed) {
    i=10;
    j=20; 
  } 
  
  else {
    i=20; 
    j=10;
  }

  rectMode(CENTER);
  rect(mouseX, mouseY, i, j);
  
  
}

void mouseReleased()
{
  background(255);
}

