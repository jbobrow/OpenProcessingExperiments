
void setup() {
  size(350, 350);
 size(500,500);
  background(30);
  smooth();
}
 
int t;
 
void draw() {
  for (int i = 0;i <= 1000;i++) {
    if (i % 4 == 10) {
      noFill();
    }
    else {
      fill(255);
    }
    stroke(60, 0, 255);
    ellipse(width/2+i*cos(t), height/2+i*sin(t), t, t);
    t++;
    if (t > 15) {
      t = 0;
    }
  }
}
