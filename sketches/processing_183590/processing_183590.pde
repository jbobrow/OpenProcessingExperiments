
float lim(float v, float mx) {
  v = v % mx;
  if (v < 0) {
    v = v + mx;
  }
  return v;
}
void doit() {
  float minc = random(0,20);
  float maxc = random(0,20);
  
  float scalee = random(20, 50);
   
  float[] R = new float[6];
  for(int i = 0; i < 6; i = i + 1) {
    R[i] = random(2);
  }
 
  loadPixels();
  noiseSeed(int(random(100000)));
  noiseDetail(6);
 
  int x = 0;
  while (x < width) {
    int y = 0;
    while (y < height) {
      float sx = float(x) / scalee;
      float sy = float(y) / scalee;
      float v = sin(sx*R[0]+sy*R[1]) * sin(sx*sin(sx)/10-sy*sy/11) * sin(sin(sy)*R[2]-sx*R[3]+2) * noise(sx, sy);
      float h = lim(sy/10 +map(v, -1, 1, minc, maxc), 10);
      float s = map(noise(sy/10 + v*2), 0, 1, -4, 15);
      float b = map(noise(v*2, 10), 0, 1, -4, 15);
            
      pixels[y*width+x] = color(h, s, b);
     
      y = y + 1;
    }
 
    x = x + 1;
  }
  updatePixels();
}
 
void setup() {
  size(500, 400);
  colorMode(HSB, 10);
  doit();
}
void draw() {
}
void mouseClicked() {
  doit();
}
