
void setup() {
  size(400,400);
  background(255); 
  rectMode(CENTER);
  ellipseMode(CENTER);
  smooth();
  frameRate(5);
}
 
void draw() {
   rect_circle(random(width),random(height));
}
 
void rect_circle (float x, float y) {
   fill(0);
   rect(x,y,100,100);
   fill(255);
   ellipse(x,y,100,100);
}
