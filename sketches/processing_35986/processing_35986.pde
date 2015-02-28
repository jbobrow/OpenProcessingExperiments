
void setup() {
  size(400, 200);
  background(255);
  smooth();
}

int t;

void draw() {
  for (int i = 0;i <= 150;i++) {
    strokeWeight(5);
    stroke(255, 100, 0);
    fill(255, 255, 0);
    ellipse(width/2+i*cos(t*PI), height/2+i*sin(t*PI), t, t);
    t++;
    if (t > 50) {
      t = 0;
    }
  }
}


