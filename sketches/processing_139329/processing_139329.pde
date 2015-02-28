
float x = width/2;
float y = height/2;

void setup() {
    size(500, 500);
    smooth();
    
 }
 
 void draw_rect(x, y, int size, float speed) {
   x += random(-speed, speed);
   y += random(-speed, speed);
   rect(x, y, size, size);
 }
 
void draw() {
  if (mousePressed) {
    speed = 0; }
   else {speed = 5; }
    background(0);
    
   fill(200, 20, 100, 100);
   draw_rect(x, y, 100, 1);
   fill(20, 200, 100, 150);
   draw_rect(x, y, 100, 5);
}
