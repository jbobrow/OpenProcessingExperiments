
float px=1;
void setup () {
  size(600, 600);
}
void draw() {
if (mouseY<300) {
    background(255,300, 0);  
  }
 if (mousePressed) {
    px = px+5;
  }
    ellipse(px, 300, 30, 30);
}
