
PImage img;
void setup() {
  img = loadImage("flowr3.jpg");
  size(500,404);
  image(img, 0, 0);
}
void draw() {
  image(img,0,0);
  loadPixels();
  int change = 0;
  if (keyPressed) {
    if (key == 'r' || key == 'R') {
      change = 1;
    }
    if (key == 'g' || key == 'G') {
      change = 2;
    }
    if (key == 'b' || key == 'B') {
      change = 3;
    }
  }


    for (int i = 0; i < pixels.length; i++) {
      float r = red (img.pixels[i]);
      float g = green (img.pixels[i]);
      float b = blue (img.pixels[i]);
      if (change == 1) {
        r = 255;
      }
      if (change == 2) {
        g = 255;
      }
      if (change == 3) {
        b = 255;
      }      
      color c = color(r, g, b);
      pixels[i] = c;
  }    
    updatePixels();

}


