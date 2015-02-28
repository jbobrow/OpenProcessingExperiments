
/**
 * Brightness 
 * by Rusty Robison. 
 * 
 * Brightness is the relative lightness or darkness of a color.
 * Move the cursor vertically over each bar to alter its brightness. 
 */
 
int barWidth = 5;
int[] brightness;

void setup() 
{
  size(200, 200);
  colorMode(RGB, 200, width/(mouseX+1), height/(mouseY+1));  
  brightness = new int[width/barWidth];
  frameRate (100);
}

void draw() 
{
  int j = 0;
  for (int i = 0; i <= (width-barWidth); i += barWidth) {  
    noStroke();
    if ((mouseX > i) && (mouseX < i+barWidth)) {
      brightness[j] = mouseY;
    }
    fill(i, height, brightness[j]);
    rect(i, 0, barWidth, height);  
    j++;
  }
}

