
void setup() {
  size(400,400);
  background(255); 
  smooth();
  noStroke();
  rectMode(CENTER);
  frameRate(5);
}
 
void draw() {
  int i;
  many_rects(random(width),random(height),
  int(random(1,10)),int(random(100,200)));
}
 
void many_rects (float x, float y, int step, int d) {
  for (int i = 0; i < step; i += 1) {
  fill(random(255),random(255),random(255),
  random(255));
  rect(x,y,d-20*i,d-20*i);
 }
}
