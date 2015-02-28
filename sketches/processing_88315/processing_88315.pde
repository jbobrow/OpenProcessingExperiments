
/*
 *  Title: P06_04_Conditionals
 *  By:    Barton Poulson (bartdoesart.com)
 *  Date:  04 February 2013
 *
 *  Assignment:
 *    Create a sketch that includes both (a) an “if” statement 
 *    that executes only when specified conditions are met; and 
 *    (b) a block of code that runs only when a key is pressed or
 *    released or the mouse is pressed, etc.
 */
 
// This palette is "Vintage Ralph Lauren" by dianesteinberg.
// See https://kuler.adobe.com/#themeID/2216979
// Approximate HTML color names from WolframAlpha.com are:
// Wheat, Beige, Slate Gray, Indian Red, and Dark Salmon (base color)
color[] c = {#E3CDA4, #7E827A, #2F343B, #703030, #C77966};

int n = 4;    // Number of circles
int d = 100;  // Diameter of circles
int f = 120;  // Time to move, in frames

float[] x  = new float[n];  // x coordinates for circles
float[] y  = new float[n];  // y coordinates for circles
float[] ty = new float[n];  // target coordinates for circles
float[] dy = new float[n];  // differences in y position

void setup() {
  size(600, 400);
  smooth();
  
  for (int i = 0; i < n; i++) {   // Cycles through arrays
    x[i]  = (i+1) * width/(n+1);  // Positions evenly on x
    y[i]  = random(height);       // Positions randomly on y
  }
}

void draw() {
  background(c[4]);
  
  // Instruction text for top left of drawing
  fill(c[3]);
  text("press spacebar", 10, 20);
  text("to move circles", 10, 35);
  
  // This loops through the number of circles chosen
  for (int i = 0; i < n; i++) {
    stroke(220);
    line(x[i], 0, x[i], height);  // Vertical lines
    
    noStroke();
    fill(c[i]);                   // Fill from color array
    ellipse(x[i], y[i], d, d);    // Circles

    if (abs(y[i] - ty[i]) < 3) {  // If circles are within 3 pixels of target
      y[i] = ty[i];               // ...then snap to target
    } else {                      // Otherwise
      y[i] += dy[i];              // Increment towards target (see below)
    }
  }
}

// This block only executes when a key is pressed
void keyPressed() {
  if (key == ' ') {                  // If the spacebar is pressed
      for (int i = 0; i < n; i++) {  // Cycles through arrays
      ty[i] = random(height);        // New target positions
      dy[i] = (ty[i] - y[i])/f;      // Creates increments for each circle
    }
  }
}
