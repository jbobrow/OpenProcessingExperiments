
void setup () {
  size (800, 800);
  smooth ();
  noLoop();
}

void draw() {
  background(252, 240, 222);

  for (int i = -600; i<width; i+=80)
  {
    for (int j = -600; j<height; j+=80)
    {
      float rw = random(0.5, 1.5);
      float rh = random(0.5, 1.5);
      int rs = int(random(255));
      int rsw = int(random(2, 15));

      logo (i, j, rw, rh, rs, rsw);
    }
  }
}

void logo(float x, float y, float w, float h, int s, int sw) {
  /////logo/////
  pushMatrix();
  translate(x, y);
  strokeCap (ROUND);
  scale(w);
  stroke(s);
  strokeWeight(sw);


  // USE THE ORIGIN IN THE CENTER
  line ( 326, 307, 441, 307);
  line ( 441, 307, 441, 473);
  line ( 326, 377, 441, 377);
  line (326, 377, 326, 545);
  line (326, 456, 441, 456);
  popMatrix();
}



