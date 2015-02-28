
float t = 0, step = 0.1;
int w, h, cnum = 6;
PImage img;

void setup() {
  size(600, 250, P3D);
  w = width / cnum;
  h = height;
  img = createImage(w, h, RGB);
  for (int i = 0; i < w*h; i++) img.pixels[i] = 0;
}

void draw() {
  background(255);
  t = frameCount*step;
  for (int y = 0; y < h; y++){
    float ys = y * step*1.2;
    for (int x = 0; x < w; x++){
      float xs = x * step;
      float tw = tan(x*PI/w+radians(-frameCount*.5));
      color c = img.get(x, y);
      color cnew = color(
        red(c)  +noise(tw+t, ys-t)*200-100,
        green(c)+noise(tw+t, ys+t)*200-100,
        blue(c) +noise(tw-t, ys-t)*200-100);
      img.set(x, y, cnew);
    }
  }
  for (int i = 0; i < cnum; i++) image(img, i*w, 0);
}


