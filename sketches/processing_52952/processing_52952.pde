
int n = 10000;
int[] x = new int[n];
int[] y = new int[n];

void setup() {
  size(675, 450);
  background(0);
  smooth();
  frameRate(5);
}

void draw() {
  for (int i=y.length-1; i>0; i--) {
    x[i] = x[i-1];
    y[i] = y[i-1];
  }
  x[0]=mouseX;
  y[0]=mouseY;
  int r = (int)random(150, 255);
  int v = (int)random(150, 255);
  int b = (int)random(150, 255);
  if (mousePressed) {
    stroke(r, v,b);
    line(mouseX, mouseY, pmouseX, pmouseY);
    for (int i=1; i<1000; i++) {
      float d = dist(mouseX, mouseY, x[i], y[i]);
      float p = random(10);
      if (d<=250 && p<9) {
        int h = (int)random(10);
        fill(255);
        rectMode(CENTER);
        rect(x[i], y[i], h, h);
        line(mouseX, mouseY, x[i], y[i]);
      }
    }
  }
}

                
                
