
int[]x;
int[]y;

void setup() {
  size(300, 200);
  smooth();
  x = new int [5];
  y = new int [5];
  for (int i =0 ;i<x.length;i++) {
    x[i] = 50+50*i;
    y[i] = -50+10*i;
  }
}

void draw() {
  background(0);
  for (int i =0 ;i<x.length;i++) {
    y[i]+=1;
    ellipse(x[i], y[i], 7, 7);
    if (y[i]>height) {
      y[i]=0;
    }
  }
}



