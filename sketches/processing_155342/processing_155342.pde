
float r;
int R;
float theta;
float hue;
float sat;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  background(0);

  noLoop();

  noStroke();
}

void draw() {
  background(360);

  for (int i = 0; i < 16; i++) {
    float draw_t = TWO_PI*i/16;
    float draw_r = 200;
    flower(width/2+draw_r*cos(draw_t), height/2+draw_r*sin(draw_t), 3);
  }

  flower(width/2, height/2, 10);
}

void flower(float x, float y, int num) {
  for (int j = 0; j < num; j++) {
    R = (num+1)*10 - 10*j;
    hue = random(0, 360);

    if (num > 3) {
      sat = 100 - 100*j/num;
    } else {
      sat = 100 - 20*j;
    }

    pushMatrix();
    translate(x, y);
    rotate(radians(j * 45/2));
    for (int i = 0; i < 8; i++) {
      if (i % 2 == 0) {
        fill(hue, sat, 100, 120);
      } else {
        fill(hue, sat, 50, 120);
      }

      pushMatrix();
      translate(R*cos(radians(360*i/8)), R*sin(radians(360*i/8)));
      rotate(radians(360*i/8 + 180));
      beginShape();
      for (float t = 0; t < TWO_PI; t += 0.1) {
        r = 1 / (5 * sin(t/2)+1);
        vertex( R * r * cos(t), R * r * sin(t));//, 5, 5);
      }
      endShape(CLOSE);
      popMatrix();
    }
    popMatrix();
  }
}
