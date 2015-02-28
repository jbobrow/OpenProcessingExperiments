
float x0;
float y0;

float x1;
float y1;

float x;
float y;

void setup() {
  x0 = width * .5;
  y0 = height * .25;
  y1 = height - y0;

  size(500, 500);
  strokeWeight(1);
  noFill();

  for (y = 0; y < 50; y++) {
    for (x = 0; x < 50; x++) {
      if ((y+x) % 4 == 0) {
        cast(x * 60, y * 60);
      }

      if ((y+x) % 6 == 0) {
        ellipse((x * 20) - 35, y * 20, 10, 10);
      }
    }
  }
}


void cast(float x0, float y0) {
  for (int i = 0; i < 10; i++) {
    line(x0, y0, x0 - 4, y0 + 4);
    line(x0, y0, x0 + 4, y0 + 4);

    y0 += 4;
  }
}
