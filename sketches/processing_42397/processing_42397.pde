
PImage b;

void setup() {
  size(450, 338);
  smooth();
}

void draw(){
  b = loadImage("fotoArticolo_2596.jpg");
  image(b, 0, 0);
  filter(BLUR, 3);
}

