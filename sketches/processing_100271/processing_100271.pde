
/**
 * Clock. 
 * 
 * The current time can be read with the second(), minute(), 
 * and hour() functions. In this example, sin() and cos() values
 * are used to set the position of the hands.
 */

int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;
PImage img;

void setup() {
  size(500, 500);
  stroke(255);
  
  int radius = min(width, height) / 2;
  //secondsRadius = radius * 0.72;
  //minutesRadius = radius * 0.60;
  //hoursRadius = radius * 0.50;
  secondsRadius = radius * 0.50;
  minutesRadius = radius * 0.50;
  hoursRadius = radius * 0.40;
  clockDiameter = radius * 1.8;
  
  cx = width / 2;
  cy = height / 2;
  
  
  img = loadImage("Original_02405_1.jpg");
  
}

void draw() {
 
  background(0);
  image(img,0,0);
  // Draw the clock background
  fill(255,255,255,0);
  noStroke();
  ellipse(cx, cy, clockDiameter, clockDiameter);
  
  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  
  // Draw the hands of the clock
  //stroke(255);
  stroke(21,59,106);
  //strokeWeight(1);
  strokeWeight(2);
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius); 
  //strokeWeight(2);
  strokeWeight(4);
  line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
  //strokeWeight(4);
  strokeWeight(8);
  line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);
  
  // Draw the minute ticks
 /* strokeWeight(2);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = cx + cos(angle) * secondsRadius;
    float y = cy + sin(angle) * secondsRadius;
    vertex(x, y);
  }
  endShape(); */
}


