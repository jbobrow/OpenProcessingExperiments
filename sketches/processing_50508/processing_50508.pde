
int dotsize = 8;
int imgsize = 720;
float noisescale = 3.;
float A_0 = 25;
float dA = 0.03;
float freq_0 = 0.01;
float df = -0.00002;
float phi = 2.;

void setup() {
  //size(imgsize, imgsize);
  size(720, 720);
}

void draw() {
  background(100,100,0);
  fill (100, 200, 50);
  float multi = 1.;
  //
  for (int y=-3*dotsize;y<=imgsize; y+=6*dotsize) {
    float A = A_0 + y*dA;
    float freq = freq_0 + y*df;
    //
    for (int x=0; x<imgsize; x++) {
      // noise
      int dy = int( noise(x*y) * dotsize *noisescale);
      int px = x;
      int py =  int(A * sin(freq * x + phi) + y + dy);
      stroke(200,0,0);
      line(px + 0.5*dy, py, px, py + 1.5*dy);
      noStroke();
      ellipse(px, py, dotsize, dotsize);
    }
  }
}

