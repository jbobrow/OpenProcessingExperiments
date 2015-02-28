
int[] f = new int[50];
int f0 = 1;
int f1 = 0;
int n = 50;
int c = 0;

int y = 0;

void setup() {
  size(600, 500);
  background(0);
  smooth();

  fibo(n);
}

void draw() {
  colorMode(HSB, 360, 100, 100);

  for (int j = 0; j < 10; j++) {
    for (int k = 0; k < f[j];k++) {
      if (k <= 36) {
        c = k;
      }
      else {
        c = k - 36;
      }
      noStroke();
      fill(c*10, 100, 100);
      ellipse(k*10+10, 10+50*j, 10, 10);
    }
  }
  noStroke();
  fill(0);
  rect(0, y, width, height);

  y++;

  if (y > height + 30) {
    y = 0;
  }

  rabbit(500, 100);
  fill(360, 100, 100);
  heart(440, 100, 30, 30);
  rabbit(380, 100);
}

void fibo(int n) {
  for (int i = 0; i < n; i++) {
    if (i % 2 == 0) {
      f0 += f1;
      f[i] = f0;
    }
    else {
      f1 += f0;
      f[i] = f1;
    }
  }
}

void rabbit(int x, int y) {
  fill(0, 0, 100);

  pushMatrix();
  translate(x-30, y-40);
  rotate(100);
  ellipse(0, 0, 30, 60);
  popMatrix();

  pushMatrix();
  translate(x+30, y-40);
  rotate(-100);
  ellipse(0, 0, 30, 60);
  popMatrix();

  ellipse(x, y, 70, 60);
}

void heart(float centerX, float centerY, float width, float height) {
  final float WIDTH = width / 2 * 0.85;
  final float HEIGHT = height / 2;
  final float OFFSET = centerY - (HEIGHT / 6 * 5);
  beginShape();
  for (int i = 0; i < 30; i++) {
    float tx = abs(sin(radians(i * 12))) * (1 + cos(radians(i * 12))) * sin(radians(i * 12)) * WIDTH + centerX;
    float ty = (0.8 + cos(radians(i * 12))) * cos(radians(i * 12)) * HEIGHT + OFFSET;
    vertex(tx, ty);
  }
  endShape(CLOSE);
}


