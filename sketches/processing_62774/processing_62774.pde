
int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;
int x, y;
int position = 160;
float text;

void setup() {
  background(0);
  size(500, 500);
  stroke(255);
  smooth();
  
  int radius = min(width, height) / 2;
  secondsRadius = radius * 0.72;
  minutesRadius = radius * 0.60;
  hoursRadius = radius * 0.50;
  clockDiameter = radius * 1.8;
  
  cx = width / 2;
  cy = height / 2;
}

void draw() {
   fill(0,0,0);
 noStroke();
fill(50,50,50);
 


 fill(220,0,0);
 rect(170,100,150,250);
fill(117,100,0);
 ellipse(250,250,20,50);
 fill(50,50,50);
fill(215,751,60);  
triangle(200,350,250,250,220,350);


  
  
  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  float s = map(second(), 0, 20, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  
  // Draw the hands of the clock
  stroke(0,0,0);
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
  line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
  strokeWeight(6);
  line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);
  
  // Draw the minute ticks
  strokeWeight(1);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float x = cx + cos(radians(a)) * secondsRadius;
    float y = cy + sin(radians(a)) * secondsRadius;
    vertex(x, y);
    ellipse(250,250,10,10);
    float text;
 
    PFont font;

 
  }
  endShape();
}

