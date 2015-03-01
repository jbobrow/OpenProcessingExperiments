
int barWidth = 1;
int lastBar = -1;

void setup() 
{
  size(640, 360);
  colorMode(HSB, width, width, width);  
  noStroke();
}

void draw() 
{
 
  int whichBar = mouseX / barWidth;
  if (whichBar != lastBar) {
    int barX = whichBar * barWidth;
    fill(mouseY, width, width);
    rect(barX, 0, barWidth, width);
    lastBar = whichBar;
     if ((mouseX>0) && (mouseX<640) && (mouseY>0)) {
       rect (mouseX, mouseY, mouseY, 5);
     
       
  }
  }
}



