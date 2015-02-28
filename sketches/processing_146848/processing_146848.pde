
void setup() {
  size(400,400);
  background(255); 
  smooth();
  frameRate(5);
}
 
void draw() {
  int i;
  circles(random(width),random(height),
  int(random(1,5)));
}
 
void circles (float x, float y, int step) {
  for (int i = 0; i < step; i += 1) {
  fill(random(255),random(255),random(255));
  ellipse(x,y,100-20*i,100-20*i);
 }
}
