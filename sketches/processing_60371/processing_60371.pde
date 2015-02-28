
int pixelSize=2;
PGraphics pg;

void setup() {
  size(650, 525);
  // Create buffered image for plasma effect
  pg = createGraphics(160, 90, P2D);
  colorMode(HSB);
  noSmooth();

  frameRate(5000);
}

void draw()
{
  float  xc = 25;

  // Enable this to control the speed of animation regardless of CPU power
  // int timeDisplacement = millis()/30;

  // This runs plasma as fast as your computer can handle
  int timeDisplacement = frameCount;

  // No need to do this math for every pixel
  float calculation1 = sin( radians(timeDisplacement * 0.61655617));
  float calculation2 = sin( radians(timeDisplacement * -3.6352262));

  // Output into a buffered image for reuse
  pg.beginDraw();
  pg.loadPixels();

  // Plasma algorithm
  for (int x = 0; x < pg.width; x++, xc += pixelSize)
  {
    float  yc    = 25;
    float s1 = 128 + 128 * sin(radians(xc) * calculation1 );

    for (int y = 0; y < pg.height; y++, yc += pixelSize)
    {
      float s2 = 128 + 128 * sin(radians(yc) * calculation2 );
      float s3 = 128 + 128 * sin(radians((xc + yc + timeDisplacement * 5) / 2));  
      float s  = (s1+ s2 + s3) / 3;
      pg.pixels[x+y*pg.width] = color(s, 255 - s / 2.0, 255);
    }
  }   
  pg.updatePixels();
  pg.endDraw();

  // display the results
  image(pg, 0, 0, width, height);
}



