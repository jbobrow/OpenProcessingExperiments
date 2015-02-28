
void setup() {
  size(400,400);
  background(255); 
  rectMode(CENTER);
  ellipseMode(CENTER);
  smooth();
  frameRate(5);
}
 
void draw() {
  rect_circle(random(2));
}
 
void rect_circle (float z) {
   if (z > 1) {rect_circle_1(random(width), random(height));}
     else  {rect_circle_2(random(width), random(height));}
}
 
void rect_circle_1 (float x, float y) {
   float w = random(60);
   fill(random(255),random(255),random(255));
   rect(x,y,w,w);
   fill(255);
   ellipse(x,y,w,w);
}
 
void rect_circle_2 (float x, float y) {
   float w = random(60);
   fill(255);
   rect(x,y,w,w);
   fill(random(255),random(255),random(255));
   ellipse(x,y,w,w);
}
