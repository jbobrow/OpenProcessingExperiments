
void setup() {
  size(512, 512, P2D);
  smooth();
  frameRate(20);
}

float step = 1.0f;

void draw() {
  background(0);
  float x = width / 2;
  float y = height / 2;
  
  float r = min(width, height) * 0.25f / sqrt(step);
  float offset = (1.0f - ((step - 0.25f) / 0.75f)) * r;
  
  lsystem(x, y + r - offset, r * 0.47f, 9, 3);
  r *= step;
  float rr = r * 0.47f;
  offset *= 0.47f;
  y -= offset;
  int ttl = (step < 0.8f) ? 8 : 9;
  lsystem(x - r, y, rr, ttl, 2);
  lsystem(x + r, y, rr, ttl, 1);
  lsystem(x, y - r, rr, ttl, 4);
  
  stroke(128, 255, 0);
  line(x - r, y, x + r, y);
  line(x, y - r, x, y + r);
  
  step = ((step * 0.93f) + (step - 0.03f)) / 2;
  if(step < 0.2209f) step = 1.0f;
}

void lsystem(float x, float y, float r, int ttl, int side) {
  if(--ttl <= 2) return;
  
  float rr = r * 0.47f;
  if(side != 1) lsystem(x - r, y, rr, ttl, 2);
  if(side != 2) lsystem(x + r, y, rr, ttl, 1);
  if(side != 3) lsystem(x, y - r, rr, ttl, 4);
  if(side != 4) lsystem(x, y + r, rr, ttl, 3);
  
  int c = ttl * 25 + 30;
  c = c * c / 255;
  int d = c * c / 510;
  stroke(d, c, (255-c)*c / 1020);
  line(x - r, y, x + r, y);
  line(x, y - r, x, y + r);
}
