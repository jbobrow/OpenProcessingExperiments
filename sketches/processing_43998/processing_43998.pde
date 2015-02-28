
// R.A. Robertson 2010.06, "Angles."
float x, y;
PFont font;

void setup() {
  size (400, 400);
  background(255);
  smooth();
  font = createFont("Arial", 12, true);
  x = random(width);
  y = random (height);
}

void draw() {
  fill(255);
  noStroke();
  rect(0, 0, width, height);
  stroke(0);
  float centerX = width/2;
  float centerY = height/2;
  ellipse(x, y, 4, 4);
  ellipse(mouseX, mouseY, 6, 6);

  float slope = slopeFunct(centerX, centerY, mouseX, mouseY);
  float theta = angle(centerX, centerY, mouseX, mouseY);
  float slope1 = slopeFunct(centerX, centerY, x, y);
  float theta1 = angle(centerX, centerY, x, y);
  float diff = (theta - theta1);

  textFont(font);
  fill(0);
  text("Angle 1 = " + theta, 10, 40);
  text("Angle 2 = " + theta1, 10, 60);
  text("Separation = " + diff, 10, 80);
} // End Draw.

// Functions:
float slopeFunct(float x1, float y1, float x2, float y2) { // Assign two points.
  line (x1, y1, x2, y2);    // Draw line (may be optional in other programs).
  float dx = x2 - x1;      // Run.
  float dy = y2 - y1;      // Rise.
  return dy/dx;            // Slope = rise/run.
}

float angle(float x1, float y1, float x2, float y2) {
  float angle;
  float dx = x2 - x1;      // Run.
  float dy = y2 - y1;      // Rise.
  float slope = dy/dx;    // Slope = rise/run.
  if (dx >= 0 && dy >= 0) { 
    angle = degrees(atan(slope));
  }
  else if (dx < 0 && dy > 0) { 
    angle = degrees(atan(slope)) + 180;
  }
  else if (dx < 0 && dy <= 0) { 
    angle = degrees(atan(slope)) + 180;
  }
  else if (dx >=0 && dy < 0) { 
    angle = degrees(atan(slope)) + 360;
  }
  else angle = 1000; // This should never be true, but seems needed for println().
  return angle;
}

void mousePressed() {
  setup();
}


