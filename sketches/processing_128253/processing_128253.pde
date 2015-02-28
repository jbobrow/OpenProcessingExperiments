
//Programmieren Sie einen neuen Pinsel.

void setup() {
  size(500,445);
  background(0);
  noStroke();
}

void draw() {

  fill(random(0,200), random(0,200), random(0,200));
  triangle(mouseX, mouseY, 70, 70, 80,80);
}
