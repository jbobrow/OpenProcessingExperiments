
/**
 * Quasicrystals by Combining Waves
 * by Ricard Marxer 
 * ported to Processing from:
 * http://mainisusuallyafunction.blogspot.com/2011/10/quasicrystals-as-sums-of-waves-in-plane.html)
 *
 * Render quaiscrystals by 
 * combining planar waves in different directions
 */

int waveCount = 7;  // The number of waves to combine
float waveFreq = 0.4;  // The frequency of the waves
float waveOffsetInc = 0.01;  // The speed at which the waves slide

float waveOffset = 0.0;  // The initial offset of the waves

void setup() {
  size(400, 400);
  smooth();
}

void draw() {
  background(255);

  for (int i=0; i<width; i++) {
    for (int j=0; j<height; j++) {
      float c = 0;

      for (int m=0; m<waveCount; m++) {
        float ang = map(m, 0, waveCount, 0, PI);

        float kx = cos(ang);
        float ky = sin(ang);

        c += (wave(kx, ky, i, j, waveOffset) + 1) / 2;
      }

      float v = c % 1;
      int k = int(c - v);
      float w = map((k & 1) == 0 ? v : 1.0 - v, 0, 1, 0, 255);

      set(i, j, color(w));
    }
  }

  waveOffset += 0.2;
}


float wave(float kx, float ky, float x, float y, float waveOffset) {
  return cos(waveFreq*(kx*x + ky*y) + waveOffset);
}


