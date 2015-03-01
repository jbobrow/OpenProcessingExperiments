
void setup() {
  size(600, 600);
  smooth();
  frameRate(5);
  background(255, 30);
}

void draw() {

  println(frameCount);

  for (float i=10; i<=width; i+=30*frameCount) {
    for (float j=-30; j<=height; j+=80) {

      ivy_green(i, j);

      if (frameCount>=25) {
        break;
      }
    }
  }
}


void ivy_green(float Lx, float Ly) {
  stroke(0, 255, 0, 40);
  fill(0, 255, 0, 40);
  beginShape();
  vertex(Lx, Ly);
  bezierVertex(Lx+30, Ly+30, Lx+40, Ly+50, Lx, Ly+80);
  bezierVertex(Lx-15, Ly+20, Lx-30, Ly+40, Lx, Ly);
  endShape();
}
