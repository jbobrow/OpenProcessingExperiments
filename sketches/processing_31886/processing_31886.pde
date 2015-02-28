
void setup() { //this code was from Casey Reas Getting Started tutorial on the Processing.org
  size(480, 480);
  smooth();
  println("I am so tired");
  println("but it will only get worse");
  println("so I drink coffee");
}

void draw() {
  if (mousePressed) {
    fill(0);
  } else {
    fill(3,255,160);
  }
  ellipse(mouseX, mouseY, 80, 80);
}

