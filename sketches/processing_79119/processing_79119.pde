
int[] x1, y1, x2, y2, cx, cy, blur;
int counter, c1, c2, c3, c4;

void setup() {
  size(600, 600, P2D);
  frameRate(1000);
  background(0);
  loadPixels();
  int pts = 12;
  x1 = new int[pts];
  y1 = new int[pts];
  x2 = new int[pts];
  y2 = new int[pts];
  blur = new int[width*height];
  int c = 256*32;
  cx = new int[c];
  cy = new int[c];
  for (int i = 0; i < cx.length; i++) {
    cx[i] = (width>>1) + int(((width-20)>>1)*sin(i*TWO_PI/c));
    cy[i] = (height>>1) + int(((height-20)>>1)*cos(i*TWO_PI/c));
  }
  c1 = c2 = c3 = c4 = 0;
}

void draw() {
  loadPixels();
  erode(pixels, blur, width, height);
  arraycopy(blur, pixels);
  c1 = (frameCount*64);
  c2 = (frameCount*2*64);
  c3 = (frameCount*5*64);
  c4 = (frameCount*7*64);
  for (int j = 0; j < 2048; j++) {
    c1 = (c1 + 1) % (cx.length<<2);
    c2 = (c2 + 2) % (cx.length<<2);

    bresenlerp(cx[c1>>2], cx[c2>>2], x1);
    bresenlerp(cy[c1>>2], cy[c2>>2], y1);

    c3 = (c3 + 5) % (cx.length<<2);
    c4 = (c4 + 7) % (cx.length<<2);
    bresenlerp(cx[c3>>2], cx[c4>>2], x2);
    bresenlerp(cy[c3>>2], cy[c4>>2], y2);

    for (int i = 0; i < x1.length; i++) {
      bresenham2(x1[i], y1[i], x2[i], y2[i], x1.length);
    }
  }
  shiftBlur(pixels, blur, width, height);
  shiftBlur(blur, pixels, width, height);

  updatePixels();
}


