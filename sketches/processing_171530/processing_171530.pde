
int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;

void setup() {
  size(360, 360);
  stroke(255);
  
  int radius = min(width, height) / 2;
  secondsRadius = radius * 0.75;
  minutesRadius = radius * 0.65;
  hoursRadius = radius * 0.50;
  clockDiameter = radius * 1.8;
  
  cx = width / 2;
  cy = height / 2;
}

void draw() {
  background(0);
  
  // Draw the clock background
  
 
  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;

  strokeWeight(2);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = cx + cos(angle) * secondsRadius;
    float y = cy + sin(angle) * secondsRadius;
    vertex(x, y);
  }
  endShape();
  
    strokeWeight(3);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = cx + cos(angle) * minutesRadius;
    float y = cy + sin(angle) * minutesRadius;
    vertex(x, y);
  }
  endShape();
  
  strokeWeight(8);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=30) {
    float angle = radians(a);
    float x = cx + cos(angle) * hoursRadius;
    float y = cy + sin(angle) * hoursRadius;
    vertex(x, y);
  }
  endShape();
  
  fill(random(255),100,255, 100);
  noStroke();
  ellipse(cx, cy, clockDiameter, clockDiameter);
  
  
  stroke(255);
  strokeWeight(1);
  strokeWeight(2);
  strokeWeight(4);
  
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = cx + cos(m) * minutesRadius;
    float y = cy + sin(m) * minutesRadius;
    fill(50);
    ellipse(x, y, 8,8);
  }

  
  fill(255,100,80);
  beginShape(POINTS); 
  for (int a = 0; a < 360; a+=6) {
    float x = cx + cos(s) * secondsRadius;
    float y = cy + sin(s) * secondsRadius;
    vertex(x, y);
  }
  endShape();
  

  
  strokeWeight(8);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = cx + cos(m) * minutesRadius;
    float y = cy + sin(m) * minutesRadius;
    vertex(x, y);
  }
  endShape();
  
  strokeWeight(20);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = cx + cos(h) * hoursRadius;
    float y = cy + sin(h) * hoursRadius;
    vertex(x, y);
  }
  endShape();
}
