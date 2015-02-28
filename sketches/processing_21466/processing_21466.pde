
PImage Img;
float[][] Temperature;

void setup() {

  size(540, 344);
  frameRate(120);
  colorMode(HSB);
  Img = createImage(width, height, RGB);
  Temperature = new float[height][width];
  zeroTemperature();
  Img.loadPixels();
   
}

int r = 50;

void draw() {


    Blob blob0 = new Blob(random(r, width-r), random(r, height-r), random(0, r));
    blob0.render();
    buildImage();
    Img.updatePixels();
    image(Img, 0, 0);

    for (int y = 0 ; y < height ; y++)
    {
      for (int x = 0; x < width ; x++)
      {
        Temperature[y][x] *= 0.99;
      }
    }
  
}

void zeroTemperature() {

  for (int y = 0 ; y < height ; y++) {
    for (int x = 0 ; x < width ; x++) {
      Temperature[y][x] = 0;
    }
  }
}

void buildImage() {

  for (int y = 0 ; y < height ; y++)
  {
    for (int x = 0 ; x < width ; x++)
    {
      float t = map(Temperature[y][x], 0, 1.5, 0, 255);
      Img.set(x, y, color(t, t, 255));
    }
  }
}

class Blob {

  float cx, cy;
  float r;

  Blob(float acx, float acy, float ar) {
    cx = acx;
    cy = acy;
    r = ar;
  }

  void render() {

    for (float y = cy - r ; y < cy + r ; y++)
    {
      for (float x = cx - r ; x < cx + r ; x++)
      {
        float d = dist(x, y, cx, cy);
        if (d > r) continue;
        float h = map(d, 0, r, 1, 0);
        Temperature[int(y)][int(x)] += h;
      }
    }
  }
}

