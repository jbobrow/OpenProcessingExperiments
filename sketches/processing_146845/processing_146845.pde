
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
  if ((i % 2) == 1) {fill(255);} else {fill(0);}
  ellipse(x,y,100-20*i,100-20*i);
 }
}
