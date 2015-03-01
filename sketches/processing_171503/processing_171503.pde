
int cx, cy;
float secondR;
float minuteR;
float hoursR;

void setup() {
  size(650, 350);
  stroke(255);

  int radius = min(width, height) / 2;
  secondR = radius * 0.72;
  minuteR = radius * 0.60;
  hoursR = radius * 0.50;

  cx = width / 2;
  cy = height / 2;
}

void draw() {
  background(255);
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI); 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2);
  stroke(0);
  strokeWeight(0);
  float One = 100-pow(s, 4)*3.5;
  float Two =  200-pow(s, 5)*10;
  float Three = pow(s, 6);
  if (One < 0) {
    One = 0;
  }
  if (Two < 0) {
    Two = 0;
  }
  if (Three > 150) {
    Three = 200;
  }
  float OneOne = 100-pow(s, 4)*3.5;
  float TwoOne =  200-pow(s, 5)*10;
  float ThreeOne = pow(s, 6);
  if (OneOne < 0) {
    OneOne = 0;
  }
  if (TwoOne < 0) {
    TwoOne = 0;
  }
  if (ThreeOne > 150) {
    ThreeOne = 200;
  }
  fill (One, Two, Three);
  ellipse(cx, cy, cx + cos(s) * secondR, cy + sin(s) * secondR);
  strokeWeight(2);
  rectMode(CORNERS);
  fill (Three,Two,One);
  rect(cx, cy, cx + cos(m) * minuteR, cy + sin(m) * minuteR);
  strokeWeight(4);
  line(cx, cy, cx + cos(h) * hoursR, cy + sin(h) * hoursR);
}

