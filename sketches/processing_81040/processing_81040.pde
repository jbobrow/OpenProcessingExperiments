
PImage miImagen;

void setup() {
  size(400, 800);
}

void draw() {
  miImagen = loadImage("Lenna.jpg");
  image(miImagen, 0, 0);
  loadPixels();
  
  for(int i = 0; i < 160000; i++) {
    pixels[319999-i] = pixels[i];
  }
  
  for(int i = 1; i < 160000; i+=2) {
    pixels[i] = color(0,0,255);
  }
  
  updatePixels();
}

