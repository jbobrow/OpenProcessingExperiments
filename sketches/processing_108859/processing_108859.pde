
float mapnum = 0;
float skin = 0;

void setup() {
  size(1200, 800);
  smooth();
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  //background(mapnum, 100, 100);
  noStroke();

  if (mouseY < height/2) {
    fill(200, 10, 100);
  }
  else if (mouseY > height/2 && mouseY < height/2 + 100) {
    fill(120, 10, 100);
  }
  else {
    fill(50, 10, 100);
  }

  mapnum = map(mouseX, 0, width, 0, 100);
  skin = map(mouseX, 0, height, 0, 180);

  ellipseMode(CENTER);
  ellipse(mouseX, mouseY, 100, 100);
}
