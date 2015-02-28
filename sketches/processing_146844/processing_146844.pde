
void setup() {
  size(400,400);
  background(255); 
  //rectMode(CENTER);
}
 
void draw() {
  five_rects(random(width),random(height));
}
 
void five_rects (float x, float y) {
  for (int i = 0; i < 5; i += 1) {
  if ((i % 2) == 1) {fill(255);} else {fill(0);}
   rect(x,y,100-20*i,100-20*i);
 }
}
