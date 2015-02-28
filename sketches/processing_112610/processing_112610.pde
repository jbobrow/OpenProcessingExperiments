
void setup() {
  size(500, 500);
  background(255);
  for (int i = -1000; i < 2000; i++) {
    float x = 0;
    float y = i;
    for (int j = -100; j < 500; j++) {
      float nx = x + 50*noise(x*0.01, y*0.01) + 20*cos(i*0.005);
      float ny = y - 20 + 40*noise(x*0.01 + 100, y*0.01 + 100) + 20*sin(j*0.005);// - 0.0005*(width/2 - x)*(width/2 - x);
      stroke(255.0*noise(x * 0.03 + 500, y * 0.03 + 500));
      line(x, y, nx, ny);
      x = nx;
      y = ny;
    }
  }
}
