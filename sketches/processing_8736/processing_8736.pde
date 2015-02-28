
Scrollbar bar1, bar2, bar3;
PFont font;
int pos1;
int pos2;
int pos3;

void setup() {
  size(230, 135);
  noStroke();
// Inputs: x, y, width, height, minVal, maxVal
  bar1 = new Scrollbar(10, 35, 80, 10, 0.0, 256.0);
  bar2 = new Scrollbar(10, 75, 80, 10, 0.0, 256.0);
  bar3 = new Scrollbar(10, 115, 80, 10, 0.0, 256.0);
  font = loadFont("Courier-30.vlw");
  textFont(font);
  textAlign(CENTER);
}

void draw() {
  background(128);
  fill(0);
  stroke(0);
  pos1 = int(bar1.getPos());
  text(nf(pos1, 1), 65, 30);
  text("R", 20, 30);
  pos2 = int(bar2.getPos());
  text(nf(pos2, 1), 65, 70);
  text("G", 20, 70);
  pos3 = int(bar3.getPos());
  text(nf(pos3, 1), 65, 110);
  text("B", 20, 110);
  bar1.update(mouseX, mouseY);
  bar2.update(mouseX, mouseY);
  bar3.update(mouseX, mouseY);
  bar1.display();
  bar2.display();
  bar3.display();
  fill(pos1,pos2,pos3);
  rect(100, 10, 115, 115);
}

void mousePressed() {
  bar1.press(mouseX, mouseY);
  bar2.press(mouseX, mouseY);
  bar3.press(mouseX, mouseY);
}

void mouseReleased() {
  bar1.release();
  bar2.release();
  bar3.release();
}

