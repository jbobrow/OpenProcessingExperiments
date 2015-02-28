
/**
 Yingying Yang
 Creative Computing Section B
 Wk 6 Assignment 3 - Herd
 */

int numCircles = 200;
float x[] = new float[numCircles];
float y[] = new float[numCircles];
color col[] = new color[numCircles];

void setup() {
  size(500, 500);
  colorMode(HSB);
  for (int i = 0; i < numCircles; i++) { 
    x[i] = random(width); 
    y[i] = random(height);
    col[i] = color(random(255), 255, 255);
  }
  frameRate(10);
}

void draw() {
  noStroke();
  background(127);
  for (int i = 0; i < numCircles; i++) {
    if ( (x[i]<=10) || (x[i]>=width-10) || (y[i]<=10) || (y[i]>=height-10) ) {
      fill(0);
      ellipse(x[i], y[i], 50, 50); //creatures turns black when it gets close to the edges of the screen
      fill(255);
      ellipse(x[i]+10, y[i]+10, 5, 5);
      ellipse(x[i]-10, y[i]-10, 5, 5);
    } 
    else {
      x[i] += random(-10, 10);
      y[i] += random(-10, 10);
      fill(col[i]);
      ellipse(x[i], y[i], 50, 50);
      fill(0);
      ellipse(x[i]+random(-10, 10), y[i]+random(-10, 10), 5, 5);
      ellipse(x[i]+random(-10, 10), y[i]+random(-10, 10), 5, 5);
    }
  }
}



