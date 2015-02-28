
//varible of mouse and transparency
//Stella Wang, tainan

void setup() {
  size(500, 250);
  smooth();
  background(60);
}

void draw() {
  if (mousePressed) {
    noStroke();
    fill(220, mouseY/40);
  } 
  else {
    noStroke();
    fill(100, mouseX/10);
  }
  ellipse(mouseX, mouseY, mouseX-mouseY, mouseX-mouseY);
}
void keyPressed() {
  saveFrame("frame####.png");
}

