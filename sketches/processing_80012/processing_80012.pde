
PImage img;
PImage blurimg;

void setup() {
  size(600, 406);
  background(0);
  smooth();
  noCursor();

  img = loadImage("img.jpg");

  blurimg = loadImage("img.jpg");
  image(blurimg, 0, 0);
  blurimg.filter(BLUR, 6);
}

void draw() {

  blurimg.loadPixels();
  img.loadPixels();
  loadPixels();

  for (int x = 0; x < width; x++)
  {
    for (int y = 0; y < height; y++ )
    {
      int loc = x + y*width;
      float distance = dist(x, y, mouseX, mouseY);
      float fo = constrain(1.2*(200-distance)/200, 0, 1);

      float r = fo*red(img.pixels[loc])+(1-fo)*red(blurimg.pixels[loc]);
      float g = fo*green(img.pixels[loc])+(1-fo)*green(blurimg.pixels[loc]);
      float b = fo*blue(img.pixels[loc])+(1-fo)*blue(blurimg.pixels[loc]);

      pixels[loc] = color(r, g, b);
    }
  }
  updatePixels();
}


