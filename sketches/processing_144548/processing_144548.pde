
int barWidth = 40;
int lastBar = -1;

void setup() 
{
  size(1200, 800);
  background(255);
  colorMode(HSB, height, height, height);  
  noStroke();
}

void draw() 
{
  int whichBar = mouseX / barWidth;
  if (whichBar != lastBar) {
    int barX = whichBar * barWidth;
    fill(mouseY, height, height);
    rect(barX, 0, barWidth, height);
    lastBar = whichBar;
  }
  stroke(255);
  fill(0);
    if (mousePressed) {
    triangle(mouseX,mouseY,600,400,mouseY,mouseX);
  } else {
  ellipse(mouseX,mouseY,200,200);
  }
}


