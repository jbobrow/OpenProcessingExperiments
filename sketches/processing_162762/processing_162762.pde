
//click for draw thing to happen always yes

void setup() {
  size(600, 500);
  background(255);
}

void draw() {
  if (mousePressed== true) {
    building(mouseX, mouseY);
  }
}

void building(int x, int y) {
  fill(50);
  rect(x-80, height-250, 160, height);
  fill(255);
  window(x-40, height-210);
  window(x+40,height-210);

}


void window(int x, int y) {

  rect(x, height-220, 30, 30);
  rect(x-30, height-190, 30, 30);
  rect(x-30, height-220, 30, 30);
  rect(x, height-190, 30, 30);
}


void keyPressed() {
  if (key==' ') {
    background(255);
  }
}

