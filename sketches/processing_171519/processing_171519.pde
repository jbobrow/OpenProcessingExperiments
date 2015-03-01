
int orbitSpeed = 100;
int startPause = 0;
int endPause = 0;
float ang;
float orbitDuration = 10;
float x;
float y;

void setup() {

  size(800, 800);

  stroke(255);

  smooth();

}

void draw() {

  background(0);

  fill(80);

  noStroke();
calcSpeed();
  drawSun(250, (4 * 365), 2);
  
  ellipse(400, 400, 300, 300);

  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;

  float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;

  float h = map(hour() % 12, 0, 12, 0, TWO_PI) - HALF_PI;

  stroke(0);

  strokeWeight(1);

  line(400, 400, cos(s) * 160 + 400, sin(s) *160 + 400);

  strokeWeight(2);

  line(400, 400, cos(m) * 130 + 400, sin(m) * 130 + 400);

  strokeWeight(4);

  line(400, 400, cos(h) * 110 + 400, sin(h) * 110 + 400);

}

void calcSpeed() {
  if (paused) {
    orbitSpeed = orbitSpeed;
  }
  if (!paused) {
    orbitSpeed = millis() - endPause;
  }
}
  void drawSun(float orbit, float days, int c) {
  ang = TWO_PI * orbitSpeed/(days * orbitDuration);
  x = 400+ cos(ang) * 250;
  y = 400+ sin(ang) * 250;
  fill(255, 255, 255);
  ellipse(x, y, 20, 20);
  ang = TWO_PI * (orbitSpeed*2)/(days * orbitDuration);
  x = 400+ cos(ang) * 320;
  y = 400+ sin(ang) * 320;
  fill(200, 100, 150);
  ellipse(x, y, 26, 26);
  ang = TWO_PI * (orbitSpeed*3)/(days * orbitDuration);
  x = 400+ cos(ang) * 210;
  y = 400+ sin(ang) * 210;
  fill(0, 150, 255);
  ellipse(x, y, 12, 12);
  ang = TWO_PI * (orbitSpeed*2.4)/(days * orbitDuration);
  x = 400+ cos(ang) * 400;
  y = 400+ sin(ang) * 400;
  fill(0, 255, 100);
  ellipse(x, y, 33, 33);
  ang = TWO_PI * (orbitSpeed*1.3)/(days * orbitDuration);
  x = 400+ cos(ang) * 440;
  y = 400+ sin(ang) * 440;
  fill(255, 100, 50);
  ellipse(x, y, 35, 35);
  fill(255,255,0);
  
  
  
}


