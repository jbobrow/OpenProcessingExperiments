
void setup() {
  size(640, 480);
}

int y = 0;

void draw() {
  for (int x = 0; x < width; ++x) {
    color c = calcPixelColor(x, y);
    set(x, y, c);
  }

  if (++y >= height) {
    //save("output.png");
    noLoop();
  }
}

float ox = 0, oy = 0, oz = 3;  
float cx = 0, cy = 0, cz = 0;  
float r = 1;                   

color calcPixelColor(int x, int y) {
  float imagePlane = height;
  float dx =   x + 0.5 - width / 2;
  float dy = -(y + 0.5 - height / 2);
  float dz = -imagePlane;
  if (intersectRaySphere(ox, oy, oz, dx, dy, dz, cx, cy, cz, r)) {
    return color(255, 255, 255); 
  } else {
    return color(0, 0, 0);     
  }
}

boolean intersectRaySphere(float ox, float oy, float oz,
                           float dx, float dy, float dz,
                           float cx, float cy, float cz, float r) {
  float a = sq(dx) + sq(dy) + sq(dz);
  float b = 2 * (dx*(ox-cx) + dy*(oy-cy) + dz*(oz-cz));
  float c = sq(ox-cx) + sq(oy-cy) + sq(oz-cz) - sq(r);
  float d = b * b - 4 * a * c;
  return d >= 0;
}
