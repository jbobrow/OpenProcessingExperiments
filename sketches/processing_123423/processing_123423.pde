
PImage poem;
 
void setup() {
  size(400, 400);
  poem = loadImage("poem.jpg");

}
 
void draw() {
  loadPixels();
  poem.loadPixels();
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y * width;
      float r = red(poem.pixels[loc]);
      float g = green(poem.pixels[loc]);
      float b = blue(poem.pixels[loc]);
      float distance = dist(x, y, mouseX, mouseY);
      float brightness = (100 - distance) / 100;
      r = constrain(r * brightness, 0, 255);
      g = constrain(g * brightness, 0, 255);
      b = constrain(b * brightness, 0, 255);
      pixels[loc] = color(r, g, b);
    }
  }
  updatePixels();
}



