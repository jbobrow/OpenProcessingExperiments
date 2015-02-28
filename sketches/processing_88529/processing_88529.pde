
/*
 *  Title: P06_06_Spirals
 *  By:    Barton Poulson (bartdoesart.com)
 *  Date:  06 February 2013
 *
 *  Assignment: 
 *    Create your own, modified version of this drawing by altering
 *    some aspect of the spirals.
 */
 
// This palette is "Indispensible" by dlgombert.
// See https://kuler.adobe.com/#themeID/2220568

color[] palette = {#414F73, #34888C, #2DA65D, #67BF47, #EEF272};

float x, y;                // These create the variables for x and y coordinates
float radiusCircle = 100;  // Defines the radius of the circle
int k = 0;                 // This record the keyboard selections

void setup() {
  size(400, 400);
  smooth();
  ellipseMode(RADIUS);
  rectMode(CENTER);
}

void draw() {
  translate(width/2, height/2);

  background(palette[0]);
  
  fill(255);
  text("press 1, 2, 3, 4, or 5 to draw, press 0 to clear", -width/2 + 10, -height/2 + 10);

  // Draw nothing
  if (k == 0) {
    noStroke();
    fill(palette[0]);
    rect(0, 20, width, height);  // Covers everything except instructions at top
  }

  // Draw a circle using ellipse
  if (k == 1) {
    fill(palette[1]);
    text("this circle is drawn with ellipse()", -width/2 + 10, height/2 - 10);
    stroke(palette[1]);
    noFill();
    ellipse(0, 0, radiusCircle, radiusCircle);
  }

  // Draw a circle with points using trigonometry
  if (k == 2) {
    fill(palette[1]);
    text("this circle is drawn with trig functions", -width/2 + 10, height/2 - 10);
    stroke(palette[4]);
    strokeWeight(5);
    for(float angle = 0; angle < 2*PI; angle += .1){
      x = cos(angle) * radiusCircle;
      y = sin(angle) * radiusCircle;
      point(x, y);
    }
  }

  // Draw dots in a spiral
  if (k == 3) {
    fill(palette[1]);
    text("this spiral is drawn with trig functions", -width/2 + 10, height/2 - 10);
    float radiusSpiralDots = 10;
    stroke(palette[3]);
    strokeWeight(5);
    for(float angle = 0; angle < 8*PI; angle += .1){
      radiusSpiralDots += 0.5;
      x = cos(angle) * radiusSpiralDots;
      y = sin(angle) * radiusSpiralDots;
      point(x, y);
    }
  }

  // Draw a spiral line by connecting dots
  if (k == 4) {
    fill(palette[1]);
    text("this spiral connects the dots", -width/2 + 10, height/2 - 10);
    float px = -999;  // Start off screen, for previous x
    float py = -999;  // Start off screen, for previous y
    float radiusSpiralLine = 10;
    stroke(palette[2]);
    strokeWeight(1);
    for(float angle = 0; angle < 8*PI; angle += .05){
      radiusSpiralLine += 0.25;
      x = cos(angle) * radiusSpiralLine;
      y = sin(angle) * radiusSpiralLine;
      if(px > -999){        // If values are on screen 
        line(x, y, px, py); // Connect current x/y with previous x/y
      }
      px = x;  // Move current x to previous x
      py = y;  // Move current y to previous y
    }
  }
  
  // Draw line spokes in a spiral, based on dots
  if (k == 5) {
    fill(palette[1]);
    text("this spiral draws spokes to end points", -width/2 + 10, height/2 - 10);
    float radiusSpiralDots = 10;
    stroke(palette[3]);
    strokeWeight(1);
    for(float angle = 0; angle < 8*PI; angle += .1){
      radiusSpiralDots += 0.5;
      x = cos(angle) * radiusSpiralDots;
      y = sin(angle) * radiusSpiralDots;
      line(0, 0, x, y);
    }
  }
}

// This allows user to select the method of drawing
// The numbers 49 etc. are ASCII codes for the number
// keys at the top of the keyboard; the variable k
// indicates the key pressed
void keyPressed() {
  if (key == 49) k = 1;
  if (key == 50) k = 2;
  if (key == 51) k = 3;
  if (key == 52) k = 4;
  if (key == 53) k = 5;
  if (key == 48) k = 0;
}
