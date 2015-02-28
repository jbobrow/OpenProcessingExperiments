
// Made by Gerard Westerhof, 500546677, DMCI_DV
/*
Site's used:
http://processing.org/learning/basics/clock.html
http://processingjs.org/reference/curve_/
*/
 
int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;
 
void setup() {
  size(400, 400);
  stroke(255);
  
  int radius = min(width, height) / 2;
  secondsRadius = radius * 0.72;
  minutesRadius = radius * 0.60;
  hoursRadius = radius * 0.50;
  clockDiameter = radius * 1.8;
  
  cx = width / 2;
  cy = height / 2;
}
 
void draw() {
  background(255,51,52);
  
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  
  // Draw the hands of the clock
  stroke(255);
  strokeWeight(1);
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
  noFill();
  stroke(180);
  curve(cx + cos(s) * secondsRadius, 
        cy + sin(s) * secondsRadius+140, 
        cx + cos(s) * secondsRadius, 
        cy + sin(s) * secondsRadius, 
        cx + cos(m) * minutesRadius, 
        cy + sin(m) * minutesRadius, 
        cx + cos(m) * minutesRadius, 
        cy + sin(m) * minutesRadius-130
  );
  curve(cx + cos(m) * minutesRadius, 
        cy + sin(m) * minutesRadius+140, 
        cx + cos(m) * minutesRadius, 
        cy + sin(m) * minutesRadius,
        cx + cos(h) * hoursRadius,
        cy + sin(h) * hoursRadius,
        cx + cos(h) * hoursRadius,
        cy + sin(h) * hoursRadius-130
  );
  curve(cx + cos(s) * secondsRadius, 
        cy + sin(s) * secondsRadius+140, 
        cx + cos(s) * secondsRadius, 
        cy + sin(s) * secondsRadius,
        cx + cos(h) * hoursRadius,
        cy + sin(h) * hoursRadius,
        cx + cos(h) * hoursRadius,
        cy + sin(h) * hoursRadius-130
  );
  stroke(255);
  strokeWeight(2);
  line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
  strokeWeight(4);
  line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);
  
  // Draw the minute ticks
  strokeWeight(2);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = cx + cos(angle) * secondsRadius;
    float y = cy + sin(angle) * secondsRadius;
    vertex(x, y);
  }
  endShape();
  
  
  strokeWeight(5);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=30) {
    float angle = radians(a);
    float x = cx + cos(angle) * hoursRadius;
    float y = cy + sin(angle) * hoursRadius;
    vertex(x, y);
  }
  endShape();
  
}
