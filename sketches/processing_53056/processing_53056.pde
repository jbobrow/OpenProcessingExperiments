
void setup() {
  size(600,600);
}
void draw() {
  background(255,255,149);
  for (float i=1; i<width; i+=5) {
    stroke(255,255,149);
    fill(36,215,237);
    rect(i, 0, i, i);
    float x=mouseX;
    float xpos=(i/5.0)*x;
    fill(255,255,149);
    rect(x,0,5,x+5); }
 }

