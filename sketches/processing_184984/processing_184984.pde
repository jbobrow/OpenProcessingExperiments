
float ratio = 1.78125;

void setup() {
  size(640, 640);
  noStroke();
  fill(0, 150, 255);
}

void draw() {
  background(20);

  float size = 64;
  float yoff = size*ratio;
  /* Ratio 1:1.78125 */

  for (int x = 0; x <= width+size; x+=size*2) {
    for (float y = 0; y <= height+yoff; y+=yoff) {
      float xo = 0;
      if ((y % (yoff * 2)) == 0) {
        xo = size;
      } else {
        xo = 0;
      }
      makeHex(new PVector(x+xo, y), size);
    }
  }
}

void makeHex(PVector loc, float size) {
  float diff = sin(radians(dist(loc.x, loc.y, width/2, height/2)-frameCount))*size/ratio;
  beginShape();
  for (int i = 0; i < 6; i++) {
    float angle = PI*i/3;
    vertex(loc.x+sin(angle) * (size/ratio-diff), loc.y+cos(angle) * (size/ratio-diff));
  }
  endShape(CLOSE);
}



