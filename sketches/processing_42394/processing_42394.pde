
PImage b;

void setup() {
  size(450, 338);
}

void draw() {

  b = loadImage("fotoArticolo_2596.jpg");

  //image coordinates
  image(b, 0, 0);

  //get
  color cp = get(mouseX, mouseY);
  fill(cp);
  noStroke();
  rect(20, 20, 55, 55);
}


