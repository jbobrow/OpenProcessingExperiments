
void setup() {
  size(480, 480);
  colorMode(HSB);
  loadPixels();
}

void draw() {
  for (int xPix = 0;  xPix < width;  xPix++)
  {
    float x = xPix*0.02;
    float s1 = sin(x);

    for (int yPix = 0;  yPix < height;  yPix++)
    {
      float y = yPix*0.02;
      float s2 = sin(y);
      float s3 = sin((x+y + frameCount*0.1) / 2);

      float s = (s1 + s2 + s3) / 3;

      float c = s * 128 + 128;
      pixels[xPix+yPix*width] = color(c, 255-c, 255);
    }
  }   
  updatePixels();
}
