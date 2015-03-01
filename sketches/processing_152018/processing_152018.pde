
float xmag, ymag = 0;
float newXmag, newYmag = 0;
int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;
int theMonth, theDay, theYear;

void setup() {
  size(520, 520, P3D);
  noStroke();

  colorMode(RGB, 1);

  int radius = min(width, height) / 2;
  secondsRadius = radius * 0.92;
  minutesRadius = radius * 0.40;
  hoursRadius = radius * 0.80;
  clockDiameter = radius * 0.8;

  cx = width / 2;
  cy = height / 2;
}

void draw() {
  background(000000);
  ellipse(cx, cy, 250, 250);
  pushMatrix(); 
  noStroke();
  translate(width/2, height/2); 

  newXmag = mouseX/float(width) * TWO_PI;
  newYmag = mouseY/float(height) * TWO_PI;

  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) { 
    xmag -= diff/4.0;
  }

  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { 
    ymag -= diff/4.0;
  }

  rotateX(-ymag); 
  rotateY(-xmag); 

  scale(18);
  beginShape(QUADS);

  fill(0, 1, 1); 
  vertex(-1, 1, 1);
  fill(1, 1, 1); 
  vertex( 1, 1, 1);
  fill(1, 0, 1); 
  vertex( 1, -1, 1);
  fill(0, 0, 1); 
  vertex(-1, -1, 1);

  fill(1, 1, 1); 
  vertex( 1, 1, 1);
  fill(1, 1, 0); 
  vertex( 1, 1, -1);
  fill(1, 0, 0); 
  vertex( 1, -1, -1);
  fill(1, 0, 1); 
  vertex( 1, -1, 1);

  fill(1, 1, 0); 
  vertex( 1, 1, -1);
  fill(0, 1, 0); 
  vertex(-1, 1, -1);
  fill(0, 0, 0); 
  vertex(-1, -1, -1);
  fill(1, 0, 0); 
  vertex( 1, -1, -1);

  fill(0, 1, 0); 
  vertex(-1, 1, -1);
  fill(0, 1, 1); 
  vertex(-1, 1, 1);
  fill(0, 0, 1); 
  vertex(-1, -1, 1);
  fill(0, 0, 0); 
  vertex(-1, -1, -1);

  fill(0, 1, 0); 
  vertex(-1, 1, -1);
  fill(1, 1, 0); 
  vertex( 1, 1, -1);
  fill(1, 1, 1); 
  vertex( 1, 1, 1);
  fill(0, 1, 1); 
  vertex(-1, 1, 1);

  fill(0, 0, 0); 
  vertex(-1, -1, -1);
  fill(1, 0, 0); 
  vertex( 1, -1, -1);
  fill(1, 0, 1); 
  vertex( 1, -1, 1);
  fill(0, 0, 1); 
  vertex(-1, -1, 1);

  endShape();

  popMatrix(); 

  fill(#B7FFBB);
  noStroke();
  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;

  // Draw the hands of the clock
  stroke(#ffffff);
  strokeWeight(2);
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
  strokeWeight(3);
  line(cx, cy, cx + cos(h) * minutesRadius, cy + sin(h) * minutesRadius);
  strokeWeight(3);
  line(cx, cy, cx + cos(m) * hoursRadius, cy + sin(m) * hoursRadius);

  // Draw the minute ticks
  strokeWeight(3);
  stroke(#B7FFBB);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = cx + cos(angle) * secondsRadius;
    float y = cy + sin(angle) * secondsRadius;
    vertex(x, y);
  }
  endShape();
  strokeWeight(6);
  stroke(#000000);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=30) {
    float angle = radians(a);
    float x = cx + cos(angle) * minutesRadius;
    float y = cy + sin(angle) * minutesRadius;
    vertex(x, y);
  }
  endShape();
  strokeWeight(6);
  stroke(#B7FFBB);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = cx + cos(angle) * hoursRadius;
    float y = cy + sin(angle) * hoursRadius;
    vertex(x, y);
  }
  endShape();

  theMonth = month();
  theDay = day();
  theYear = year();
  textSize(16);
  text(theMonth, 10, 28);
  textSize(16);
  text(theDay, 10, 56);
  textSize(16);
  text(theYear, 10, 84);
}



