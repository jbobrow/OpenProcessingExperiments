
/**
 * Brightness 
 * by Rusty Robison. 
 * 
 * Brightness is the relative lightness or darkness of a color.
 * Move the cursor vertically over each bar to alter its brightness. 
 * 
 * Updated 28 February 2010.
 */
 
int barWidth = 5;
int lastBar = -1;

void setup() {
  size(400, 400);
  noStroke();
  background(0);
}

void draw() {
  
  background(0);
  int whichBar = mouseX / barWidth;
  if (whichBar != lastBar);
    int barX = whichBar * barWidth;
    
    fill(barX, random(100,255), mouseY);
    rect(barX, random(0,400), barWidth, height);
    lastBar = whichBar;
    
    fill(barX, random(100,255), mouseY);
    rect(mouseY, random(0,400), barWidth, height);
    lastBar = whichBar;
}


 

