
//  R.A. Robertson 2013.08 "Corrugation" ~ www.rariora.org ~
// License: Creative Commons :: Attribution, Share Alike

float colorLevel, amp, frequencyX, frequencyY, paint, diagonal;
boolean toggleLoop = true;

void setup() {
  size(400, 200);
  colorLevel = 255;
  colorMode(HSB, colorLevel);  
  amp = colorLevel / 4;      // See notes.
  frequencyX = 0.1;          // Smaller values make larger corrugations.
  frequencyY = 15.1;          // Play with different frequency ratios.
  diagonal = 0.5;            // For loop values may need to be adjusted when using.
}

void draw() {
  for (int y = 0; y < height; y++) {            
    for (int x = -200; x < width; x++) {
      paint = ((sin(x * frequencyX) + 1.0) * amp) + 
              ((sin(y * frequencyY) + 1.0) * amp); 
//      set(x + int(y * diagonal), y, color(paint));    // Grayscale.
      set(x + int(y * diagonal), y, color(paint, colorLevel, colorLevel));  // HSB.
    }
  }
//  frequencyY += 0.005;                              // Slow, but edifying.
  noLoop();
}

/* ========================== UI ========================== */

void mousePressed() {
  if (mouseButton == LEFT) {
    if (toggleLoop) { 
      noLoop();
      cursor();
      toggleLoop = false;
    }
    else { 
      loop(); 
      toggleLoop = true;
    }
  }
}

/* ========================== NOTES ========================== 

Sine wave corrugation and textile weave pattern generator.

For simple 1 dimensional corrugation, set either X or Y frequency to 0.
For 2D egg carton type corrugation, set X and Y frequencies equally.
This is most apparent in grayscale mode, default frequency around 0.1.
Set diagonal to 0 for vertical and/or horizontal corrugation.

X and Y sine values are in the range of -1 and 1.
Add 1 to bring the range from 0 to 2 so we have only positive color values.
Now, maximum sine value = 2, so we multiply by an amp value for max colorLevel,
but X and Y each are 1/2 the total so our amp must be 1/4 colorLevel.
i.e. (2 * 63.75) + (2 * 63.75) = 255 where sine of X & Y are at maximum.

*/
