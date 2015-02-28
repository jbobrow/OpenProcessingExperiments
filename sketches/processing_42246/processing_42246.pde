
int size = 10;


void setup() {
  size(400, 400);
  background(0);
}

void draw() {

  fill(0, 8);
  rect(0, 0, width, height);

  ellipse(mouseX, mouseY, size, size);

  if (mousePressed) {
    fill(255, 90);
    fill(mouseX, mouseY, second(), 100);
    noStroke();
    ellipse(mouseX, mouseY, size++, size++);
  } else {
    size = 10;
  }
  println(second());
}


