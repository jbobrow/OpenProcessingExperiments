
//Programmieren Sie einen neuen Pinsel.

void setup() {
  size(500,445);
  background(0);
  noStroke();
}

void draw() {

  fill(random(0,255),random(0,255),random(0,255));
  ellipse(mouseX, mouseY, 70, 70);
}
