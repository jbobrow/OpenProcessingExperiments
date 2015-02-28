
void setup() {
  size(300,300);
  colorMode(RGB,100);
  background(100);
  noStroke();
  smooth();
}

void draw() {
  fill(100,5);
  rect(0,0,300,300);
  fill(0,0,100);
  ellipse(mouseX,mouseY,50,50);
}


