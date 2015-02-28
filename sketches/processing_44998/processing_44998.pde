
// varxety every stroke wexght gets smaller wxth three parameters
// order the parameters then gradxent xt

float m;
float easedR=0;
float easing = 0.03;
int rc = 255;


void setup () {
  size (1000, 1000);
  smooth();
  noLoop();
  background (255);
  colorMode(HSB, 100);
}

void draw () {
  //  background (255);

  for (int x=0; x<width;x += 50) {
    for (int y=0; y<width;y += 50) {
      // input mouse function
      color rc = color(random(0, 14), random(255, 100), random(255, 155), 60);
      float rw = random(0.5, 4.5);
      float rh = random(0.5, 1.5);
      int rsw = int(random(2, 7));

      drawLogo (x, y, rsw, rw, rh, rc);
    }
  }
}

void drawLogo(float x, float y, float sw, float w, float h, color rc) {

  pushMatrix();
  translate (x, y);
  noFill();
  strokeWeight(sw);
  scale(w);
  stroke (rc);

  line (5, 0, 15, 0);
  line (15, 0, 18, 3);
  line (18, 3, 18, 24);
  line (3, 8, 15, 8);
  line (15, 8, 18, 10);
  line (0, 10, 3, 8);
  line (0, 10, 0, 40);
  line (0, 23, 14, 23);
  line (14, 23, 18, 24);
  line (18, 24, 20, 27);
  line (20, 27, 24, 27);


  popMatrix();
}

void mousePressed () {
  rc = (rc+255)*255;
}

