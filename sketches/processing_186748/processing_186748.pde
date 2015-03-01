
float[] H;
float[] S;
float[] B;

color[][] c;

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

  c = new color[width][height];

  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      c[i][j] = get(i, j);
    }
  }
}

void draw() {
  background(360);

  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      if (random(100) > brightness(c[i][j])) {
        fill(hue(c[i][j]), saturation(c[i][j]), brightness(c[i][j]));
      }
      rect(i, j, 1, 1);
    }
  }
}

