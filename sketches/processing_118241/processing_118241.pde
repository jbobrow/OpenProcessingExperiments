
//20131030 HorusWang
// Noise test 1

void setup() {
  size(500, 500);
  background(255);
  smooth();
}

void draw() {
  float xnoise = 0;
  float ynoise = 0;
  float inc = 0.05;

  noiseSeed(0);

  for (int y=0;y<=height;y+=1) {
    for (int x=0;x<=width;x+=1) {
      xnoise += inc;
      float k = noise(xnoise, ynoise)*255;
      stroke(k);
      point(x, y);
    }

    xnoise=0;
    ynoise+=inc;
  }
}



