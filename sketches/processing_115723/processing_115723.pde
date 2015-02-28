
//praticeProcessing B,by chen, wu-zhi

void setup() {
  background(255);
  size(790, 790);
}
void draw() {
  drawRectangle();
  drawBlackLine();
  drawOneStar();
}
void drawBlackLine() {
  stroke(0);
  strokeWeight(12);
  line(358, 0, 358, 790);
  line(0, 332, 790, 332);
  line(0, 518, 790, 518);
  line(81, 518, 81, 790);
  line(600, 518, 600, 790);
  line(358, 754, 600, 754);
}
void drawRectangle() {
   stroke(0);
  strokeWeight(12);
  fill();
  rect(0, 0, 790, 790);
  strokeWeight(0);
  fill(200, 0, 0);
  rect(0, 0, 358, 332);
  strokeWeight(0);
  fill(200, 200, 0);
  rect(0, 518, 81, 272);
  strokeWeight(0);
  fill(0, 0, 150);
  rect(358, 518, 242, 236);
}

void drawOneStar() {
  int s=0.5*  second();
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(PI/30*s);
  stroke(150, 150, 150);
  strokeWeight(3);
  line(mouseX-482, mouseY-460, mouseX-614, mouseY-627);
  line(mouseX-539, mouseY-470, mouseX-542, mouseY-608);
  line(mouseX-599, mouseY-472, mouseX-460, mouseY-606);
  line(mouseX-602, mouseY-528, mouseX-459, mouseY-540);
  popMatrix();
}




