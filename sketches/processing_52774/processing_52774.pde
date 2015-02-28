
void setup() {
  size(1200, 1200);
  background(242,2,119);
}


void draw() {
  beginShape();
  noFill();
  stroke(45, 240, 188);
  vertex(random(200)-mouseX, 100-mouseY);
  vertex(mouseX+500, mouseY+900);
  vertex (mouseX+200, mouseY-200);
  vertex (mouseY+200, mouseX-200);
  vertex(mouseX, mouseY-600);
  vertex(mouseY, mouseX-600);
  endShape();
  if (mouseX<700 && mouseY <270) {
    beginShape();
    vertex(mouseX, mouseY);
    vertex(mouseX+280, mouseY-130);
    vertex(mouseX-110, mouseY-250);
    endShape();
  }
}

void mouseReleased(){
 background(89,242,2); 
   beginShape();
  noFill();
  stroke(0);
   vertex(random(200)-mouseX, 100-mouseY);
  vertex(mouseX+500, mouseY+900);
  vertex (mouseX+200, mouseY-200);
  vertex (mouseY+200, mouseX-200);
  vertex(mouseX, mouseY-600);
  vertex(mouseY, mouseX-600);
  endShape();
  if (mouseX<700 && mouseY <270) {
    beginShape();
    vertex(mouseX, mouseY);
    vertex(mouseX+280, mouseY-130);
    vertex(mouseX-110, mouseY-250);
    endShape();
}
}

