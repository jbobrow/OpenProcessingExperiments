
int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;

void setup() {
  size(800, 600);
  //background(255);
  stroke(255);
  smooth();

  
  int radius =height / 4;
  secondsRadius = radius * 1.72;
  minutesRadius = radius * 0.60;
  hoursRadius = radius * 0.50;
  clockDiameter = radius * 2.8;
  
  cx = width / 2;
  cy = height / 2;
  point(20,20); 
  frameRate(30);
 
}

void draw() {
  
  fill(255,5);
 rect(0,0,width,height);
  
  // Draw the clock background
  fill(200);
  noStroke();
  ellipse(cx, cy, clockDiameter, clockDiameter);
  fill(80);
  ellipse(cx, cy, clockDiameter/3, clockDiameter/3);
  
  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  
  // Draw the hands of the clock
  stroke(0);
  strokeWeight(1);
  line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
  strokeWeight(4);
  line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);
  
   strokeWeight(0);
  noStroke();
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius); 
  
  noStroke();
   fill(220,100,120);
    ellipse(cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius,27,27);
  
  
  
   //Draw the minute ticks
  //strokeWeight(11);
  //beginShape(POINTS);
 
  //for (int a = 0; a < 360; a+=6) {
    //float angle = radians(a);
    //float x = cx + cos(angle) * secondsRadius;
    //float y = cy + sin(angle) * secondsRadius;
    //vertex(x, y);
  //}
  //endShape();
}

//-----

// A simple Particle class




