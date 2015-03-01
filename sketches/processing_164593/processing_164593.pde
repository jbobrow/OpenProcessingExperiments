
PImage p0, p1;

void setup() {
  size(990, 390);

  p0 = loadImage("Adventure Face.png");
  p1 = loadImage("Adventure eyes.png");

}

void draw() {

  loadPixels();  
  image(p1, mouseX, mouseY);
  p0.loadPixels(); 
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y*width;
      float r = red(p0.pixels[loc]);
      float g = green(p0.pixels[loc]);
      float b = blue(p0.pixels[loc]);
      p0.pixels[0] = color(255,90,0);
      pixels[loc] =  color(r+20,g,b+50);          
    }
  }
  updatePixels();
}


