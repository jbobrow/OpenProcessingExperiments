
PImage img;
    int point = 16;
    void setup() {
      size(341, 325);
      img = loadImage("Eric.jpg");
      background(0);
}
    void draw() {
      // Pick a random point
      int x = int(random(img.width));
      int y = int(random(img.height));
      int loc = x + y * img.width;
      // Look up the RGB color in the source image
      img.loadPixels();
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      noStroke();
      fill(r, g, b);
      ellipse(x, y, point, point);
}


