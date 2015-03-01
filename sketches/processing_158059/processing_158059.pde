
float r;
int R = 10;
float theta;
float hue;

void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  background(0);
}

void draw() {
  background(0);

  stroke(360, 120);

  for (int j = 1; j <= 5; j++) {
    fill(hue, 100*j/5, 100, 80);
    for (int i = 0; i < 8; i++) {
      pushMatrix();
      translate(width/2+R/j*cos(radians(360*i/8)), height/2+R/j*sin(radians(360*i/8)));
      rotate(radians(360*i/8));
      pushMatrix();
      translate(0, 0);
      rotate(radians(theta));
      beginShape();
      for (float t = 0; t < TWO_PI; t += 0.1) {
        r = 1 / (5 * sin(t/2)+1);
        vertex( R * r * cos(t), R * r * sin(t));//, 5, 5);
      }
      endShape(CLOSE);
      popMatrix();
      popMatrix();
    }
  }

  theta++;
  hue++;

  if (hue > 360) {
    hue = 0;
  }
}

