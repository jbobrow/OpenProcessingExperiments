
void setup() {
  size(600, 600);
  colorMode(RGB);
  background(150);
  smooth();
}

void draw() {
  stroke(abs(mouseX-mouseY),abs(mouseX-mouseY),abs(mouseX-mouseY));
  line(mouseX,mouseY,pmouseX,pmouseY);
}

void mousePressed() {
  stroke(0);
  fill(0,0,mouseX,mouseY);
  ellipse(mouseX,mouseY,50,50);
  fill(mouseX,mouseX,0,abs(mouseX-mouseY));
  ellipse(mouseX,mouseY,30,30);
  fill(mouseX,0,0,mouseX);
  ellipse(mouseX,mouseY,10,10);
}

void keyPressed() {
  background(150);
}


