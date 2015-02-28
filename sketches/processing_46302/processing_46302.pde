
void setup() {
  size(350, 350);
  background(255);
  smooth();
}

int t;

void draw() {
  for (int i = 0;i <= 150;i++) {
    stroke(255, 100, 0);
    ellipse(width/2+i*cos(t), height/2+i*sin(t), t, t);
    t++;
    if (t > 50) {
      t = 0;
    }
  }
}


