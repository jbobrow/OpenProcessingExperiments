
int count = 4;
int r= 30;

float[] xP= new float[count];
float[] yP= new float[count];
float[] xS= new float[count];
float[] yS= new float[count];

color[]c = new color[count];

float gravity = 0.1;

void setup() {
  size(500, 500);

  c[0] = color( 255, 0, 0);
  c[1] = color( 0, 0, 255);
  c[2] = color( 0, 255, 255);
  c[3] = color( 255, 255, 0);

  xP[0] = 100;
  xP[1] = 60;
  xP[2] = 20;
  xP[3] = 200;

  yP[0] = 170;
  yP[1] = 130;
  yP[2] = 90;
  yP[3] = 250;

  xS[0] = 1;
  xS[1] = 3;
  xS[2] = 1;
  xS[3] = 2;

  yS[0] = 3;
  yS[1] = 4;
  yS[2] = 1;
  yS[3] = 2;
}

void draw() {

  background(0);
  noStroke();
  ellipseMode(CENTER);

  for (int i = 0; i < count; i++) {

      fill(c[i]);
      ellipse(xP[i], yP[i], r*2, r*2);

      xP[i] = xP[i] + xS[i];
      yP[i] = yP[i] + yS[i];

      yS[i] = yS[i] + gravity;

      if (xP[i] >= 500-r || xP[i] <= r) {
        xS[i] *= -1;
      }
      if (yP[i] >= 500-r || yP[i] <= r) {
        yS[i] *= -0.95;
      }

      for (int j =0; j< count; j++) {
        if (dist(xP[i], yP[i], xP[j], yP[j]) <= (r*2)) {
          xS[i] *= -1;
          yS[i] *= -1;
          xS[j] *= -1;
          yS[j] *= -1;
      }
    }
  }
}


