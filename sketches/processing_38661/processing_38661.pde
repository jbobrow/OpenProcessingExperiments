
/**
 * Brightness 
 * by Rusty Robison. 
 * 
 * Brightness is the relative lightness or darkness of a color.
 * Move the cursor vertically over each bar to alter its brightness. 
 * 
 * Updated 28 February 2010.
 */
 
int barWidth = 6;
int lastBar = -2;

void setup() {
  size(400, 200);
  colorMode(HSB, 300, 100, height);
  noStroke();
  background(20);
}

void draw() {
  int whichBar = mouseX / barWidth;
  if (whichBar != lastBar) {
    int barX = whichBar * barWidth;
    fill(barX, 200, mouseY);
    rect(barX, 0, barWidth, height);
    lastBar = whichBar;
  }
}
