
int barWidth = 20;
int lastBar = -1;

void setup() 
{
  size(640, 360);
  colorMode(HSB, height, height, height);  
  noStroke();
  background(0);
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
}


