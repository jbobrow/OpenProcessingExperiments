
int cx, cy;
float sTimer, mTimer, hTimer, clockSize; 



void setup() {
  size(360, 360);
  stroke(255);

  int radius= min(width, height)/2;
  cx=width/2;
  cy=height/2;
  sTimer= radius*0.72;
  mTimer= radius*0.6;
  hTimer= radius*0.5;
  clockSize= radius*1.8;
}    
void draw() {
  background(80);
  pointer();
  digital();
}
void pointer() {
  //Draw clock
  noStroke();
  fill(0);
  ellipse(cx, cy, clockSize, clockSize);
  fill(255);
  ellipse(cx, cy, clockSize/40, clockSize/40);


  float s=map(second(), 0, 60, 0, TWO_PI)-HALF_PI;
  float m=map(minute()+norm(second(), 0, 60), 0, 60, 0, TWO_PI)-HALF_PI;
  float h=map(hour()+norm(minute(), 0, 60), 0, 24, 0, TWO_PI*2)-HALF_PI;

  stroke(255);
  strokeWeight(1);
  line(cx, cy, cx+cos(s)*sTimer, cy+sin(s)*sTimer);

  strokeWeight(2);
  line(cx, cy, cx+cos(m)*mTimer, cy+sin(m)*mTimer);

  strokeWeight(3);
  line(cx, cy, cx+cos(h)*hTimer, cy+sin(h)*hTimer);

  strokeWeight(2);
  beginShape(POINTS);
  for (int j=0; j<360; j+=6) {
    float angle=radians(j);
    float x=cx+cos(angle)*sTimer;
    float y=cy+sin(angle)*sTimer;
    vertex(x, y);
  }
  endShape();
  strokeWeight(5);
  beginShape(POINTS);
  for (int i=0; i<360; i+=30) {
    float angle=radians(i);
    float x=cx+cos(angle)*sTimer;
    float y=cy+sin(angle)*sTimer;
    vertex(x, y);
  }


  endShape();
}
void digital() {

 


  int d = day();
  int m = month();

  String s=String.valueOf(d);
  text(s, width*3/4, height/2);
  s = String.valueOf(m);
  text(s, width*7/10, height/2);
  for (int a=250; a<286; a+=18) {
    noFill();
    strokeWeight(1);
    rect(a, 166, 18, 18);
  }
}




