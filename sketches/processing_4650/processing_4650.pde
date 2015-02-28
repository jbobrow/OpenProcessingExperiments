
float q = 0.0;
float n = 0.0;
float grow = 1.0;
float state = 0;

void setup() {
  size(500, 500);
  frameRate(10);
}

void draw() {
  smooth();
  background(0);
  translate(250, 250);

  q = q + 11.0;
  n = n + grow;
  if ((n > 100) || (n < 0)) {
    grow = -grow;
  }

  tony(0.3, 100, 0, 255, 20, 20, 30, 40, 0);
  tony(0.3, 200, 0, 90, 30, 40, 70, 80, 1);
  tony(0.3, 95, 100, 255, 40, 100, 12, 34, 0);
  tony(0.3, 230, 90, 70, 100, 75, 69, 47, 1);

}

void tony(float s, int r, int g, int b, int f, int p, int w, int e, int l) {

  for (int x = 0; x < 360; x = x + 20) {
    rotate(radians(q));

    strokeWeight(s);
    noFill();
    stroke(r, g, b); 

    state = (l);

    if (state == 0) {
      rect(f, p, w+n, e+n);

    } 
    else if (state == 1) {
      ellipse(f, p, w+n, e+n);
    }
  }

}




