
//HOMEWORK CLOCK

int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;

void setup() {
  size(700, 700);
  stroke(250);
  smooth();
  

  
  int radius = min(width, height) / 2;
  secondsRadius = radius * 0.72;
  minutesRadius = radius * 0.40;
  hoursRadius = radius * 0.50;
  clockDiameter = radius * 1.9;
  
  cx = width / 2;
  cy = height / 2;
}

void draw() {
  background(2);
  
  //clock 
  fill(122,255,234,123);
  noStroke();
  rect(100,100, 500, 500);
  
 
 
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  
  // hands of the clock
  stroke(255);
  strokeWeight(1);
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
  strokeWeight(2);
  line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
  strokeWeight(4);
  line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);
  rect(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
  
  // minute ticks
  strokeWeight(2);
  beginShape(LINES);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = cx + cos(angle) * secondsRadius;
    float y = cy + sin(angle) * secondsRadius;
    vertex(x, y);
  }
  endShape();
}


