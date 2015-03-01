
int t = -5;
int r = 0;
float c;
int h = 420;
int s = 0;
int n = 0;
int[] d = new int[10000000];
int m = 0;

void setup() {
  background(240);
  size(900, 600);
  smooth();
  frameRate(500);
  stroke(0);
  line(0, 375, width, 375);
  stroke(0);
  line(0, 425, width, 425);
  for (int i = 0; i < d.length; i++) {
    d[i] = 0;
  }
}

void draw() {
  c = random(1);
  t = t + 5;
  r = r + 5;
  if (c < 0.5) { h = h - 5;
  stroke(200, 0, 0, 30);
  line(t - 5, h + 5, t, h);
  } else { h = h + 5;
  stroke(200, 0, 0, 30);
  line(t - 5, h - 5, t, h);
  }
  if (h == 375) { s = s + 1;
    n = n + 1;
    m = m + 1;
    stroke(0);
    fill(0, 255, 0);
    rect(t - 2.5, 370 - d[t], 5, 5);
    d[t] = d[t] + 5;
  }
  if (h == 425) {
    n = n + 1;
    m = m + 1;
    stroke(0);
    fill(255, 0, 0);
    rect(t - 2.5, 370 - d[t], 5, 5);
    d[t] = d[t] + 5;
  }
  if (m > width) { m = 0;
  stroke(240);
  fill(240);
  rect(0, 427, width, height - 427);
  }
  if (n > 0) {
  stroke(255, 0, 0);
  line(m, height, m, height - height*s/n);
  stroke(240);
  fill(240);
  rect(0, 428, width, 60);
  noStroke();
  fill(0, 0, 255);
  rect(0, 468, r/n, 20);
  if (s > 0) {
  noStroke();
  fill(0, 200, 0);
  rect(0, 428, r/s, 20);
  if (n-s > 0) {
  noStroke();
  fill(200, 0, 0);
  rect(0, 448, r/(n-s), 20);
  }
  }
  }
  if (h == 375) { h = 420;
  t = -5;
  }
  if (h == 425) { h = 420;
  t = -5;
  }
  stroke(0);
  line(0, 540, width, 540);
}
  
  
  
