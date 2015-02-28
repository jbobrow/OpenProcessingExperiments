
int n = 50;
int [] p = new int[100];
int q = 0;
int divisor;
int c = 0;

void setup() {
  size(620, 630);
  background(0);
  smooth();

  prime_number();

  noLoop();
}

void draw() {
  colorMode(HSB, 360, 100, 100);
  for (int i = 1; i <= 50;i++) {
    for (int j = 0; j < i;j++) {
      if (i == p[j]) {
        fill(c*10, 100, 100);
        c += 2;
        break;
      }
      else {
        fill(0, 0, 100);
      }
    }
    for (int k = 0; k < i;k++) {
      rect(k*12+10, 12*i+5, 12, 12);
    }
  }

  if (c > 36) {
    c = 0;
  }
}


void prime_number() {
  for (int i = 1; i <= n; i++) {
    divisor = 0;
    for (int j = 1; j <= i; j++) {
      if (i % j == 0) {
        divisor++;
      }
    }
    if (divisor == 2) {
      p[q] = i;
      q++;
    }
  }
}


