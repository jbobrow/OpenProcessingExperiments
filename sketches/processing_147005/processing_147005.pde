
void setup() {
  size(800, 300); 
}

void randomBackground() {
 loadPixels();
 for (int i = 0; i < pixels.length; i++) {
  float rand_red = random(255);
  float rand_green = random(255);
  float rand_blue = random(255);
  color c = color(rand_red, rand_green, rand_blue);
  pixels[i] = c;
 } 
 updatePixels();
}
// When we are finished dealing with pixels

void draw() {
 randomBackground(); 
}

