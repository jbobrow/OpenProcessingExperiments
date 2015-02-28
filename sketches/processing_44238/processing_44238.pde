
//  R.A. Robertson 2010.07 "Heading" ~ www.rariora.org ~

float xThen, xNow, yThen, yNow, v, xv, yv, distX, distY, amp, ampB, toggleX, toggleY;
PFont font;

void setup() {
  size (800,400);
  background(255);
  smooth();
  noCursor();
  font = createFont("Arial", 12, true);
   xNow = random(width - 1); // Initialize start point for Bouncer.
   yNow = random(height - 1);
   xv = random(-5, 5); // Initialize Bouncer velocity.
   yv = random(-5, 5);
   toggleX = 1; // Set boundary reflection.
   toggleY = 1;
   frameRate(60); // For reasonable speed in Chrome.
}

void draw() {
  fill(255);
  noStroke();
  rect(0, 0, width, height);
  stroke(0);
  ellipse(mouseX, mouseY, 20, 20); // Begin mouse heading block.
  v = dist(pmouseX, pmouseY, mouseX, mouseY); // Mouse velocity.
  amp = 4; // Magnify length of heading indicator line.
  distX = (mouseX - pmouseX) * amp; // Get travel distance.
  distY = (mouseY - pmouseY) * amp;
  line(mouseX, mouseY, mouseX + distX, mouseY + distY); // Heading indicator.
  ellipse(mouseX + distX, mouseY + distY, 4, 4); // Heading indicator terminus.
  float mouseHeading = angle(pmouseX, pmouseY, mouseX, mouseY); // End mouse heading.
  
  ampB = 40; // Begin bouncer heading block.
  xThen = xNow; // Update location from previous frame.
  xNow = xNow + (xv * toggleX); // Axial velocity and direction.
  distX = (xNow - xThen) * ampB; // Get travel distance.
  yThen = yNow; // Repeat for Y axis.
  yNow = yNow + (yv * toggleY);
  distY = (yNow - yThen) * ampB;
  ellipse (xNow, yNow, 30, 30); // Bouncer.
  line(xNow, yNow, xNow + distX, yNow + distY); // Heading indicator.
  ellipse(xNow + distX, yNow + distY, 4, 4); // Heading indicator terminus.
  float bounceHeading = angle(xThen, yThen, xNow, yNow);
  float bounceV = dist(xThen, yThen, xNow, yNow); // Bouncer velocity.
  bounce(); // End bouncer block
  
 textFont(font); // Display.
  fill(0);
  if (mouseHeading >= 0) {
  text("Mouse Heading = " + mouseHeading, 10, 40); }
  else 
  text("Mouse is Resting", 10, 40);
  text("Mouse Velocity = " + v, 10, 60);
  text("Bouncer Heading = " + bounceHeading, 10, 80);
  text("Bouncer Velocity = " + bounceV, 10, 100);

} // End Draw.

// Functions:
float angle(float x1, float y1, float x2, float y2) {
  float angle;
  float dx = x2 - x1;      // Run.
  float dy = y2 - y1;      // Rise.
  float slope = dy/dx;    // Slope = rise/run.
  if (dx >= 0 && dy >= 0) { angle = degrees(atan(slope)); }
  else if (dx < 0 && dy > 0) { angle = degrees(atan(slope)) + 180;}
  else if (dx < 0 && dy <= 0) { angle = degrees(atan(slope)) + 180; }
  else if (dx >=0 && dy < 0) { angle = degrees(atan(slope)) + 360; }
  else angle = 1000; // This should never be true, but seems needed for println().
  return angle;
}

void bounce() {
  if (xNow >= width - 15) { toggleX = toggleX * -1; }
  if (xNow <= 0 + 15) { toggleX = toggleX * -1; }
  if (yNow >= height - 15) { toggleY = toggleY * -1; }
  if (yNow <= 0 + 15) { toggleY = toggleY * -1; }
}

void mousePressed() {
    setup();
}

