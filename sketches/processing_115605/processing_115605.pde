
/*
Lines around a point
*/


// Counter for draw repetitions
int counter= 0;
// Starting point coordinates
int x1 = 250;
int y1 = 250;

void setup() {
  size(500, 500);
  background(255);
  stroke(10);
  strokeWeight(10);
  // Draw center point
  point(x1, y1);
  // Set strokeweight for draw()
  strokeWeight(1);
}

void draw() {
  // Increase randomness
  randomSeed(millis());
  stroke(10);
  // Each draw() draws a line with starting point x1,y1
  // and random end point
  line(x1, y1, random(0, 500), random(0, 500));
  // After 100 repeats of draw
  if (counter>100) {
    // Start the same thing as before from another point
    // Move the reference point
    translate(100, 100);
    // Same center point, but for new reference point
    point(x1, y1);
    // Increase randomness
    randomSeed(millis());
    // Line with red color
    stroke(255, 0, 0);
    // Same logic with previous lines
    line(x1, y1, random(0, 500), random(0, 500));
  }
  // Increase counter
  counter++;
}



