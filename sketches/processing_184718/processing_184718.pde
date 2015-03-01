
int Bsize = 400;

void setup() {
  size(400, 400);
  noSmooth();
  frameRate(77);
  background(0);
}


void draw() {

  stroke(255);
  point(width/2, height/2);

  loadPixels();

  for (int iy = 0; iy <= 0; iy++) {
    for (int ix = -Bsize; ix <= Bsize; ix++) {

      int i = constrain(((mouseY + iy)*width + (mouseX + ix)), 0, pixels.length-1);

      int y = int(constrain((i/width), 0, height));
      int x = int(constrain(i-(width*y), 0, width));
      float sum = 0;

      if ((y != 0) && (x != 0) && (y != height-1) && (x != width-1)) {
        for (int ky = -1; ky <= 1; ky++) {
          for (int kx = -1; kx <= 1; kx++) {
            int posi = (y + ky) * width + (x + kx);
            sum += pixels[posi]&0xFF;
          }
        }
      }

      if (random(100) < 22) {
        if ((sum > 0) && (sum <= 1020) && ((pixels[i]&0xFF) == 0)) {
          pixels[i] = -1;
        }
        if ((sum > 1020) && ((pixels[i]&0xFF) == 255)) {
          pixels[i] = 0;
        }
      }
    }
    updatePixels();
  }
}

void mouseClicked() {
  background(0);
}


