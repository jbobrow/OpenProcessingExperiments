
float pixl = 1;
int w = int(pixl*300);
int h = int(pixl*200);
int paractive = 15;
float t;
float divv = 80;
int l = 1;
float[] X = new float[paractive];
float[] Y = new float[paractive];
float[] Xv = new float[paractive];
float[] Yv = new float[paractive];
float[] rands = new float[paractive];
void setup() {
  size(300, 200, P2D);
  for(int p = 0; p < paractive; p++) {
    rands[p] = random(0.5, 2);
  }
  strokeWeight(pixl);
}
void draw() {
    for(int p = 0; p < paractive; p++) {
      if(keyPressed&&key != '1'&&key != '2'&&key != 'p') {
      X[p] = random(width / pixl);
      Y[p] = random(height / pixl);
    }else{
      if(key == '1') {
        l = 1;
      }else if(key == '2') {
        l = 2;
    }
  }
    }
  for(int x = 0; x < w; x++) {
    for(int y = 0; y < h; y++) {
      t = sqrt(dist(x, y, X[0], Y[0]));
      for(int p = 1; p < paractive; p++) {
        t = t * sqrt(dist(x / divv, y / divv, X[p] / divv, Y[p] / divv));
      }
      t = t / 2;
      stroke(255-t*4, 255-t*6, 255-(t + 80), 20);
      if(l == 1)
      point(x*pixl, y*pixl);
      for(int b = 0; b < 255; b += 40) {
        if(t > b && t < b + 20) {
          t = 0;
        }
      }
      if(t != 0) {
        t = 255;
      }
      stroke(255 -t, 255 -t, 255-t, 40);
      if(l == 2)
      point(x*pixl, y*pixl);
    }
  }
    for(int p = 0; p < paractive; p++) {
        Xv[p] += random(-3, 3);
        Yv[p] += random(-3, 3);
        Xv[p] /= 1.4;
        Yv[p] /= 1.4;
      X[p] += Xv[p];
      Y[p] += Yv[p];
    }
}

