
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
PFont font;

void setup() {
  size(640, 360);
  stroke(255);
  
  int radius = min(width, height) / 2;
  secondsRadius = radius * 0.72;
  minutesRadius = radius * 0.60;
  hoursRadius = radius * 0.25;
  clockDiameter = radius * 1.8;
  img = loadImage("apple.jpg");
  font = loadFont("AppleGothic-48.vlw");
  
  cx = width / 2;
  cy = height / 2;
}

void draw() {
  background(255);
  
  //draw image
  image(img, width/2-120, height/2-140);
  
  // Draw the clock background
  fill(80);
  noStroke();
  //ellipse(cx, cy, clockDiameter, clockDiameter);
  
  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  
  // Draw the hands of the clock
  stroke(0, 0, 0);
  strokeWeight(1);
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
  strokeWeight(2);
  line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
  strokeWeight(5);
  line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);
  //draw numbers
  textFont (font, 32);
  //text("1", width/2-20, 30);
  //text("2", width/2-20, 30);
  text("3", width/2+140, height/2+10);
  //text("4", width/2-20, 30);
  //text("5", width/2-20, 30);
  text("6", width/2-10, 340);
  //text("7", width/2-20, 30);
  //text("8", width/2-20, 30);
  text("9", width/2-160, height/2+10);
  //text("10", width/2-20, 30);
  //text("11", width/2-20, 30);
  text("12", width/2-20, 40);
  
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
}


