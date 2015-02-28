
float [] x = new float [3000];

void setup() {
  size(800, 600);
  smooth();
  noStroke();
  for (int i =0; i< x.length ; i++) {
    x[i] = random(-1000, 200);
  }
}

void draw() {
  background(255, 255, 255);
  fill(255, 126, 180);
  for (int i =0; i< x.length ; i++) {
    x[i] += 0.5;
    float y = i*0.4;
    arc(x[i], y, 12, 12, 0.52, 5.76);
    if (x[i] >= width) {
      x[i] = random(-1000, 200);
    }
  }
}


