
int x = 50;
int y = 50;
int w = 400;
int h = 400;
 
void setup() {
  size(500, 500);
}
 
void draw() {
  background(0);
  noStroke();
  int x1 = (int)random(255);
  if (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h) {
   fill(x1,250,x1);
  } 
  else {
    fill(0);
  }
 
  rect(x1, y, w, h);
}
  void keyPressed() {
  saveFrame("test.png");
}

