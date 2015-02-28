
float[] x = new float[1000];
float[] y = new float[1000];
int[] temp = {
  0, 0, 0, 0, 0, 0, 55, 55, 55, 55, 70, 70, 70, 70, 70, 70, 70, 55, 0, 0, 0, 0, 0, 0, 0, 55, 55, 55, 55, 55, 70, 70, 55, 55, 55, 55, 55, 70, 55, 0, 0, 0, 0, 0, 55, 55, 55, 55, 55, 70, 70, 55, 55, 55, 55, 55, 55, 55, 70, 0, 0, 0, 0, 55, 70, 70, 55, 55, 55, 70, 70, 70, 55, 55, 55, 55, 55, 55, 55, 55, 0, 0, 0, 55, 55, 55, 55, 55, 70, 70, 55, 70, 55, 55, 55, 70, 70, 70, 55, 55, 0, 0, 0, 0, 55, 55, 70, 70, 70, 70, 70, 70, 55, 55, 55, 55, 55, 55, 55, 55, 55, 0, 0, 70, 70, 70, 70, 55, 70, 55, 55, 55, 55, 55, 0, 0, 0, 55, 70, 55, 55, 55, 55, 70, 55, 55, 55, 55, 55, 55, 55, 55, 55, 55, 0, 0, 0, 55, 70, 55, 55, 0, 0, 0, 0, 70, 70, 55, 55, 55, 70, 55, 70, 55, 0, 0, 0, 0, 0, 0, 70, 0, 0, 0, 0, 70, 55, 55, 55, 70, 70, 55, 55, 55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55, 70, 70, 55, 70, 70, 70, 55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55, 55, 55, 0, 0, 0, 0, 0, 0, 0,
};

void setup() {
  background(255, 255, 255);
  size (
  610, 390
    );
  smooth();
  noStroke();
  int i = 0;
  int s=30;
  while (i < 300) {
    x[i] = s;
    y[i] = s;
    s=s+30;
    i=i+1;
  }
  row1();
  row2();
  row3();
  row4();
  row5();
  row6();
  row7();
  row8();
  row9();
  row10();
  row11();
  row12();
  save("VIS.png");
}

void draw() {
}

void row1 () {
  int i=0;
  while (i<20) {
    int l = 0;
    int d=temp[i];
    while (l<temp[i]) {
      fill(0, 0, 0, 3);
      ellipse(x[i], y[0], d, d);
      l=l+1;
      d=d-1;
    }
    i=i+1;
  }
}

void row2 () {
  int i=20;
  while (i<40) {
    int l = 0;
    int d=temp[i];
    while (l<temp[i]) {
      fill(0, 0, 0, 3);
      ellipse(x[i-20], y[1], d, d);
      l=l+1;
      d=d-1;
    }
    i=i+1;
  }
}

void row3 () {
  int i=40;
  while (i<60) {
    int l = 0;
    int d=temp[i];
    while (l<temp[i]) {
      fill(0, 0, 0, 3);
      ellipse(x[i-40], y[2], d, d);
      l=l+1;
      d=d-1;
    }
    i=i+1;
  }
}

void row4 () {
  int i=60;
  while (i<80) {
    int l = 0;
    int d=temp[i];
    while (l<temp[i]) {
      fill(0, 0, 0, 3);
      ellipse(x[i-60], y[3], d, d);
      l=l+1;
      d=d-1;
    }
    i=i+1;
  }
}

void row5 () {
  int i=80;
  while (i<100) {
    int l = 0;
    int d=temp[i];
    while (l<temp[i]) {
      fill(0, 0, 0, 3);
      ellipse(x[i-80], y[4], d, d);
      l=l+1;
      d=d-1;
    }
    i=i+1;
  }
}

void row6 () {
  int i=100;
  while (i<120) {
    int l = 0;
    int d=temp[i];
    while (l<temp[i]) {
      fill(0, 0, 0, 3);
      ellipse(x[i-100], y[5], d, d);
      l=l+1;
      d=d-1;
    }
    i=i+1;
  }
}

void row7 () {
  int i=120;
  while (i<140) {
    int l = 0;
    int d=temp[i];
    while (l<temp[i]) {
      fill(0, 0, 0, 3);
      ellipse(x[i-120], y[6], d, d);
      l=l+1;
      d=d-1;
    }
    i=i+1;
  }
}

void row8 () {
  int i=140;
  while (i<160) {
    int l = 0;
    int d=temp[i];
    while (l<temp[i]) {
      fill(0, 0, 0, 3);
      ellipse(x[i-140], y[7], d, d);
      l=l+1;
      d=d-1;
    }
    i=i+1;
  }
}

void row9 () {
  int i=160;
  while (i<180) {
    int l = 0;
    int d=temp[i];
    while (l<temp[i]) {
      fill(0, 0, 0, 3);
      ellipse(x[i-160], y[8], d, d);
      l=l+1;
      d=d-1;
    }
    i=i+1;
  }
}

void row10 () {
  int i=180;
  while (i<200) {
    int l = 0;
    int d=temp[i];
    while (l<temp[i]) {
      fill(0, 0, 0, 3);
      ellipse(x[i-180], y[9], d, d);
      l=l+1;
      d=d-1;
    }
    i=i+1;
  }
}

void row11 () {
  int i=200;
  while (i<220) {
    int l = 0;
    int d=temp[i];
    while (l<temp[i]) {
      fill(0, 0, 0, 3);
      ellipse(x[i-200], y[10], d, d);
      l=l+1;
      d=d-1;
    }
    i=i+1;
  }
}

void row12 () {
  int i=220;
  while (i<240) {
    int l = 0;
    int d=temp[i];
    while (l<temp[i]) {
      fill(0, 0, 0, 3);
      ellipse(x[i-220], y[11], d, d);
      l=l+1;
      d=d-1;
    }
    i=i+1;
  }
}
