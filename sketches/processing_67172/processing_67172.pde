
class Ball {
  float y, x, xs, ys, wdth, ht;
  float sz;
  float cnt = 0;
  float nsx = 0.01;
  float nsy = -0.7;
  Ball(float y, float x, float xs, float ys, float wdth, float ht) {
    this.y = y;
    this.x = x;
    this.xs = xs;
    this.ys = ys;
  }
  void update() {

    xs = constrain(xs+map(noise(nsx), 0.0, 1.0, -1.0, 1.0), -30, 30);
    ys = constrain(ys+map(noise(nsy), 0.0, 1.0, -1.0, 1.0), -30, 30);
    x = constrain(x + xs, -1, width+1);
    y = constrain(y + ys, -1, height+1);
    if (x+wdth/2 > width || x < wdth/2) {
      xs *= -1;
    }
    if (y+ht/2 > height || y < ht/2) {
      ys *= -1;
    }
    nsx += 0.02;
    nsy += 0.02;
  }
  void display() {
    if (cnt%6 == 1) {
      fill(255, 10);
      rect(0, 0, width, height);
    }
    fill(0);
    noStroke();
    sz = map(abs(xs)+abs(ys), 0, 60, 2, 8);
    ellipse(x, y, sz, sz);
    cnt +=1;
  }
}


