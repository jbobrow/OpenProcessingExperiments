
int x = 80;
int y = 30;
int w = 80;
int h = 60;
void setup() {
 size(240, 120); 
}
void draw() {
 background(254, 216, 255); 
 if ((mouseX > x) && (mouseX < x+w) && 
 (mouseY > y) && (mouseY < y+h)) {
 fill(171, 90, 240); 
 } else {
 fill(24, 118, 198); 
 }
 rect(x, y, w, h);
}
