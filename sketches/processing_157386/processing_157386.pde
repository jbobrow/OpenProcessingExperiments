
/**
 * Hue. 
 * 
 * Hue is the color reflected from or transmitted through an object 
 * and is typically referred to as the name of the color (red, blue, yellow, etc.) 
 * Move the cursor vertically over each bar to alter its hue. 
 */
 
int barWidth = 2;
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
    fill(mouseY, height/2, height/2);
    rect(barX, height-random(0,height), barWidth*mouseX/100, random(0,height));
    lastBar = whichBar;
  }
}

