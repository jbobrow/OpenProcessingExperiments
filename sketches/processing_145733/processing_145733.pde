
int brushSize = 50;
int rnd;
 
void setup() {
  size(500, 500);
  background(255);
  smooth();
}
 
void draw() {
  if (frameCount % .5 == 0) { rnd = int(random(3)); }
}
 
void mouseDragged() {
  if (rnd == 0) { brush1(); }
  if (rnd == 1) { brush2(); }
  if (rnd == 2) { brush3(); }
}
 
void keyPressed() {
  if (key == ' ') { background(255); }
}
 
void brush1() {
  fill(58,99,99);
  ellipse(mouseX, mouseY, brushSize, brushSize);
}
 
void brush2() {
  fill(243,99,99);
  ellipse(mouseX, mouseY, brushSize, brushSize);
}
 
void brush3() {
  fill(254,255,0);
  ellipse(mouseX, mouseY, brushSize, brushSize);
}
