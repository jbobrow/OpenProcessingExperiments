

int lineLength=100;
int[] x = new int[lineLength];
int[] y = new int[lineLength];

int[] r = new int[256];
int[] g = new int[256];
int[] b = new int[256];

int[] size = new int[5000];

int counter=0;

void setup() {
  size(600, 600);
  background(255);
  smooth();
}

void draw() {
  noStroke();
  if (keyPressed) {
    background(random(0, 255), random(0, 255), random(0, 255));
  }

  int i = 0;

  while (i < x.length) {

    fill(r[i], g[i], b[i]);
    ellipse(x[i], y[i], size[i], size[i]);

    i = i + 1;
  }

  if (mousePressed) {

    if (counter >= x.length) {
      size = expand(size);
      r = expand(r);
      g = expand(g);
      b = expand(b);
      x = expand(x);
      y = expand(y);
    }
    size[counter] = round(random(10, 30));
    r[counter] = round(random(0, 255));
    g[counter] = round(random(0, 255));
    b[counter] = round(random(0, 255));
    x[counter] = mouseX;
    y[counter] = mouseY;
    if (key == 'r') {
      r[counter] = round(random(0, 255));
      g[counter] = 0;
      b[counter] = 0;
    }
    if (key == 'g') {
      r[counter] = 0;
      g[counter] = round(random(0, 255));
      b[counter] = 0;
    }
    if (key == 'b') {
      r[counter] = 0;
      g[counter] = 0;
      b[counter] = round(random(0, 255));
    }
    if (key == 'h') {
      size[counter] = round(random(30, 50));
    }
    if (key == 'l') {
      size[counter] = round(random(0, 10));
    }
    counter = counter+1;
  }
}

