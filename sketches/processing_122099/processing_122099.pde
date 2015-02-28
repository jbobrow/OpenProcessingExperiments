
int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;

void setup() {
  size(640, 360);
  stroke(37,69,102);
  
  int radius = min(width, height) / 2;
  secondsRadius = radius * 0.72;
  minutesRadius = radius * 0.60;
  hoursRadius = radius * 0.50;
  clockDiameter = radius * 1.8;
  
  cx = width / 2;
  cy = height / 2;
}

void draw() {
  background(202,74,37);
  
  //Drawing the Clocks Background BOOM BOOM SHAKE THE ROOM
fill(0,0,78);
noStroke();
ellipse(cx, cy, clockDiameter, clockDiameter);

//Angles for sin & cos start at 3 o'clock;
//Subtract half_pi to make them start at the top
float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;

//Now for Drawing the Hands of the Clock BABABOOOM
stroke(43,178,0);
strokeWeight(1);
line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
strokeWeight(2);
line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
strokeWeight(4);
line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);

//the final stage. Drawing the minute ticks.
strokeWeight(2);
beginShape (POINTS);
for (int a = 0; a < 360; a+=6) {
  float angle = radians(a);
  float x = cx + cos(angle) * secondsRadius;
  float y = cy + sin(angle) * secondsRadius;
  vertex(x, y);
}
endShape();
}
