
PImage img;

void setup() {
  size(800, 450);
  img = loadImage("view.jpg");

  smooth();
  noStroke();
}

void draw() {
}

void keyPressed() {
  if (keyPressed == true) {
    background(img);
  }
}

void mouseClicked() {

  color bgColor = img.get(mouseX, mouseY);
  background(bgColor);


  int dotsize = int(random(3, 30));

  for (int x = 0; x <= 800; x+=dotsize) {
    for (int y = 0; y<= 450; y+=dotsize) {

      color dotColor = img.get(x, y);
      fill(dotColor);
      Circle ( x, y, random(dotsize));
    }
  }
}
void Circle (float x, float y, float z) {
  ellipse(x, y, z, z);
}


