
int[] x = new int [25];
int[] y = new int [25];
int[] size = new int [25];
int[] xs = new int [25];
int[] ys = new int [25];
int[] col = new int [25];
int[] col2 = new int [25];
int[] col3 = new int [25];
int[] opc = new int [25];

void setup () {
  size(500, 500);



  for (int i = 0; i < 25; i++) {
    x[i] = int(random(0, 499));
    y[i] = int(random(0, 500));
    size[i] = int(random(50, 150));
    xs[i] = int(random(1, 5));
    ys[i] = int(random(1, 5));
    col[i] = int(random(1, 255));
    col2[i] = int(random(1, 255));
    col3[i] = int(random(1, 255));
    opc[i] = int(random(1, 255));
         fill(col[i], col2[i], col3[i], opc[i]);
  }
}

void draw () {


  background(255);
  for (int i = 0; i < 25; i++) {
    x[i] = int(x[i] + xs[i]);
    y[i] = int(y[i] + ys[i]);
    fill(col[i], col2[i], col3[i], opc[i]);
    ellipse (x[i], y[i], size[i], size[i]);

    if (x[i] >= width) {
      xs[i] *= -1;
    }
    if (x[i] <= 0) {
      xs[i] *= -1;
    }
    if (y[i] >= height) {
      ys[i] *= -1;
    }
    if (y[i] <= 0) {
      ys[i] *= -1;
    }
    if (mousePressed) {
      // check if it's the left mouse button
      if (mouseButton == LEFT) {
        // check if the last key pressed was a c (for circle)
        
          ellipse(random(width), random(height), 20, 20);
        }
      }
    }
  }
