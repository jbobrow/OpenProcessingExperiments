
void setup() {
size(500, 500);
noStroke();
}
void draw() {
background(0);
noStroke();
float s = map(second(), 0, 60, 0, 500);
float m = map(minute(), 0, 60, 0, 500);
float h = map(hour(), 0, 24, 0, 500);
fill(250,120,120,100);
rect(s, s, s, s);
fill(120,250,120,75);
rect(m, m, m, m);
fill(120,120,250,175);
rect(h,h,h,h);
for(int i=0;i<=60;i++){
  int tick = int(map(i,0,60,0,500));
  stroke(255,50);
  line(tick,0,tick,500);
  line(0,tick,500,tick);
}
}


