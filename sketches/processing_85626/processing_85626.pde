
float t = 20;
void setup() { 
  size(800, 800);
  noFill();
  smooth();
  frameRate(200);
}
void draw() {
  stroke(20*(sin(t)*PI), t/3);
  ellipse(400+sin(t) * t/10,400+ cos(t) * t/10, t*2, t*2);
  t += 0.1;
  if(t>1200) {
    t=0;
  }
}
