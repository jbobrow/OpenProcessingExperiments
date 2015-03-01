
float r=0;
float theta=0;
int x=0;
int y=0;
int diff;
int time;
int startSTime;
int startMTime;
int spins=10;
int sH=0, sS=80, sB=80;
int mH=0, mS=80, mB=80;
int lastMinute=0;
int mod;
int bars;
int xShift=200;
int yShift=300;
int x0,x1,y1,y0;

void setup() {
  size (1000, 700);
  background(0);
  diff=millis();
  frameRate(1000);
  rectMode(CENTER);
  textAlign(CENTER);
  colorMode(HSB, 360, 100, 100);
  startSTime=second()*1000;
  startMTime=minute()*1000*60;
  drawhour();
}
void draw() {
  if (second()==0){
    drawhour();
  }
  drawSecondsSpiral();
  drawMinuteCurve();
}

void drawSecondsSpiral() {
  int cx=750;
  int cy=250;
  time=startSTime+millis()-diff;
  time=time%60000;
  r=map(time, 0, 60000, 50, 250);
  theta=map (time, 0, 60000, 0, 360*spins);
  x=int(r*cos(radians(theta)));
  y=int(r*sin(radians(theta)));
  if (time%1000<200) {
    noStroke();
    sH=(int)map(time, 0, 60000, 0, 360);
  } else {
    stroke(sH, sS, sB);
  }
  line(cx+x-10, cy-y, cx+x, cy-y);
  stroke(sH, sS, sB);
  fill(0);
  rect(cx, cy, 20, 20);
  fill(255);
  text(second(), cx, cy+5);
  
}


void drawMinuteCurve() {
  int lines=minute();
  if (lastMinute!=minute()){
     for (int i=0; i<=lines; i++){
       stroke(i*(360/60),75,65);
       line(0,i*height/60, i*width/60,height);
       
     }
  fill(0);
  rect(50, height-50, 20, 20);
  fill(255);
  text(minute(), 50, height-45);   
  }
}

void drawhour() {
  noStroke();
  background(0);
  bars=((hour()) % (12));
  if (bars==0)
    bars=12;
  for (int i=bars;i>=0;i--){
    fill(i*(360/12),75,25);
    x0=width/2;
    y0=height/2;
    x1=(i)*(width/12);
    y1=(i)*(height/12);
    rect(x0,y0,x1,y1);
  }
  
  rect(width/2,height/2,20,20);
  fill(0,0,100);
  text(bars, width/2-1, height/2+5);   
  
}





