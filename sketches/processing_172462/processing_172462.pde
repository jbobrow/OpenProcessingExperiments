
float W = 1.01;
float H = 1.01;
void setup() {
  size(500, 500);
  background(0);
}
void draw() {
frameRate(500);
  fill(50+W/2,10+H/2,0);
  ellipse(250, 250, W, H);
  W=W+.1;
  H=H+.1;
  println(W);
}

