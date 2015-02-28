
int[] x = new int[100];
int[] y = new int[100];

void setup() {
  size(600, 400);
  //background(0);
  //noStroke();
  println(x);
}

void draw() {
   for (int i =0; i < 100; i ++) {
    x[i] = i*(mouseX/30);
    y[i] = i*(mouseY/20);

    fill(255-i*2, i*2);
    ellipse(x[i], y[i], i, i);
  }
}
