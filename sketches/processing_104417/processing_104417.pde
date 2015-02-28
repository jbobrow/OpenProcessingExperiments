
Bug orecuho;

void setup() {
  size(400, 400);
  smooth();
  noStroke();
  fill(255);
  orecuho = new Bug(100, 100, 15);
}
void draw() {
  background(150, 0, 0);

  orecuho.live();
}



class Bug {
  float x;
  float y;
  float sz;

  float maxsz;
  float minsz;
  float grow;

  Bug(float tx, float ty, float tsz) {
    x = tx;
    y = ty;
    sz = tsz;
    maxsz = 20;
    minsz = 10;
    grow = random(0.2, 0.8);
  }

  void live() {
    ellipse(x, y, sz, sz);
    sz = sz + grow;
    if(sz > maxsz) {
      sz = maxsz;
      grow = -grow;
    }
    if(sz < minsz) {
      sz = minsz;
      grow = -grow;
    }
  }
}
