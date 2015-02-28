
PImage pict;

color[] c = new color[64*48];
int k = 0;
int r = 80;
int count = 0;
int flg = 0;

void setup() {
  size(640, 480);
  background(255);
  smooth();

  pict = loadImage("wallpaper.jpeg");

  //noLoop();
}

void draw() {
  circles();
}

void circles() {

  image(pict, 0, 0);

  for (int i = r/2; i < width; i += r) {
    for (int j = r/2; j < height;j += r) {
      c[k] = get(i, j);
      k++;

      if (k > 64* 48) {
        k = 0;
      }
    }
  }

  background(0);
  k = 0;


  for (int p = r/2; p < width; p+= r) {
    for (int q = r/2; q < height ; q += r) {
      fill(c[k]);
      ellipse(p, q, r, r);
      k++;
    }
  }

  if (flg == 1) {
    image(pict, 0, 0);
  }
}

void mousePressed() {
  count++;

  if (count == 0) {
    redraw();
  }
  else if (count == 1) {
    r = 40;
    k= 0;
    redraw();
  }
  else if (count ==2) {
    r = 20;
    k = 0;
    redraw();
  }
  else if (count == 3) {
    flg = 1;
    redraw();
  }

  if (count >= 4) {
    count = 0;
    flg = 0;
    r = 80; 
    k = 0;
  }
}


