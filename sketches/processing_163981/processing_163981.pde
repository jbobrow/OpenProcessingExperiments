
float r=0;
float theta=0;
int x=0;
int y=0;
int diff;
int time;
int startSTime;
int startMTime;
int spins=6;
int sH=0, sS=80, sB=80;
int mH=0, mS=80, mB=80;

void setup() {
  size (1000, 1000);
  background(0);
  diff=millis();
  frameRate(1000);
  rectMode(CENTER);
  textAlign(CENTER);
  colorMode(HSB, 360, 100, 100);
  startTime=second()*1000;
  startMTime=minute()*1000*60;
}
void draw() {
  drawSecondsSpiral();
  drawMinutesSpiral();
}

void drawSecondsSpiral() {
  int cx=250;
  int cy=250;
  time=startSTime+millis()-diff;
  time=time%60000;
  r=map(time, 0, 60000, 50, 250);
  theta=map (time, 0, 60000, 0, 360*spins);
  x=int(r*cos(radians(theta)));
  y=int(r*sin(radians(theta)));
  if (time%1000>900) {
    stroke(0);
    sH=(int)map(time, 0, 60000, 0, 360);
  } else {
    stroke(sH, sS, sB);
  }
  line(cx+x-10, cy-y, cx+x, cy-y);

  fill(0);
  noStroke();
  if (second()==0) {
    rect(cx,cy,512,500);
  }
  rect(cx, cy, 20, 20);
  fill(255);
  text(second(), cx, cy);
  
}


void drawMinutesSpiral() {
  int cx=width-250;
  int cy=250;
  time=startMTime+millis()-diff;
  time=time%60000;
  r=map(time, 0, 60000*60, 250, 50);
  theta=map (time, 0, 60000*60,360*spins,0);
  x=int(r*cos(radians(theta)));
  y=int(r*sin(radians(theta)));
  
  if (time%1000*60>900*60) {
    stroke(0);
    mH=(int)map(time, 0, 60000*60, 0, 360);
  } else {
    stroke(mH, mS, mB);
  }
  line(cx-x+25, cy+y, cx-x, cy+y);

  fill(0);
  noStroke();
  if (minute()==0) {
    rect(cx,cy,500,500);
  }
  rect(cx, cy, 20, 20);
  fill(255);
  text(minute(), cx, cy);
  
}



