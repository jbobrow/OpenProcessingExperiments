
int cx, cy;
float mRad, hRad, clkDiam, fadeSlow, fadeFast, ghostMinute, ghostHour, fadeFact;
Timer timer, timerHour;

void setup() {
  size(400, 400);
  smooth();
  timer = new Timer(2000);
  timer.start();
  strokeJoin(ROUND);
  int radius = min(width, height) / 2;
  mRad = radius * 0.74;
  hRad = radius * 0.54;
  clkDiam = radius * 1.8;
  cx = width / 2;
  cy = height / 2;
}

void draw() {
  int timerNow=timer.getTime()/2;
  float minuteHand = map(timerNow, 0, 1000, 270+(minute()*6)+(second()/10), -90+(minute()*6)+(second()/10));
  float hourHand = map(timerNow, 0, 1000, -90+(hour()*30)+(minute()/2), 270+(hour()*30)+(minute()/2));
  if (timerNow==0) {
    fadeSlow = 1;
    fadeFact = 0.4;
    ghostMinute=minuteHand;
    ghostHour=hourHand;
  }
  if (fadeSlow > 0) {
    fadeSlow=constrain(fadeSlow-=0.03,0,1);
    fadeFact=constrain(fadeFact-=0.09,0.02,1);
  }

  background(0);
  fill(20);
  noStroke();
  strokeWeight(2);
  ellipse(cx, cy, clkDiam, clkDiam);
  stroke(120,240,240);
  noFill();
  ellipse(cx, cy, clkDiam*0.97, clkDiam*0.97);
  stroke(100,130,130);
  strokeWeight(4);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float x = cx + cos(radians(a)) * clkDiam * 0.45;
    float y = cy + sin(radians(a)) * clkDiam * 0.45;
    vertex(x, y);
  }
  stroke(120,180,180);
  strokeWeight(8);
  for (int a = 0; a < 360; a+=30) {
    float x = cx + cos(radians(a)) * clkDiam * 0.45;
    float y = cy + sin(radians(a)) * clkDiam * 0.45;
    vertex(x, y);
  }
  endShape();
  strokeWeight(6);
  if (fadeSlow>0) {
    stroke(20+(100*fadeSlow),20+(220*fadeSlow),20+(220*fadeSlow));
    line(cx, cy, cx + cos(radians(ghostMinute)) * mRad, cy + sin(radians(ghostMinute)) * mRad);
    line(cx, cy, cx + cos(radians(ghostHour)) * hRad, cy + sin(radians(ghostHour)) * hRad);
  }
  stroke(70);
  line(cx, cy, cx + cos(radians(minuteHand)) * mRad, cy + sin(radians(minuteHand)) * mRad);
  line(cx, cy, cx + cos(radians(hourHand)) * hRad, cy + sin(radians(hourHand)) * hRad);
}

class Timer {
  int savedTime;
  int totalTime;

  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }

  void start() {
    savedTime = millis();
  }

  int getTime() {
    int passedTime = millis() - savedTime;
    if (passedTime > totalTime) {
      savedTime = millis();
      passedTime = (millis() - savedTime);
    }
    return passedTime;
  }
}
