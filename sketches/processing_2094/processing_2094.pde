

/**This is a combination of two programs that I then altered. 
 *
 * Brightness by Rusty Robison. 
 * Brightness is the relative lightness or darkness of a color.
 * Move the cursor vertically over each bar to alter its brightness. 
 * 
 * Linear Motion
 * Changing a variable to create a moving line.  
 * When the line moves off the edge of the window, 
 * the variable is set to 0, which places the line
 * back at the bottom of the screen.
 *  
 *
 */


int barWidth = 5;
int[] brightness;
float a = 600;

void setup() 
{
  size(1000, 400);
  colorMode(HSB, 360, height, height);  
  brightness = new int[width/barWidth];
}

void draw() 
{
  int j = 0;
  for (int i = 0; i <= (width-barWidth); i += barWidth) {  
    stroke(20);
    if ((a > i) && (a < i+barWidth)) {
      brightness[j] = 150; 
    }
    fill(i, height, brightness[j]);
    rect(i, 0, barWidth, height);  
    j++;
  }

  //background(249, 250, 30);
  a = a - 1;
  if (a < 0) { 
    a = height; 
  }
  rect(0, a, width, a);  //line(0, a, width, a)
  {
  }    
  if (a < 0) {
    a = width;
  }
  rect(a, 0, a, height);
}



