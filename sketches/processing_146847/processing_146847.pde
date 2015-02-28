
void setup() {
  size(400,400);
  background(255); 
  smooth();
  frameRate(5);
}
 
void draw() {
  circles(random(width),random(height));
}
 
void circles (float x, float y) {
  for (int i = 0; i < 5; i += 1) {
  fill(random(255),random(255),random(255));
  ellipse(x,y,100-20*i,100-20*i);
 }
}
