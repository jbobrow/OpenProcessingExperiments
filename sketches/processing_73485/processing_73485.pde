
PFont font;
int x;
int y;
float seconds;
float seconds1;
float seconds2;

int time;
int lastTime = 0;

void setup() {
  size(500, 500);
  background(0);
  int radius = min(width, height) / 2;
  seconds = radius * 0.72;
  seconds1 = radius * 1.0;
  x = width / 2;
  y = height / 2;
  time = 0;
  lastTime = 0;
  font = loadFont("CourierNewPSMT-48.vlw");
}

void timer() {
  noStroke();
  fill(0);
  rect(0, 0, 500, 35);
  fill(255);
  textFont(font, 30);
  textAlign(CENTER);
  text((time-lastTime)/1000, 250, 25);
}
void draw() {
  time = millis();
  int timec = (time - lastTime);
  println(time - lastTime);

  strokeWeight(4);
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  stroke(timec/100, timec/200, timec/300);
  line(x, y, (x+100) + cos(s) * seconds1, (y+100) + sin(s) * seconds1);

  strokeWeight(3);
  float s1 = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  stroke(timec/100, timec/300, timec/200);
  line(x, y, (x-100) + cos(s) * seconds1, (y-100) + sin(s) * seconds1);

  strokeWeight(1);
  float s2 = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  stroke(timec/300, timec/100, timec/200);
  line(x, y, (x-100) + cos(s) * seconds, (y+100) + sin(s) * seconds);

  strokeWeight(2);
  float s3 = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  stroke(timec/200, timec/300, timec/100);
  line(x, y, (x+100) + cos(s) * seconds, (y-100) + sin(s) * seconds);

  timer();
}

void mousePressed() {
  lastTime = time;
  background(0);
}


