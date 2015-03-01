
int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;

float stroke1=255;
int stroke2=150;
int stroke3=11;

int counter;

float s = 0;

void setup() {
  size(500, 500);

  background(0);

  int radius = min(width, height) / 2;
  secondsRadius = radius * 0.72;
  minutesRadius = radius * 0.60;
  hoursRadius = radius * 0.50;

  cx = width / 2;
  cy = height / 2;

}

void draw() {
  
  frameRate(200);
  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  // float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;


  // Draw the hands of the clock
  stroke(stroke1);
  strokeWeight(1);
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);

  stroke1-=0.1;
  if (stroke1 <= 10) {
    stroke1 = 255;
  }
  
  stroke(stroke2);
  strokeWeight(2);
  line(cx, cy, cx + cos(s) * minutesRadius, cy + sin(s) * minutesRadius);
  stroke2--;
  if (stroke2 <=10 ) {
    stroke2 = 255;
  }
  
  stroke(stroke3);
  strokeWeight(4);
  line(cx, cy, cx + cos(s) * hoursRadius, cy + sin(s) * hoursRadius);
  stroke3--;
  if (stroke3 <= 10) {
    stroke3 = 255;
  }
  s++;
  

}

void mousePressed() {
  saveFrame("####.png");
}



