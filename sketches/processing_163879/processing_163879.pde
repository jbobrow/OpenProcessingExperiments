
void setup() 
{
  size(1280, 640); 
  background(0); 
  noStroke();
  rectMode(CENTER);
}

void draw() 
{   
  if (mousePressed) {
    fill(0);
  } else {
    fill(255);
    noStroke();
  } 
  rect(mouseX, height/2, mouseX/2+11, mouseY/2+11);
  int inverseX = width-mouseX;
  int inverseY = height-mouseY;
  rect(inverseX, height/2, (inverseY/2)+11, (inverseY/2)+11);
}


