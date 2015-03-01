
void setup()
{
  size(400, 400);
  background(#16C61D);
  rectMode(CORNERS);
}

void draw()
{
  rect(50, 50, 150, 150);
  fill(0);
  
  rect(350, 50, 250, 150);
  
  rectMode(CORNER);
  rect(150, 150, 100, 50);
  
  
  rect(100, 200, 200, 75);
  rectMode(CORNERS);
  
  rect(100, 200, 140, 350);
  
  rect(300, 200, 260, 350);
}


