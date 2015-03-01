
void setup()
{
  size(1200,1200);
  background(0);
  colorMode(HSB, width, height, 100); 
  noStroke();
}

void draw()
{
 

int barWidth = 20;
int lastBar = -1;

  int whichBar = mouseX / barWidth;
  if (whichBar != lastBar) {
    int barX = whichBar * barWidth;
    noStroke();
    fill(barX, mouseY, 90);
    rect(barX, 0, barWidth, height);
    lastBar = whichBar;
  }

  stroke(mouseX,mouseY,100);
  fill(mouseX,mouseY,100);
  ellipse(mouseX,mouseY, mouseX+2, mouseY+2);
}




