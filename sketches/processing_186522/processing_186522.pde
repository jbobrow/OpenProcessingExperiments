
float[] H;
float[] S;
float[] B;

void setup() {
  size(200, 200);
  colorMode(HSB, 360, 100, 100);
  background(360);

  noStroke();
  for (int j = 0; j < 80; j++) {
    float r = random(5, 50);
    fill(random(360), random(50, 100), random(100), 100);
    ellipse(random(width), random(height), r, r);
  }

  //----------------------------------

  H = new float[width*height];
  S = new float[width*height];
  B = new float[width*height];

  loadPixels();
  for (int i = 0; i < width * height - 1; i++) {
    H[i] = hue(pixels[i]);
    S[i] = saturation(pixels[i]);
    B[i] = brightness(pixels[i]);
  }
  updatePixels();
}

void draw() {
  background(360);

  for (int i = 0; i < width * height -1; i++) {
    if (random(100) > B[i]) {
      fill(H[i], S[i], B[i]);
    }
    rect((i%width)-1, i/width, 1, 1);
  }
}

