
static final float NOISE = 0.1; // Chance of lateral shift
static final float ATTEN = 0.5; // Flame attenuation

// Note: attenuation must be in the range 0.0 < ATTEN <= 1.0
// Values close to 1 suppress the flames.

static final int SCALE = 4; // Scale the image by this much

int[] heatMap;
int[] backMap;

PImage heatImg;

final color[] palette = new color[256];

void setup() {

  // This is the background image
  PImage backImg = loadImage("skull128.png");
  backImg.loadPixels();
  backMap = new int[backImg.pixels.length];
  for (int k = 0; k < backImg.pixels.length - backImg.width; k++) {
    // Simple edge detector to pick out 'top' edges.
    int l0 = (int) brightness(backImg.pixels[k + backImg.width]);
    int l1 = (int) brightness(backImg.pixels[k]);
    backMap[k] = (l1 > l0) ? l1 - l0 : 0;
  }
  
  heatMap = new int[backMap.length];
  heatImg = createImage(backImg.width, backImg.height, RGB);

  size(SCALE * backImg.width, SCALE * backImg.height);
  
  // Generate a palette of 'fiery' colours
  // (black -> red -> yellow -> white)
  for (int i = 0x00; i < 0x40; i++)
    palette[i] = color(4 * i, 0x00, 0x00);
  for (int i = 0x40; i < 0xc0; i++)
    palette[i] = color(0xff, 2 * (i - 0x40), 0x00);
  for (int i = 0xc0; i <= 0xff; i++)
    palette[i] = color(0xff, 0xff, 4 * (i - 0xc0));
}

void draw() {

  float scale = (1 - ATTEN) / ATTEN;
  for (int y = 0; y < heatImg.height; y++) {
    int y_offset = y * heatImg.width;
    for (int x = 0; x < heatImg.width; x++) {
      float carry = heatMap[y_offset + x] * scale;
      heatMap[y_offset + x] = 0;
      int xx = x;
      for (int yy = y - 1; yy >= 0; yy--) {
        carry *= ATTEN;
        if (carry < 1.0 / 256)
          break;
        if (random(1.0) < NOISE)
          xx += 1;
        if (random(1.0) < NOISE)
          xx -= 1;
        if (xx >= 0 && xx < heatImg.width)
          heatMap[yy * heatImg.width + xx] += (int) carry;
      }
    }
  }

  for (int k = 0; k < heatMap.length; k++)
  heatMap[k] += (int) random(backMap[k]);

  heatImg.loadPixels();
  for (int k = 0; k < heatMap.length; k++) {
    int l = heatMap[k];
    heatImg.pixels[k] = palette[l <= 0xff ? l : 0xff];
  }
  heatImg.updatePixels();

  image(heatImg, 0, 0, width, height);
}

