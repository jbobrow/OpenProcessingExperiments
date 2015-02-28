
//  R.A. Robertson 2010.10 "Left, Right" ~ www.rariora.org ~
// Detects relative position depending on angle of orientation, from the perspective
// of the Mouse. Returns "left" or "right."

float centerX, centerY, proxThen, proxNow, closing, mouseHeading, orient, antipode,
amp, distX, distY; PFont font;

void setup() {
  size (400,400);
  background(255);
  noCursor();
  smooth();
  font = createFont("Arial", 12, true);
  centerX = width/2; centerY = height/2; // Orientation target center of window.
//  centerX = random(width); centerY = random(height); // Option to show general case.
}

void draw() {
  fill(255);                                      // Display block.
  noStroke();
  rect(0, 0, width, height);
  stroke(0);
  ellipse(centerX, centerY, 10, 10); // Draw orientation target.
  ellipse(mouseX, mouseY, 20, 20); // Draw mouse agent.
  line(mouseX, mouseY, centerX, centerY); // Draw orientation line.
  distX = (mouseX - pmouseX) * amp; // Get travel distance.
  distY = (mouseY - pmouseY) * amp;
  line(mouseX, mouseY, mouseX + distX, mouseY + distY); // Draw heading indicator.
                                                  // Data block.
  proxThen = dist(pmouseX, pmouseY, centerX, centerY); // Mouse & target distance.
  proxNow = dist(mouseX, mouseY, centerX, centerY);
  closing = proxThen - proxNow; //println(closing);
  mouseHeading = angle(pmouseX, pmouseY, mouseX, mouseY); // Travel direction.
  orient = angle(pmouseX, pmouseY, centerX, centerY); // Direction facing.
  antipode = (orient + 180) % 360; // Direction behind (opposite orient).
  amp = 10; // Magnify length of heading indicator line.

textFont(font);                                    // Text interface.
  fill(0);
  text("Orientation = " + orient, 10, 20);
  text("Antipode = " + antipode, 10, 40);
  if (mouseHeading >= 0) {
  text("Mouse Heading = " + mouseHeading, 10, 60); }
  else 
  text("Mouse is Resting", 10, 60);
  
  if (mouseY > centerY  && closing > 0 // True for > 0 < 180 and closing.
  && mouseHeading < orient && mouseHeading > antipode) {
  text("Left", 10, 80); }
  else if (mouseY > centerY && closing > 0 && mouseHeading != orient) {
  text("Right", 10, 80); }
      
  if (mouseY < centerY && closing > 0 // True for > 180 < 369 and closing.
  && mouseHeading > orient && mouseHeading < antipode) {
  text("Right", 10, 80); }
  else if (mouseY < centerY && closing > 0 && mouseHeading != orient) {
  text("Left", 10, 80); }
    
  if (mouseHeading == orient && closing > 0) {text("On Axis", 10, 80); }
    
  if (closing <= 0) { text("No Approach", 10, 80); }
 
} // End Draw.

// Functions:
float slopeFunct(float x1, float y1, float x2, float y2) { // Assign two points.
//  line (x1, y1, x2, y2);    // Draw line (may be optional in other programs).
  float dx = x2 - x1;      // Run.
  float dy = y2 - y1;      // Rise.
  return dy/dx;            // Slope = rise/run.
}

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

void mousePressed() {
  setup();
}


