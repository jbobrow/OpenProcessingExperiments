
int cx;
int cy;
float secondsR;
float minutesR;
float hoursR;
float clockD;
float lastTime;
float count = 1000;
boolean change = false;


void setup() {
  size (500, 500);

  int radius = width/2;
  secondsR = radius *0.70;
  minutesR = radius * 0.65;
  hoursR = radius * 0.40;
  clockD = radius * 1.7;

  cx = width/2;
  cy = height/2;
}

void draw() {
  background(100);

  //clock background
  fill(0);
  noStroke();
  ellipse(cx, cy, clockD, clockD);

  float s = map(millis(), 0, 60000, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;

  //seconds hand
  stroke(255, 255, 0);
  strokeWeight(1);
  line(cx, cy, cx + cos(s) * secondsR, cy + sin(s) * secondsR);
  //minutes hand
  stroke(255, 0, 255);
  strokeWeight(2);
  line(cx, cy, cx + cos(m) * minutesR, cy + sin(m) * minutesR);
  //hours hand
  stroke(0, 255, 255);
  strokeWeight(4);
  line(cx, cy, cx + cos(h) * hoursR, cy + sin(h) * hoursR);


  //minute and second marks
  stroke(150);
  strokeWeight(2);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = cx + cos(angle) * secondsR;
    float y = cy + sin(angle) * secondsR;
    vertex(x, y);
  }
  endShape();

  //hour marks
    if (change) {
    stroke(255);
  } else stroke(255,255,0);

  if (millis() > lastTime + count) {
    change = !change;
    lastTime = millis();
  }
  
  strokeWeight(4);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=30) {
    float angle = radians(a);
    float x = cx + cos(angle) * secondsR;
    float y = cy + sin(angle) * secondsR;
    vertex(x, y);
  }
  endShape();
}



