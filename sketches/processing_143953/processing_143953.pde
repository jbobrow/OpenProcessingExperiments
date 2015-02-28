
// hw 2/6/14
// mouse interaction
// keyboard interaction

void setup() {
  size(400,400);
  background(255);
}

void draw() {
  translate(200,200);
  noStroke();
  smooth();
  fill(mouseY,mouseX,mouseX);
  rect(mouseX - 200,mouseY - 200,10+mouseX,10+mouseY);
}

void keyPressed() {
  rect(10+mouseX/2,10+mouseY/2,random(-200,200),random(-200,200));
}


