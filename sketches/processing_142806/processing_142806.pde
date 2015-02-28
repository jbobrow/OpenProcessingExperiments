
int rect_size = 20;
int space;

color c;
int hue = 180;

int x;
int y;

boolean xy_flg = false;

float lines_space = 20;
boolean lines_space_flg = false;

int alp = 0;
boolean alp_flg = false;

void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  background(360);
}

void draw() {
  c = color(hue, 50, 100);

  background(360);

  stroke(c);

  for (int i = -100; i < 100;i++) {
    line(i*lines_space, 0, i*lines_space+x, y);
  }

  x += 4;
  y += 4;

  if (x > width && y > height) {
    x = width;
    y = height;

    xy_flg = true;
  }

  if (xy_flg == true) {
    lines_space -= 0.3;
    if (lines_space < 4.0) {
      lines_space = 4.0;
      lines_space_flg = true;
    }
  }

  if (lines_space_flg == true) {
    noStroke();
    for (int p = 0; p < width/rect_size;p++) {
      for (int q = 0; q < height/rect_size;q++) {
        if (q % 2 == 0) {
          fill(c, alp);
          space = 0;
        }
        else {
          fill(360, alp);
          space = rect_size;
        }

        rect(p*rect_size*2+space, q*rect_size, rect_size, rect_size);
      }
    }
    alp += 10;
    if (alp > 255) {
      alp = 255;
      alp_flg = true;
    }
  }

  if (alp_flg == true) {
    hue += 0.5;
    if (hue > 360) {
      hue = 0;
    }
  }
}



