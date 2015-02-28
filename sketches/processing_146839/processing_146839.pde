
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
   float w = random(60);
   fill(random(255),random(255),random(255));
   rect(x,y,w,w);
   fill(255);
   ellipse(x,y,w,w);
}
